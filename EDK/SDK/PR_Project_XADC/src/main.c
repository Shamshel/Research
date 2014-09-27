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
#include "limits.h"

/*
#include "xhwicap_parse.h"
#include "xsysace_l.h"
#include "xsysace.h"
#include "sysace_stdio.h"
*/
#include "xuartlite_l.h"
#include "platform.h"

//adjustable constants
#define WAIT_COUNT 10000
#define GO_DONE_MASK 0x80000000
#define CALIBRATION_TIME 0x8FFFFFFF
#define SELF_HEAT 0x80000000
#define USAGE_WEIGHT 1

//physical constants
#define COUNT_PER_DEGREE 8
#define MAX_TEMP 2870
#define NUM_PARTITIONS 14

//debug constant
#define DEBUG


//globals
static XHwIcap HwIcap;

//an array that contains the base addresses of the reconfigurable modules
unsigned int baseaddrs[NUM_PARTITIONS] =
	{
		XPAR_RECONFIGURABLE_PERIPHERIALS_0_BASEADDR, XPAR_RECONFIGURABLE_PERIPHERIALS_1_BASEADDR, XPAR_RECONFIGURABLE_PERIPHERIALS_2_BASEADDR, XPAR_RECONFIGURABLE_PERIPHERIALS_3_BASEADDR,
		XPAR_RECONFIGURABLE_PERIPHERIALS_4_BASEADDR, XPAR_RECONFIGURABLE_PERIPHERIALS_5_BASEADDR, XPAR_RECONFIGURABLE_PERIPHERIALS_6_BASEADDR, XPAR_RECONFIGURABLE_PERIPHERIALS_7_BASEADDR,
		XPAR_RECONFIGURABLE_PERIPHERIALS_8_BASEADDR, XPAR_RECONFIGURABLE_PERIPHERIALS_9_BASEADDR, XPAR_RECONFIGURABLE_PERIPHERIALS_10_BASEADDR, XPAR_RECONFIGURABLE_PERIPHERIALS_11_BASEADDR,
		XPAR_RECONFIGURABLE_PERIPHERIALS_12_BASEADDR, XPAR_RECONFIGURABLE_PERIPHERIALS_13_BASEADDR
	};

//a weighted 2-D matrix that represents a complete graph of the nodes with
//weight corresponding to physical distance
char position_data[NUM_PARTITIONS][NUM_PARTITIONS] =
	{    //1  2  3  0  4  5  6  7  8  9  10 11 12 13
		{ 3, 2, 1, 0, 1, 2, 3, 3, 2, 1, 1, 1, 2, 3 }, //0
		{ 0, 1, 2, 3, 4, 5, 6, 1, 1, 2, 3, 4, 5, 6 }, //1
		{ 1, 0, 1, 2, 3, 4, 5, 1, 1, 1, 2, 3, 4, 5 }, //2
		{ 2, 1, 0, 1, 2, 3, 4, 2, 1, 1, 1, 2, 3, 4 }, //3
		{ 4, 3, 2, 1, 0, 1, 2, 4, 3, 2, 1, 1, 1, 2 }, //4
		{ 5, 4, 3, 2, 1, 0, 1, 5, 4, 3, 2, 1, 1, 1 }, //5
		{ 6, 5, 4, 3, 2, 1, 0, 6, 5, 4, 3, 2, 1, 1 }, //6
		{ 1, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6 }, //7
		{ 1, 1, 1, 2, 3, 4, 5, 1, 0, 1, 2, 3, 4, 5 }, //8
		{ 2, 1, 1, 1, 2, 3, 4, 2, 1, 0, 1, 2, 3, 4 }, //9
		{ 3, 2, 1, 1, 1, 2, 3, 3, 2, 1, 0, 1, 2, 3 }, //10
		{ 4, 3, 2, 1, 1, 1, 2, 4, 3, 2, 1, 0, 1, 2 }, //11
		{ 5, 4, 3, 2, 1, 1, 1, 5, 4, 3, 2, 1, 0, 1 }, //12
		{ 6, 5, 4, 3, 2, 1, 1, 6, 5, 4, 3, 2, 1, 0 }, //13

	};

//an array that stores historic usage information about each partition
unsigned int usage[NUM_PARTITIONS] = {0};

//an array that stores temporary temperature readings from each partition
unsigned int temperature_reading[NUM_PARTITIONS];

//an array that stores the placement results of each algorithm iteration
unsigned char block_placement[NUM_PARTITIONS];

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
	print("run algorithm once ------------------------------------------------------------ a \n\r");

}

