/*
 * Author: Cody Herndon
 *
 * Description:	The following is a placement engine written
 * 				in C++ for placing blocks on a Kintex 7 KC705
 * 				eval board from Xilinx.  This placment engine
 * 				will run on a soft Microblaze processor configured
 * 				with HW_Icap, QSPI, and RS232 Xilinx IPs. *
 *
 */

// Includes
#include "xparameters.h"
#include "xil_io.h"
#include "xstatus.h"
#include "xuartlite.h"
#include "xuartlite_l.h"
#include "integer.h"
#include "xilisf.h"
#include "malloc.h"
#include "diskio.h"

// Defines
#ifndef TESTAPP_GEN

#define UART_LITE_DEVICE_ID		XPAR_UARTLITE_0_DEVICE_ID
#define TEST_BUFFER_SIZE		16
#define DEBUG
#define STATUS					0
#define ERROR					1
#define WARN					2

#define RING_OSC XPAR_RING_OSCILLATOR_0_BASEADDR
#define GO_DONE					0x800000

#endif
// Protos
void printStatus(char* msg, int type);
void printXStatus(char* msg, int status);
int UARTInit(u16 UARTID);
/*
void parseCommand(char* command);
int getString(char* string);
int testFlash();
*/

/*
 * Buffers used during read and write transactions.
 */
//static u8 ReadBuffer[PAGE_SIZE + READ_WRITE_EXTRA_BYTES + 4];
static u8 WriteBuffer[PAGE_SIZE + READ_WRITE_EXTRA_BYTES];

//define UART object
static XUartLite	UartLite;

//define XSpi object
static XSpi Spi;

int main()
{
	XSpi_Config *ConfigPtr;
	int Status = 0, result = 0;
	bool POST = true;

#ifdef DEBUG
	printStatus("beginning POST", STATUS);

#endif

	/* setup and initializations */

	//UART setup
	Status = XUartLite_Initialize(&UartLite, UART_LITE_DEVICE_ID);

	if(Status != XST_SUCCESS)
	{
		POST = false;
#ifdef DEBUG
		printStatus("failed to initialize Uart", ERROR);
#endif

	}

	else
	{
#ifdef DEBUG
		printStatus("initalized UART", STATUS);

#endif

	}


	//debugging disk_initialize
	Status = diskInitialize(ConfigPtr, &Spi, WriteBuffer);

	if(Status != XST_SUCCESS)
	{
#ifdef DEBUG
		printStatus("failed to initialize Flash", ERROR);
#endif
		POST = false;

	}

	else
	{
#ifdef DEBUG
		printStatus("initialized Flash", STATUS);

#endif

	}

#ifdef DEBUG
	printStatus("completed POST", STATUS);

#endif

	//if baseboard systems are correctly configured, continue with application

	/*if(POST)
	{
		print("reading dummy address:");

		Status = SpiFlashRead(&Spi, START_ADDRESS, 16, COMMAND_RANDOM_READ, ReadBuffer, WriteBuffer);

		if(Status == XST_SUCCESS)
		{
			print("\tread complete\n\r");

		}

		else
		{
			printStatus("failed to read from CF!", ERROR);

		}

		print("\n\r");

		return 0;

	}*/

	//count ring osc cycles to test IP

	//reset counter
	Xil_Out32(RING_OSC+0x0, 0x00000000);

	//enable osc counter and begin counting
	Xil_Out32(RING_OSC+0x0, 0x0000FFFF);

	result = Xil_In32(RING_OSC+0x00);

	xil_printf("RING_OSC read 0x%x\n\r", result);

	result = Xil_In32(RING_OSC+0x04);

	//wait for timeout
	while((result & GO_DONE) == GO_DONE)
	{
		result = Xil_In32(RING_OSC+0x04);
		if(result == (result & !GO_DONE))
		{
			xil_printf("0x%x\n\r", result);

		}

	}

	//retrieve #cycles
	result = Xil_In32(RING_OSC+0x04);
	xil_printf("Ring Oscillator cycled 0x%x", result);

	result = Xil_In32(RING_OSC+0x00);

	xil_printf(" times in 0x%x clock cycles.\n\r", result);


}

int UARTInit(u16 UARTID)
{
	int Status;

	/* initialize UARTLite module */

	Status = XUartLite_Initialize(&UartLite, UARTID );

	if(Status != XST_SUCCESS)
	{
		return XST_FAILURE;

	}

	return XST_SUCCESS;
}

void printStatus(char* msg, int type)
{
	switch(type)
	{


	// status
	case 0:
		print("STATUS:\t\t");
		print(msg);

		break;

	// error
	case 1:
		print("ERROR:\t\t");
		print(msg);

		break;

	// warning/log
	case 2:
		print("WARN:\t\t");
		print(msg);

		break;

	// xstatus
	default:
			printXStatus(msg, type);

			break;

	}

	print("\n\r");

}

void printXStatus(char* msg, int status)
{
	print("XSTATUS:\t\t");
	switch(status)
		{
		case 0L:
			print("XST_SUCCESS");

			break;

		case 1L:
			print("XST_FAILURE");

			break;

		case 2L:
			print("XST_DEVICE_NOT_FOUND");

			break;

		case 3L:
			print("XST_DEVICE_BLOCK_NOT_FOUND");

			break;

		case 4L:
			print("XST_INVALID_VERSION");

			break;

		case 5L:
			print("XST_DEVICE_IS_STARTED");

			break;

		case 6L:
			print("XST_DEVICE_IS_STOPPED");

			break;

		default:
			print("an XST error occured!\t");
			print((char*)status);

			break;

		}

	print("\n\r");

}
/*
void parseCommand(char* command)
{
	xil_printf("you entered: %s\n\r",command);

}

int getString(char* string)
{
	bool read = false;
	char data[256];
	int index = 0;

	while(!read)
	{
		if(!XUartLite_IsReceiveEmpty(XPAR_RS232_UART_1_BASEADDR))
		{
			data[index] = XUartLite_ReadReg(XPAR_RS232_UART_1_BASEADDR, XUL_RX_FIFO_OFFSET);
			index++;

		}

	}

}
*/
