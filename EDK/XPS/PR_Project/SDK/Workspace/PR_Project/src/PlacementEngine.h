/*
 * PlacementEngine.h
 *
 *  Created on: Jun 21, 2013
 *      Author: ECE
 */

#ifndef PLACEMENTENGINE_H_
#define PLACEMENTENGINE_H_

#include "xparameters.h"
//#include "xil_io.h"
#include "xstatus.h"
#include "stdlib.h"
#include "xspi.h"
#include "xspi_l.h"
//#include "xhwicap.h"		/*HWICAP device driver*/
//#include "xhwicap_l.h"
//#include "xhwicap_i.h"

#define TABLE_SIZE 1
#define HWICAP_DEVICE_ID XPAR_AXI_HWICAP_0_DEVICE_ID

class PlacementEngine
{
public:
	int PickAndPlace();

private:
	int UsageTable[TABLE_SIZE][TABLE_SIZE];
	//XHwIcap HwIcap;
	//XHwIcap_Config* HwIcap_Config;
	u32 Control;
	int NumBytesSent;
	int NumBytesRecvd;

	//main runnable routines
	PlacementEngine();
	//XHwIcap_Config* HwIcapInit(u16 HwIcapID);

	int XHwIcap_ConfigWrite();
	int XHwIcap_ConfigRead();

	//backend routines


#ifdef DEBUG
	//debug routines
	void menu();
	void printAvailableModules();
	void userConfig();

#endif

};

#endif
