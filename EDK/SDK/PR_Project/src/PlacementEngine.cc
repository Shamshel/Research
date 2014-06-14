/*
 * PlacementEngine.cc
 *
 *  Created on: Jun 21, 2013
 *      Author: ECE
 */

#include "PlacementEngine.h"

/*

PlacementEngine::PlacementEngine():HwIcap()
{
	HwIcapInit(HWICAP_DEVICE_ID);

}

XHwIcap_Config* PlacementEngine::HwIcapInit(u16 HwIcapID){
	XHwIcap_Config *ConfigPtr;
	int Status;

	ConfigPtr = XHwIcap_LookupConfig(HwIcapID);

	XHwIcap_CfgInitialize(&HwIcap, ConfigPtr, ConfigPtr->BaseAddress);

	Status = XHwIcap_CfgInitialize(&HwIcap, ConfigPtr, ConfigPtr->BaseAddress);

	if(Status != XST_SUCCESS)
	{
		return NULL;

	}

	return ConfigPtr;

}

*/
#ifdef DEBUG
	void menu()
	{


	}

	void printAvailableModules()
	{


	}

	void userConfig()
	{


	}

#endif
