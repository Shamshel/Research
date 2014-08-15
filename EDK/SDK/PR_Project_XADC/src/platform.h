/*
 * Copyright (c) 2008 Xilinx, Inc.  All rights reserved.
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

#ifndef __PLATFORM_H_
#define __PLATFORM_H_

#include "platform_config.h"

// UART defines
#define XUART_BASEADDR		XPAR_RS232_UART_1_BASEADDR

// Fan controller defines
#define FAN_CONTROLLER_BASEADDR XPAR_FAN_CONTROLLER_0_BASEADDR

// XADC base addresses and offsets
#define XADC_BASEADDR			XPAR_AXI_XADC_0_BASEADDR
#define SR						0x004
#define CONVSTR					0x00C
#define GIER					0x05C
#define IPISR					0x060
#define IPIER					0x068
#define TEMPERATURE_REG			0x200
#define VCCINT_REG				0x204
#define CONFIG_0				0x300
#define CONFIG_1				0x304
#define CONFIG_2				0x308

// HwICAP base addresses and offsets
#define HWICAP_BASEADDR			XPAR_AXI_HWICAP_0_BASEADDR
//#define

// RP defines
#define RP_BASEADDR				XPAR_RECONFIGURABLE_PERIPHERIALS_0_BASEADDR

//Hwicap defines
#define HWICAP_BASEADDR			XPAR_AXI_HWICAP_0_BASEADDR
#define HWICAP_STATUS			0x110

void init_platform();
void cleanup_platform();

void sleep_ms(unsigned int ms);
void sleep_us(unsigned int us);

int XADC_raw_temperature();
float XADC_core_temperature();
int XADC_raw_voltage();
float XADC_core_voltage();

#endif