/*
*
* Reliability Algorithm:
* 	parameters:
* 		inputs:*
* 			unsigned int base_addrs[NUM_PARTITIONS]:
*
* 			unsigned char num_active:
*
* 			unsigned int usages[NUM_PARTITIONS]:
*
*			char path_weights[NUM_PARTITIONS][NUM_PARTITONS]:
*
* 		outputs:
* 			unsigned int temperature_readings[NUM_PARTITIONS]:
*
* 			unsigned char block_placements[NUM_PARITITIONS]:
*
*	globals:
*
*
* 	behavior:
*
*/
int algorithm(unsigned int base_addrs[],
	unsigned char num_active,
	unsigned int usages[],
	char path_weights[][NUM_PARTITIONS],
	unsigned int temperature_readings[],
	unsigned char block_placements[])
{
	//indicies
	int i = 0;
	int j = 0;

	//status vars
	int partitions_parsed = 0;
	int blocks_placed = 0;
	int placement_weight = 0;
	int highest_placement_weight = INT_MIN;
	int place_block = 0;

	//test and error vars
	unsigned int temperature_read = 0;
	char partitions_exhausted = 0;

#ifdef DEBUG
		print("Starting algorithm.\n\r");

#endif

	//Start up each oscillator, runtime will take a few s (approx 2 in total at current timeout).
	for (i = 0; i < NUM_PARTITIONS; i++)
	{
		reset_oscillator(base_addrs[i] + 0x00, CALIBRATION_TIME);

#ifdef DEBUG
		xil_printf("Oscillator %d startup...\n\r", i);

#endif

	}

	//Gather temperature data for reliability statistics, in a real-world implementation
	//of this algorithm, programming the partial bitstream for the ring oscillator
	//for every cycle of the algorithm could introduce unacceptable overhead costs.
	while (partitions_parsed < NUM_PARTITIONS)
	{
		for (i = 0; i < NUM_PARTITIONS; i++)
		{
			temperature_read = Xil_In32(baseaddrs[i]+0x04);

			if ((temperature_read & GO_DONE_MASK) == GO_DONE_MASK)
			{
				partitions_parsed++;

				temperature_readings[i] = ~GO_DONE_MASK & temperature_read;

#ifdef DEBUG
				xil_printf("module %d... done.\n\r", i);

#endif

			}

		}

	}

	//clear current placements, increment usages
	for (i = 0; i < NUM_PARTITIONS; i++)
	{
		if (block_placements[i] == 1)
		{
			usages[i]++;

		}

		block_placements[i] = 0;

	}

	/*
	//all modules done with temperature data, output in friendly format:
	for(i = 0; i < NUM_PARTITIONS; i++)
	{
		printf("%d\n\r", temperature_readings[i]);

	}
	*/

	//begin placement
	while(1==1)
	{
		//printf("blocks_placed: %d\n\r", blocks_placed);

		//have blocks been been placed?
		if (blocks_placed == num_active)
		{
#ifdef DEBUG
			print("SUCCESS: all partitions placed\n\r");

#endif

			return XST_SUCCESS;

		}

		//no
		else
		{
			//are available resources exhausted?
			partitions_exhausted = 1;

#ifndef DEBUG
			print("checking for exhausted partitions... ");

#endif

			for (i = 0; i < NUM_PARTITIONS; i++)
			{
				if (usages[i] != -1 && block_placements[i] != 1)
				{
					partitions_exhausted = 0;

				}
			}

			//yes
			if (partitions_exhausted == 1)
			{
				//insufficent partitions remaining for number of active modules
#ifdef DEBUG
				print("ERROR: insufficent partitions\n\r");

#endif

				return XST_FAILURE;

			}

			//no
			else
			{
#ifndef DEBUG
				print("done.\n\r");

#endif

				//search for appropriate partition placements
				for (i = 0; i < NUM_PARTITIONS; i++)
				{
					//exclude blacklisted (broken) and placed partitions
					if (usages[i] != -1 && block_placements[i] != 1)
					{
						for (j = 0; j < NUM_PARTITIONS; j++)
						{
							if (usages[j] != -1)
							{
								placement_weight += (path_weights[i][j] * usages[j]) - (USAGE_WEIGHT*usages[i]);

							}

						}

						if (placement_weight > highest_placement_weight)
						{
							highest_placement_weight = placement_weight;
							place_block = i;

						}

					}

				}

				//place block
				block_placements[place_block] = 1;
				blocks_placed++;

			}

		}

	}

}

