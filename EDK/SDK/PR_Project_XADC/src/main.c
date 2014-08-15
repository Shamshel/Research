/*
 * Copyright (c) 2009-2012 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <xparameters.h>
#include <xil_io.h>
#include <xstatus.h>
#include <stdlib.h>
#include "xhwicap_i.h"
#include "xhwicap.h"
/*
#include "xhwicap_parse.h"
#include "xsysace_l.h"
#include "xsysace.h"
#include "sysace_stdio.h"
*/
#include "xuartlite_l.h"
#include "platform.h"

#define WAIT_COUNT 10000
#define GO_DONE_MASK 0x80000000
#define CALIBRATION_TIME 0x8FFFFFFF
#define DEBUG

#define COUNT_PER_DEGREE 8
#define MAX_TEMP 2870

static XHwIcap HwIcap;

void menu()
{
	print("\n\r------------------------ XADC ring oscillator calibration -----------------------\n\r");
	print("print xhwicap status ---------------------------------------------------------- s \n\r");
	print("print this menu --------------------------------------------------------------- m \n\r");
	print("sweep temperature calibration (room temp to 80C) ------------------------------ c \n\r");
	print("test at specific temperature -------------------------------------------------- t \n\r");
	print("reset calibration time -------------------------------------------------------- r \n\r");
	print("set fan speed ----------------------------------------------------------------- f \n\r");
	print("display core temperature (diode) ---------------------------------------------- d \n\r");
	print("display raw output of oscillator module --------------------------------------- r \n\r");

}

int main()
{
    init_platform();

    print("platform initialized!\n\r");

    int status;
    XHwIcap_Config *configPtr;
    char key;

    configPtr = XHwIcap_LookupConfig(HWICAP_BASEADDR);
    if(configPtr == NULL)
    {
    	print("HwIcap lookup failed!\r\n");
    	return XST_FAILURE;

    }

    status = XHwIcap_CfgInitialize(&HwIcap, configPtr, configPtr->BaseAddress);
    if(status != XST_SUCCESS)
    {
    	return XST_FAILURE;

    }

    print("HwIcap initialized!\n\r");

    Xil_Out8(FAN_CONTROLLER_BASEADDR, 255);

    menu();

    while(1 == 1)
    {
    	key = XUartLite_RecvByte(XUART_BASEADDR);

    	unsigned int osc_count = 0;
    	//unsigned int osc_count_average = 0;
    	//int i = 0;

    	switch(key)
    	{
    	// print menu
    	case 'm':
    	case 'M':
    		menu();

    		break;

    	case 's':
    	case 'S':
    		xil_printf("xhwicap status reg: 0x%x\n\r", Xil_In32(HWICAP_BASEADDR + HWICAP_STATUS));

    		break;

    	// sweep calibration
    	case 'c':
    	case 'C':
    		print("sweeping calibration...\n\r");
    		int initialTemp = XADC_raw_temperature()>>4;
    		int lastTemp = initialTemp;
    		int currentTemp = initialTemp;

    		xil_printf("starting at current temperature: 0x%x\n\r", initialTemp);

    		//shutdown fan
    		Xil_Out8(FAN_CONTROLLER_BASEADDR, 0);

    		//startup oscillator (self-heating)
    		Xil_Out32(RP_BASEADDR+0x00, 0x80000000);

    		while(currentTemp < MAX_TEMP)
    		{
    			osc_count = 0;

    			while(currentTemp-lastTemp < COUNT_PER_DEGREE)
    			{
    				currentTemp = XADC_raw_temperature()>>4;
    				//xil_printf("temperature: 0x%x\n\r", currentTemp);

    			}

    			lastTemp = currentTemp;

    			Xil_Out32(RP_BASEADDR+0x00, 0x00000000);
    			sleep_ms(1);
    			Xil_Out32(RP_BASEADDR+0x00, CALIBRATION_TIME);

    			while(((osc_count & GO_DONE_MASK) != GO_DONE_MASK))
    			{
    				osc_count = 0;

    				osc_count = Xil_In32(RP_BASEADDR+04);

    			}

    			//display calibration time
    			xil_printf("value at %x: 0x%x\n\r", currentTemp, (osc_count & ~GO_DONE_MASK));

    		}

    		break;

    	// display core temperature
    	case 'd':
    	case 'D':
    		xil_printf("core temperature: %x (%d)\n\r", (XADC_raw_temperature()>>4), XADC_raw_temperature());
    		break;

    	// specific temperature
    	case 't':
    	case 'T':
    		Xil_Out32(RP_BASEADDR+0x00, 0x00000000);
    		sleep_ms(1);
    		Xil_Out32(RP_BASEADDR+0x00, CALIBRATION_TIME);

    		while(((osc_count & GO_DONE_MASK) != GO_DONE_MASK))
    		{
    			osc_count = 0;

    			osc_count = Xil_In32(RP_BASEADDR+04);

    		}

    		xil_printf("counter result: 0x%x at core temperature: %x (%d)\n\r", osc_count, XADC_raw_temperature()>>4, XADC_raw_temperature()>>4);
    		break;

    	case 'r':
    	case 'R':
    		Xil_Out32(RP_BASEADDR+0x00, CALIBRATION_TIME);
    		xil_printf("ring oscillator input reg: 0x%x\n\r", Xil_In32(RP_BASEADDR + 0x00));

    		while(key != 'q' && key != 'Q')
    		{
    			xil_printf("ring oscillator output reg: 0x%x\n\r", Xil_In32(RP_BASEADDR + 0x04));
    			key = XUartLite_RecvByte(XUART_BASEADDR);

    		}

    		Xil_Out32(RP_BASEADDR+0x00, 0x00000000);
    		break;

    	case 'f':
    	case 'F':
    		print("set fan speed (0-9):");
    		key = XUartLite_RecvByte(XUART_BASEADDR);

    		//xil_printf("read: %d\n\r", key);

    		switch(key)
    		{
    		case '0':
    			Xil_Out8(FAN_CONTROLLER_BASEADDR, 0);
    			break;

    		case '1':
    			Xil_Out8(FAN_CONTROLLER_BASEADDR, 25);
    			break;

    		case '2':
    			Xil_Out8(FAN_CONTROLLER_BASEADDR, 51);
    			break;

    		case '3':
    			Xil_Out8(FAN_CONTROLLER_BASEADDR, 76);
    			break;

    		case '4':
    			Xil_Out8(FAN_CONTROLLER_BASEADDR, 102);
    			break;

    		case '5':
    			Xil_Out8(FAN_CONTROLLER_BASEADDR, 127);
    			break;

    		case '6':
    			Xil_Out8(FAN_CONTROLLER_BASEADDR, 153);
    			break;

    		case '7':
    			Xil_Out8(FAN_CONTROLLER_BASEADDR, 178);
    			break;

    		case '8':
    			Xil_Out8(FAN_CONTROLLER_BASEADDR, 204);
    			break;

    		case '9':
    			Xil_Out8(FAN_CONTROLLER_BASEADDR, 255);
    			break;

    		default:
    			Xil_Out8(FAN_CONTROLLER_BASEADDR, 255);
    			break;

    		}

    		print("\n\r");

    		break;

    		default:
    			menu();

    			break;

    	}

    }

    return 0;

}
