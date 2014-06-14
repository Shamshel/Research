/*
 * diskio.c
 *
 *  Created on: Oct 22, 2013
 *      Author: ECE
 */

#include "diskio.h"


int diskInitialize(XSpi_Config *ConfigPtr, XSpi *Spi, u8 *WriteBuffer)
{
	int Status;


	/*
	 * Initialize the SPI driver so that it's ready to use,
	 * specify the device ID that is generated in xparameters.h.
	 */
	ConfigPtr = XSpi_LookupConfig(SPI_DEVICE_ID);
	if (ConfigPtr == NULL) {
		return XST_DEVICE_NOT_FOUND;
	}

	Status = XSpi_CfgInitialize(Spi, ConfigPtr,
				  ConfigPtr->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Set the SPI device as a master and in manual slave select mode such
	 * that the slave select signal does not toggle for every byte of a
	 * transfer, this must be done before the slave select is set.
	 */
	Status = XSpi_SetOptions(Spi, XSP_MASTER_OPTION |
				 XSP_MANUAL_SSELECT_OPTION);
	if(Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Select the quad flash device on the SPI bus, so that it can be
	 * read using the SPI bus.
	 */
	Status = XSpi_SetSlaveSelect(Spi, SPI_SELECT);
	if(Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Start the SPI driver so that the device are enabled.
	 */
	XSpi_Start(Spi);

	/*
	 * Disable Global interrupt to use polled mode operation
	 */
	XSpi_IntrGlobalDisable(Spi);

	/*
	 * Perform the Write Enable operation.
	 */
	Status = SpiFlashWriteEnable(Spi, WriteBuffer);
    if(Status != XST_SUCCESS) {
	return XST_FAILURE;
    }

    //xil_printf("Completed successfully!\n\r");

	return XST_SUCCESS;
}

int SpiFlashRead(XSpi *SpiPtr, u32 Addr, u32 ByteCount, u8 ReadCmd, u8 *ReadBuffer, u8 *WriteBuffer)
{
	int Status;

	for(int i = 0; i < PAGE_SIZE + READ_WRITE_EXTRA_BYTES; i++) {
		ReadBuffer[i] = 0x0;
	}


	/*
	 * Prepare the WriteBuffer.
	 */
	WriteBuffer[BYTE1] = ReadCmd;
	WriteBuffer[BYTE2] = (u8) (Addr >> 16);
	WriteBuffer[BYTE3] = (u8) (Addr >> 8);
	WriteBuffer[BYTE4] = (u8) Addr;


	/*
	 * Initiate the Transfer.
	 */
	Status = XSpi_Transfer( SpiPtr, WriteBuffer, ReadBuffer, (ByteCount + READ_WRITE_EXTRA_BYTES));
	if(Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

int SpiFlashWriteEnable(XSpi *SpiPtr, u8 *WriteBuffer)
{
	int Status;

	/*
	 * Wait while the Flash is busy.
	 */
	while(SpiPtr->IsReady != XIL_COMPONENT_IS_READY)


	/*
	 * Prepare the WriteBuffer.
	 */
	WriteBuffer[BYTE1] = COMMAND_WRITE_ENABLE;

	/*
	 * Initiate the Transfer.
	 */

	Status = XSpi_Transfer(SpiPtr, WriteBuffer, NULL, WRITE_ENABLE_BYTES);
	if(Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Wait till the Transfer is complete and check if there are any errors
	 * in the transaction..
	 */


	return XST_SUCCESS;
}