void printAlgorithmResults(unsigned int temperature_readings[], unsigned char block_placement[])
{
	int i = 0;

	xil_printf("temperature readings:\n\r");
	for(i = 0; i < NUM_PARTITIONS; i++)
	{
		xil_printf("%x", temperature_readings[i]);

		if(i%2 == 1)
		{
			xil_printf("\n\r");

		}

		else
		{
			xil_printf(" , ");

		}

	}

	xil_printf("placement results:\n\r");
	for(i = 0; i < NUM_PARTITIONS; i++)
	{
		xil_printf("%d", block_placement[i]);

		if(i%2 == 1)
		{
			xil_printf("\n\r");

		}

		else
		{
			xil_printf(" , ");

		}

	}

}

int main()
{
	unsigned int osc_count = 0;
	unsigned char num_active = 0;
	int index = 0;
	int i = 0;

    init_platform();


    print("Initializing oscillators:\n\r");
    //initialize all oscillators to known good state
    for(index = 0; index < NUM_PARTITIONS; index++)
    {
    	reset_oscillator(baseaddrs[index], CALIBRATION_TIME);

    }

    while(num_active < NUM_PARTITIONS)
    {
		for(index = 0; index < NUM_PARTITIONS; index++)
		{
			while(((osc_count & GO_DONE_MASK) != GO_DONE_MASK))
			{
				osc_count = 0;

				osc_count = Xil_In32(RP_BASEADDR+04);

			}

			num_active++;

			xil_printf("%d modules initialized\n\r", num_active);

		}

    }

    num_active = 0;

    //print("platform initialized!\n\r");

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

    for(index = 0; index < NUM_PARTITIONS; index++)
    {
    	reset_oscillator(baseaddrs[index], SELF_HEAT);

    }

    //print("HwIcap initialized!\n\r");

    Xil_Out8(FAN_CONTROLLER_BASEADDR, 255);

    menu();

    while(1 == 1)
    {
    	key = XUartLite_RecvByte(XUART_BASEADDR);

    	osc_count = 0;

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
    		reset_oscillator(RP_BASEADDR, SELF_HEAT);

    		while(currentTemp < MAX_TEMP)
    		{
    			osc_count = 0;

    			while(currentTemp-lastTemp < COUNT_PER_DEGREE)
    			{
    				currentTemp = XADC_raw_temperature()>>4;
    				//xil_printf("temperature: 0x%x\n\r", currentTemp);

    			}

    			lastTemp = currentTemp;

    			reset_oscillator(RP_BASEADDR, CALIBRATION_TIME);

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
    		sleep_ms(100);

    		reset_oscillator(RP_BASEADDR, CALIBRATION_TIME);

    		while(((osc_count & GO_DONE_MASK) != GO_DONE_MASK))
    		{
    			osc_count = 0;

    			osc_count = Xil_In32(RP_BASEADDR+04);

    		}

    		xil_printf("counter result: 0x%x at core temperature: %x (%d)\n\r", osc_count, XADC_raw_temperature()>>4, XADC_raw_temperature()>>4);
    		break;

    	case 'r':
    	case 'R':
    		reset_oscillator(RP_BASEADDR, CALIBRATION_TIME);
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

    	case 'a':
    	case 'A':

    		/*
    		xil_printf("enter number of active modules (0-F): ");

    		key = XUartLite_RecvByte(XUART_BASEADDR);

    		switch(key)
    		{
    		case '0':
    			num_active = 0;
    			break;

    		case '1':
    			num_active = 1;
    			break;

    		case '2':
    			num_active = 2;
    			break;

    		case '3':
    			num_active = 3;
    			break;

    		case '4':
    			num_active = 4;
    			break;

    		case '5':
    			num_active = 5;
    			break;

    		case '6':
    			num_active = 6;
    			break;

    		case '7':
    			num_active = 7;
    			break;

    		case '8':
    			num_active = 8;
    			break;

    		case '9':
    			num_active = 9;
    			break;

    		case 'A':
    		case 'a':
    			num_active = 10;
    			break;

    		case 'B':
    		case 'b':
    			num_active = 11;
    			break;

    		case 'C':
    		case 'c':
    			num_active = 12;
    			break;

    		case 'D':
    		case 'd':
    			num_active = 13;
    			break;

    		case 'E':
    		case 'e':
    			num_active = 14;
    			break;

    		case 'F':
    		case 'f':
    			num_active = 15;
    			break;

    		default:
    			num_active = 0;
    			break;

    		}

    		*/

    		num_active = 1;

    		print("running algorithm:\n\r");

    		algorithm(baseaddrs,
    			num_active,
    			usage,
    			position_data,
    			temperature_reading,
    			block_placement);

    		print("algorithm completed:\n\r");
    		printAlgorithmResults(temperature_reading, block_placement);


    		break;

    		default:
    			menu();

    			break;

    	}

    }

    return 0;

}
