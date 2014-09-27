/******************************************************************************
*
* (c) Copyright 2010-2012 Xilinx, Inc. All rights reserved.
*
* This file contains confidential and proprietary information of Xilinx, Inc.
* and is protected under U.S. and international copyright and other
* intellectual property laws.
*
* DISCLAIMER
* This disclaimer is not a license and does not grant any rights to the
* materials distributed herewith. Except as otherwise provided in a valid
* license issued to you by Xilinx, and to the maximum extent permitted by
* applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL
* FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS,
* IMPLIED, OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF
* MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE;
* and (2) Xilinx shall not be liable (whether in contract or tort, including
* negligence, or under any other theory of liability) for any loss or damage
* of any kind or nature related to, arising under or in connection with these
* materials, including for any direct, or any indirect, special, incidental,
* or consequential loss or damage (including loss of data, profits, goodwill,
* or any type of loss or damage suffered as a result of any action brought by
* a third party) even if such damage or loss was reasonably foreseeable or
* Xilinx had been advised of the possibility of the same.
*
* CRITICAL APPLICATIONS
* Xilinx products are not designed or intended to be fail-safe, or for use in
* any application requiring fail-safe performance, such as life-support or
* safety devices or systems, Class III medical devices, nuclear facilities,
* applications related to the deployment of airbags, or any other applications
* that could lead to death, personal injury, or severe property or
* environmental damage (individually and collectively, "Critical
* Applications"). Customer assumes the sole risk and liability of any use of
* Xilinx products in Critical Applications, subject only to applicable laws
* and regulations governing limitations on product liability.
*
* THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE
* AT ALL TIMES.
*
******************************************************************************/

#include "xparameters.h"
#include "xil_io.h"
#include "xil_cache.h"
#include "xstatus.h"
#include "xil_printf.h"
//#include "xuartlite.h"

#include "platform_config.h"
#include "platform.h"

/*
 * Uncomment the following line if ps7 init source files are added in the
 * source directory for compiling example outside of SDK.
 */
/*#include "ps7_init.h"*/

#ifdef STDOUT_IS_16550
 #include "xuartns550_l.h"

 #define UART_BAUD 9600
#endif

void
enable_caches()
{
#ifdef __PPC__
    Xil_ICacheEnableRegion(CACHEABLE_REGION_MASK);
    Xil_DCacheEnableRegion(CACHEABLE_REGION_MASK);
#elif __MICROBLAZE__
#ifdef XPAR_MICROBLAZE_USE_ICACHE
    Xil_ICacheEnable();
#endif
#ifdef XPAR_MICROBLAZE_USE_DCACHE
    Xil_DCacheEnable();
#endif
#endif
}

void sleep_ms(unsigned int ms)
{
	unsigned int i = 0;
	for(i; i < (ms*100000); i++);

}

void sleep_us(unsigned int us)
{
	unsigned int i = 0;
	for(i; i < (us*100); i++);

}


void
disable_caches()
{
    Xil_DCacheDisable();
    Xil_ICacheDisable();
}

void
init_uart()
{
#ifdef STDOUT_IS_16550
    XUartNs550_SetBaud(STDOUT_BASEADDR, XPAR_XUARTNS550_CLOCK_HZ, UART_BAUD);
    XUartNs550_SetLineControlReg(STDOUT_BASEADDR, XUN_LCR_8_DATA_BITS);
#endif
#ifdef STDOUT_IS_PS7_UART
    /* Bootrom/BSP configures PS7 UART to 115200 bps */
#endif
}

void init_XADC()
{
	//initialize the CONVST register for no update on temp bus, disallow temperature bus
	//update
	Xil_Out32(XADC_BASEADDR + CONVSTR, 0x03E8);

	//set XADC to use event driven sampling bipolar mode
	Xil_Out32(XADC_BASEADDR + CONFIG_0, 0x8600);

	//set XADC single channel mode
	Xil_Out32(XADC_BASEADDR + CONFIG_1, 0x0F0F);

	//set division ratio to 2, enable all blocks
	Xil_Out32(XADC_BASEADDR + CONFIG_2, 0x0000);

}

int XADC_raw_temperature()
{
	//set sequence to the temperature sensor
	//Xil_Out32(XADC_BASEADDR + CONFIG_0, 0x0600);

	//begin conversion
	//Xil_Out32(XADC_BASEADDR + CONVSTR, 0x03E9);
	//Xil_Out32(XADC_BASEADDR + CONVSTR, 0x03E8);

	//wait for EOC
	//char EOC = 0;

	//xil_printf("entering loop\n\r");

	//while(!EOC)
	//{
	//	EOC = Xil_In32(XADC_BASEADDR + IPISR) & 0x20;
	//	sleep();
		//xil_printf("looping\n\r");


	//}

	return Xil_In32(XADC_BASEADDR + TEMPERATURE_REG);

}

float XADC_core_temperature()
{
	//see page 30 of UG480
	return ((float)(XADC_raw_temperature())*503.975/4096)-273.15;

}

int XADC_raw_voltage()
{
	//set sequence to Vccint
	Xil_Out32(XADC_BASEADDR + CONFIG_0, 0x0601);

	//begin conversion
	Xil_Out32(XADC_BASEADDR + CONVSTR, 0x0001);

	//wait for EOC
	char EOC = 0;

	while(!EOC)
	{
		EOC = Xil_In32(XADC_BASEADDR + IPISR) & 0x20;
		sleep_ms(1);
		//xil_printf("looping\n\r");

	}

	return Xil_In32(XADC_BASEADDR + VCCINT_REG);

}

float XADC_core_voltage()
{
	//see page 31 of UG480
	return ((float)(XADC_raw_voltage()>>4)/4096.0)*3;

}

void reset_oscillator(unsigned int base_addr, unsigned int calibration_time)
{
	Xil_Out32(base_addr+0x00, 0x00000000);
	sleep_us(100);
	Xil_Out32(base_addr+0x00, calibration_time);

}


void
init_platform()
{
    /*
     * If you want to run this example outside of SDK,
     * uncomment the following line and also #include "ps7_init.h" at the top.
     * Make sure that the ps7_init.c and ps7_init.h files are included
     * along with this example source files for compilation.
     */

    /* ps7_init();*/
    enable_caches();
    init_uart();
}



void
cleanup_platform()
{
    disable_caches();
}
