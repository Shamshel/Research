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

typedef struct
{
	//partition data:
	unsigned int baseaddr;
	char* position_data;
	unsigned int usage;
	unsigned int temperature_reading;
	unsigned char block_active;

	//partition flags:
	unsigned char parsed;

} partition_information;

//an array that contains the base addresses of the reconfigurable modules
unsigned int baseaddrs[NUM_PARTITIONS] = {
		XPAR_RECONFIGURABLE_PERIPHERIALS_0_BASEADDR,
		XPAR_RECONFIGURABLE_PERIPHERIALS_1_BASEADDR,
		XPAR_RECONFIGURABLE_PERIPHERIALS_2_BASEADDR,
		XPAR_RECONFIGURABLE_PERIPHERIALS_3_BASEADDR,
		XPAR_RECONFIGURABLE_PERIPHERIALS_4_BASEADDR,
		XPAR_RECONFIGURABLE_PERIPHERIALS_5_BASEADDR,
		XPAR_RECONFIGURABLE_PERIPHERIALS_6_BASEADDR,
		XPAR_RECONFIGURABLE_PERIPHERIALS_7_BASEADDR,
		XPAR_RECONFIGURABLE_PERIPHERIALS_8_BASEADDR,
		XPAR_RECONFIGURABLE_PERIPHERIALS_9_BASEADDR,
		XPAR_RECONFIGURABLE_PERIPHERIALS_10_BASEADDR,
		XPAR_RECONFIGURABLE_PERIPHERIALS_11_BASEADDR,
		XPAR_RECONFIGURABLE_PERIPHERIALS_12_BASEADDR,
		XPAR_RECONFIGURABLE_PERIPHERIALS_13_BASEADDR };

//a weighted 2-D matrix that represents a complete graph of the nodes with
//weight corresponding to physical distance
char position_data[NUM_PARTITIONS][NUM_PARTITIONS] =
		{ 		//1  2  3  0  4  5  6  7  8  9  10 11 12 13
				{ 0, 3, 2, 1, 1, 2, 3, 3, 2, 1, 1, 1, 2, 3 }, //0
				{ 3, 0, 1, 2, 4, 5, 6, 1, 1, 2, 3, 4, 5, 6 }, //1
				{ 2, 1, 0, 1, 3, 4, 5, 1, 1, 1, 2, 3, 4, 5 }, //2
				{ 1, 2, 1, 0, 2, 3, 4, 2, 1, 1, 1, 2, 3, 4 }, //3
				{ 1, 4, 3, 2, 0, 1, 2, 4, 3, 2, 1, 1, 1, 2 }, //4
				{ 2, 5, 4, 3, 1, 0, 1, 5, 4, 3, 2, 1, 1, 1 }, //5
				{ 3, 6, 5, 4, 2, 1, 0, 6, 5, 4, 3, 2, 1, 1 }, //6
				{ 3, 1, 1, 2, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6 }, //7
				{ 2, 1, 1, 1, 3, 4, 5, 1, 0, 1, 2, 3, 4, 5 }, //8
				{ 1, 2, 1, 1, 2, 3, 4, 2, 1, 0, 1, 2, 3, 4 }, //9
				{ 1, 3, 2, 1, 1, 2, 3, 3, 2, 1, 0, 1, 2, 3 }, //10
				{ 1, 4, 3, 2, 1, 1, 2, 4, 3, 2, 1, 0, 1, 2 }, //11
				{ 2, 5, 4, 3, 1, 1, 1, 5, 4, 3, 2, 1, 0, 1 }, //12
				{ 3, 6, 5, 4, 2, 1, 1, 6, 5, 4, 3, 2, 1, 0 }, //13

		};

//an array that stores historic usage information about each partition
//unsigned int partition_usage[NUM_PARTITIONS] = { 0 };

//an array that stores temporary temperature readings from each partition
//unsigned int temperature_reading[NUM_PARTITIONS];

//an array that stores the placement results of each algorithm iteration
//unsigned char block_placement[NUM_PARTITIONS];

void reset_oscillator(unsigned int base_addr, unsigned int calibration_time)
{
	Xil_Out32(base_addr+0x00, 0x00000000);
	sleep_us(1000);
	Xil_Out32(base_addr+0x00, calibration_time);

}

