/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

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

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "sleep.h"
#include "xgpio.h"
#include "xuartlite.h"
#include "xspi.h"
#include "ax_common.h"
#include "w5500.h"
#include "w5500_task.h"
#include "w5500_loopback.h"
#include "w5500_socket.h"


XGpio     Gpio_5bits;          /* The instance of the gpio */
XUartLite UartLite;            /* The instance of the UartLite Device */
XSpi      SpiInstance;	       /* The instance of the SPI device */

void Display_Net_Conf(void);
void Net_Conf(void);

void uart_init(void)
{
    XUartLite_Initialize(&UartLite, UARTLITE_DEVICE_ID);
    XUartLite_SelfTest(&UartLite);
}

void gpio_init(void)
{
	XGpio_Initialize(&Gpio_5bits, GPIO_5BIT_DEVICE_ID);
}

void spi_init(void)
{
	XSpi_Config *ConfigPtr;	/* Pointer to Configuration data */

	ConfigPtr = XSpi_LookupConfig(SPI_DEVICE_ID);
	XSpi_CfgInitialize(&SpiInstance, ConfigPtr, ConfigPtr->BaseAddress);
	XSpi_SelfTest(&SpiInstance);

	XSpi_SetOptions(&SpiInstance, XSP_MASTER_OPTION );
	XSpi_Start(&SpiInstance);	                /* Start SPI */
	XSpi_IntrGlobalDisable(&SpiInstance);		/* Disable interrupt */
	XSpi_SetSlaveSelect(&SpiInstance, 0x35);	/* 이 문이 빠지면 동작하지 않음 */
}


int main()
{
	uint8_t phy_link=0;
	int32_t ret;

    init_platform();
	gpio_init();
	uart_init();
	spi_init();
	XGpio_DiscreteWrite(&Gpio_5bits, GPIO_5BIT_CHANNEL1, 0xf);

	xil_printf("\r\n Microblaze w5500 start .. \r\n");

	// W5500_Init()
	w5500_reset_HW();		// 1) HW reset
	w5500_init();			// 2) tx, tx buffer size set..
	Net_Conf();
	xil_printf("Static Mode .. \r\n");
	Display_Net_Conf();

	// ----------------------------------------------------
	// W5500 : Link Check..
	phy_link = w5500_getphylink();
    while(1)
    {
    	if(phy_link==WIZ_YES)
    	{
    		// TCP server loopback test
    		if ((ret = loopback_tcps(SOCK_TCPS, tcpRxBuffer, PORT_TCPS)) < 0)
    		{
    			xil_printf("SOCKET_TCP ERROR !! \r\n");
    	    }
    	}
    }
    cleanup_platform();
    return 0;
}


void Display_Net_Conf(void)
{
	getSHAR(gWIZNETINFO.mac);
	getGAR(gWIZNETINFO.gw);
	getSUBR(gWIZNETINFO.sn);
	getSIPR(gWIZNETINFO.ip);
	gWIZNETINFO.dns[0]= _DNS_[0];
	gWIZNETINFO.dns[1]= _DNS_[1];
	gWIZNETINFO.dns[2]= _DNS_[2];
	gWIZNETINFO.dns[3]= _DNS_[3];
	gWIZNETINFO.dhcp  = _DHCP_;


	if(gWIZNETINFO.dhcp == NETINFO_DHCP)
		xil_printf("\r\n===== W5500 NET CONF : DHCP =====\r\n");
	else	xil_printf("\r\n===== W5500 NET CONF : static =====\r\n");

	xil_printf("\r\n MAC : %02X %02X %02X %02X %02X %02X \r\n",
			gWIZNETINFO.mac[0], gWIZNETINFO.mac[1], gWIZNETINFO.mac[2],
			gWIZNETINFO.mac[3], gWIZNETINFO.mac[4], gWIZNETINFO.mac[5] );

	xil_printf(" IP : %d.%d.%d.%d \r\n",
			gWIZNETINFO.ip[0], gWIZNETINFO.ip[1], gWIZNETINFO.ip[2], gWIZNETINFO.ip[3]);

	xil_printf(" GW : %d.%d.%d.%d \r\n",
			gWIZNETINFO.gw[0], gWIZNETINFO.gw[1], gWIZNETINFO.gw[2], gWIZNETINFO.gw[3]);

	xil_printf(" SN : %d.%d.%d.%d \r\n",
			gWIZNETINFO.sn[0], gWIZNETINFO.sn[1], gWIZNETINFO.sn[2], gWIZNETINFO.sn[3]);

	xil_printf("\r\n=======================================\r\n");
}

void Net_Conf(void)
{
	setSHAR(gWIZNETINFO.mac);
	setGAR(gWIZNETINFO.gw);
	setSUBR(gWIZNETINFO.sn);
	setSIPR(gWIZNETINFO.ip);

	_DNS_[0] = gWIZNETINFO.dns[0];
	_DNS_[1] = gWIZNETINFO.dns[1];
	_DNS_[2] = gWIZNETINFO.dns[2];
	_DNS_[3] = gWIZNETINFO.dns[3];
	_DHCP_   = gWIZNETINFO.dhcp;
}