void menu() {
	print("\n\r------------------------ XADC ring oscillator calibration -----------------------\n\r");
	print("print this menu --------------------------------------------------------------- m \n\r");
	print("print partition status -------------------------------------------------------- s \n\r");
	print("sweep temperature calibration (room temp to 80C) ------------------------------ c \n\r");
	print("test at specific temperature -------------------------------------------------- t \n\r");
	print("reset calibration time -------------------------------------------------------- r \n\r");
	print("set fan speed ----------------------------------------------------------------- f \n\r");
	print("display core temperature (diode) ---------------------------------------------- d \n\r");
	print("display oscillator temperature ------------------------------------------------ r \n\r");
	print("run algorithm once ------------------------------------------------------------ a \n\r");

}

/*
 *
 * Reliability Algorithm:
 * 	parameters:
 * 		inputs:
 *
 * 		outputs:
 *
 *	globals:
 *
 *
 * 	behavior:
 *
 */
//int algorithm(unsigned int base_addrs[], unsigned char num_active,
//		unsigned int usages[], char path_weights[][NUM_PARTITIONS],
//		unsigned int temperature_readings[], unsigned char block_placements[])
int algorithm(partition_information partition[], unsigned char num_active)
{
	//indicies
	int i = 0;
	int j = 0;

	//status vars
	int placement_weight = 0;
	int highest_placement_weight = INT_MIN;
	int highest_place_block = -1;
	unsigned char num_placed = 0;

	//test, error vars, and flags
	char partitions_exhausted = 0;
	char done = 0;

#ifdef DEBUG
	print("Starting algorithm.\n\r");

#endif

	//intialize each partition
	for (i = 0; i < NUM_PARTITIONS; i++)
	{
		partition[i].parsed = 0;

		if(partition[i].block_active)
		{
			partition[i].usage++;
			partition[i].block_active = 0;

		}

		//start up oscillators
		reset_oscillator(partition[i].baseaddr + 0x00, CALIBRATION_TIME);

#ifdef DEBUG
		xil_printf("Oscillator %d startup...\n\r", i);

#endif

	}

	//Gather temperature data for reliability statistics, in a real-world implementation
	//of this algorithm, programming the partial bitstream for the ring oscillator
	//for every cycle of the algorithm could introduce unacceptable overhead costs.
	while (!done)
	{
		done = 1;

		for (i = 0; i < NUM_PARTITIONS; i++)
		{
			partition[i].temperature_reading = Xil_In32(partition[i].baseaddr+0x04);

			if ((partition[i].temperature_reading & GO_DONE_MASK) == GO_DONE_MASK)
			{
				//partition[i].temperature_reading = partition[i].temperature_reading;

			}

			else
			{
				done = 0;

			}

		}

	}

	//disable each oscillator to prevent self-heating
	for(i = 0; i < NUM_PARTITIONS; i++)
	{
		reset_oscillator(partition[i].baseaddr, 0x00);

	}

	//begin placement
	while (1 == 1)
	{
		//Checking for exhausted partitions in this manner ensures that
		//partitions that are not disabled are still placed.

		//are available resources exhausted?
		partitions_exhausted = 1;

#ifdef DEBUG
		print("checking for exhausted partitions... ");

#endif

		for (i = 0; i < NUM_PARTITIONS; i++)
		{
			if (partition[i].usage != -1 && partition[i].block_active != 1)
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
		else {
#ifdef DEBUG
			print("done.\n\r");

#endif

			//search for appropriate partition placements
			for (i = 0; i < NUM_PARTITIONS; i++)
			{
				//exclude blacklisted (broken) and placed partitions
				if (partition[i].usage != -1 && partition[i].block_active != 1)
				{
					placement_weight = 0;

					for (j = 0; j < NUM_PARTITIONS; j++)
					{

						placement_weight += (partition[i].position_data[j]*partition[j].usage)	- (USAGE_WEIGHT * partition[i].usage);

#ifdef DEBUG
						//xil_printf("placement weight for module %d to %d: %d\n\r", i, j, placement_weight);

#endif
					}

#ifdef DEBUG
					xil_printf("placement weight for module %d: %d\n\r", i, placement_weight);

#endif

					if (placement_weight > highest_placement_weight)
					{
						highest_placement_weight = placement_weight;
						highest_place_block = i;

					}

				}

			}

			//place block
			partition[highest_place_block].block_active = 1;
			highest_place_block = 0;
			highest_placement_weight = INT_MIN;
			num_placed++;

			if(num_placed == num_active)
			{
				break;

			}
			//block_placements[place_block] = 1;
			//blocks_placed++;

		}

	}

#ifdef DEBUG
	print("SUCCESS: all partitions placed\n\r");

#endif
	for(i = 0; i < NUM_PARTITIONS; i++)
	{
		if(partition[i].block_active)
		{
			reset_oscillator(partition[i].baseaddr, SELF_HEAT);

		}

	}


	return XST_SUCCESS;

}


void printAlgorithmResults(partition_information partition[])
{
	int i = 0;

	xil_printf("partition number:\n\r");

	for (i = 1; i < 4; i++)
	{
		xil_printf("%x (%d), %x (%d)\n\r", i, i, i+6, i+6);

	}

	xil_printf("%x (%d), %x (%d)\n\r", 0, 0, 10, 10);

	for (i = 4; i < 7; i++)
	{
		xil_printf("%x (%d), %x (%d)\n\r", i, i, i+7, i+7);

	}

	xil_printf("temperature readings:\n\r");

	for (i = 1; i < 4; i++)
	{
		xil_printf("%x (%d), %x (%d)\n\r", partition[i].temperature_reading, partition[i].temperature_reading, partition[i+6].temperature_reading, partition[i+6].temperature_reading);

	}

	xil_printf("%x (%d), %x (%d)\n\r", partition[0].temperature_reading, partition[0].temperature_reading, partition[10].temperature_reading, partition[10].temperature_reading);

	for (i = 4; i < 7; i++)
	{
		xil_printf("%x (%d), %x (%d)\n\r", partition[i].temperature_reading, partition[i].temperature_reading, partition[i+7].temperature_reading, partition[i+7].temperature_reading);

	}

	xil_printf("placement results:\n\r");

	for (i = 1; i < 4; i++)
	{
		xil_printf("%x (%d), %x (%d)\n\r", partition[i].block_active, partition[i].block_active, partition[i+6].block_active, partition[i+6].block_active);

	}

	xil_printf("%x (%d), %x (%d)\n\r", partition[0].block_active, partition[0].block_active, partition[10].block_active, partition[10].block_active);

	for (i = 4; i < 7; i++)
	{
		xil_printf("%x (%d), %x (%d)\n\r", partition[i].block_active, partition[i].block_active, partition[i+7].block_active, partition[i+7].block_active);

	}

	xil_printf("useage results:\n\r");

	for (i = 1; i < 4; i++)
	{
		xil_printf("%x (%d), %x (%d)\n\r", partition[i].usage, partition[i].usage, partition[i+6].usage, partition[i+6].usage);

	}

	xil_printf("%x (%d), %x (%d)\n\r", partition[0].usage, partition[0].usage, partition[10].usage, partition[10].usage);

	for (i = 4; i < 7; i++)
	{
		xil_printf("%x (%d), %x (%d)\n\r", partition[i].usage, partition[i].usage, partition[i+7].usage, partition[i+7].usage);

	}

}

int switch_char(char key)
{
	int result;

	switch (key)
	{
		case '0':
			result = 0;
			break;

		case '1':
			result = 1;
			break;

		case '2':
			result = 2;
			break;

		case '3':
			result = 3;
			break;

		case '4':
			result = 4;
			break;

		case '5':
			result = 5;
			break;

		case '6':
			result = 6;
			break;

		case '7':
			result = 7;
			break;

		case '8':
			result = 8;
			break;

		case '9':
			result = 9;
			break;

		case 'A':
		case 'a':
			result = 10;
			break;

		case 'B':
		case 'b':
			result = 11;
			break;

		case 'C':
		case 'c':
			result = 12;
			break;

		case 'D':
		case 'd':
			result = 13;
			break;

		case 'E':
		case 'e':
			result = 14;
			break;

		case 'F':
		case 'f':
			result = 15;
			break;

		default:
			result = 0;
			break;

	}

	return result;

}

int main()
{
	unsigned int osc_count = 0;
	unsigned char num_active = 0;
	unsigned char selected_osc = 0;
	int index = 0;
	char key;
	char done;
	int status;

	partition_information partition[NUM_PARTITIONS];

	//initialize partitions
	for(index = 0; index < NUM_PARTITIONS; index++)
	{
		partition[index].baseaddr = baseaddrs[index];
		partition[index].position_data = position_data[index];
		partition[index].usage = 0;
		partition[index].temperature_reading = 0;
		partition[index].block_active = 0;
		partition[index].parsed = 0;

	}

	init_platform();

	print("Initializing oscillators:\n\r");
	//initialize all oscillators to known good state
	for (index = 0; index < NUM_PARTITIONS; index++)
	{
		reset_oscillator(partition[index].baseaddr, CALIBRATION_TIME);

	}

	while (num_active < NUM_PARTITIONS)
	{
		for (index = 0; index < NUM_PARTITIONS; index++)
		{
			while (((osc_count & GO_DONE_MASK) != GO_DONE_MASK))
			{
				osc_count = 0;

				osc_count = Xil_In32(RP_BASEADDR+04);

			}

			num_active++;

			xil_printf("module %d initialized\n\r", num_active);

		}

	}

	num_active = 0;

	//print("platform initialized!\n\r");

	XHwIcap_Config *configPtr;

	configPtr = XHwIcap_LookupConfig(HWICAP_BASEADDR);
	if (configPtr == NULL)
	{
		print("HwIcap lookup failed!\r\n");
		return XST_FAILURE;

	}

	status = XHwIcap_CfgInitialize(&HwIcap, configPtr, configPtr->BaseAddress);
	if (status != XST_SUCCESS)
	{
		return XST_FAILURE;

	}

	for (index = 0; index < NUM_PARTITIONS; index++)
	{
		reset_oscillator(baseaddrs[index], SELF_HEAT);

	}

	//print("HwIcap initialized!\n\r");

	Xil_Out8(FAN_CONTROLLER_BASEADDR, 255);

	menu();

	while (1 == 1)
	{
		key = XUartLite_RecvByte(XUART_BASEADDR);

		osc_count = 0;

		switch (key)
		{
			// print menu
			case 'm':
			case 'M':
				menu();

				break;

			case 's':
			case 'S':
				printAlgorithmResults(partition);

				break;

				// sweep calibration
			case 'c':
			case 'C':
				print("sweeping calibration...\n\r");
				int initialTemp = XADC_raw_temperature() >> 4;
				int lastTemp = initialTemp;
				int currentTemp = initialTemp;

				xil_printf("starting at current temperature: 0x%x\n\r",
						initialTemp);

				//shutdown fan
				Xil_Out8(FAN_CONTROLLER_BASEADDR, 0);

				//startup oscillator (self-heating)
				reset_oscillator(RP_BASEADDR, SELF_HEAT);

				while (currentTemp < MAX_TEMP)
				{
					osc_count = 0;

					while (currentTemp - lastTemp < COUNT_PER_DEGREE)
					{
						currentTemp = XADC_raw_temperature() >> 4;
						//xil_printf("temperature: 0x%x\n\r", currentTemp);

					}

					lastTemp = currentTemp;

					reset_oscillator(RP_BASEADDR, CALIBRATION_TIME);

					while (((osc_count & GO_DONE_MASK) != GO_DONE_MASK))
					{
						osc_count = 0;

						osc_count = Xil_In32(RP_BASEADDR+04);

					}

					//display calibration time
					xil_printf("value at %x: 0x%x\n\r", currentTemp,
							(osc_count & ~GO_DONE_MASK));

				}

				break;

				// display core temperature
			case 'd':
			case 'D':
				xil_printf("core temperature: %x (%d)\n\r",
						(XADC_raw_temperature() >> 4), XADC_raw_temperature());
				break;

				// specific temperature
			case 't':
			case 'T':
				sleep_ms(100);

				reset_oscillator(RP_BASEADDR, CALIBRATION_TIME);

				while (((osc_count & GO_DONE_MASK) != GO_DONE_MASK))
				{
					osc_count = 0;

					osc_count = Xil_In32(RP_BASEADDR+04);

				}

				xil_printf("counter result: 0x%x at core temperature: %x (%d)\n\r",
						osc_count, XADC_raw_temperature() >> 4,
						XADC_raw_temperature() >> 4);
				break;

			case 'r':
			case 'R':
				done = 0;

				while (!done)
				{
					done = 1;

					for (index = 0; index < NUM_PARTITIONS; index++)
					{
						partition[index].temperature_reading = Xil_In32(partition[index].baseaddr+0x04);

						if ((partition[index].temperature_reading & GO_DONE_MASK) == GO_DONE_MASK)
						{
							partition[index].temperature_reading = ~GO_DONE_MASK & partition[index].temperature_reading;

						}

						else
						{
							done = 0;

						}

					}

				}

				for(index = 0; index < NUM_PARTITIONS; index++)
				{
					if(partition[index].block_active)
					{
						reset_oscillator(partition[index].baseaddr, SELF_HEAT);

					}

					else
					{
						reset_oscillator(partition[index].baseaddr, 0x00);

					}

				}

				printAlgorithmResults(partition);



				break;

			case 'f':
			case 'F':
				print("set fan speed (0-9):");
				key = XUartLite_RecvByte(XUART_BASEADDR);

				//xil_printf("read: %d\n\r", key);

				switch (key)
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


				 */

				num_active = 1;

				algorithm(partition, 1);

				printAlgorithmResults(partition);

				break;

			default:
				menu();

				break;

		}

	}

	return 0;

}
