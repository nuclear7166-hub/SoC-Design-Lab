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
#include "xparameters.h"
#include "sleep.h"
#include "xil_io.h"

#define AXI_FND_BASEADDR 0x00010000
#define AXI_FND_DIGIT1 AXI_FND_BASEADDR+0x00
#define AXI_FND_DIGIT2 AXI_FND_BASEADDR+0x04
#define AXI_FND_DIGIT3 AXI_FND_BASEADDR+0x08
#define AXI_FND_DIGIT4 AXI_FND_BASEADDR+0x0c

void fndWrite(u16 fndValue)
{
	Xil_Out32(AXI_FND_DIGIT1, fndValue % 10);
	Xil_Out32(AXI_FND_DIGIT2, fndValue / 10 % 10);
	Xil_Out32(AXI_FND_DIGIT3, fndValue / 100 % 10);
	Xil_Out32(AXI_FND_DIGIT4, fndValue / 1000 % 10);
}

int main()
{
    init_platform();

    print("Hello World\n\r");
    print("Successfully ran Hello World application");

    u16 data = 0;

    while(1)
    {
    	fndWrite(data);
    	data++;
    	if(data >= 10000)data = 0;
    	usleep(500000);
    }
    cleanup_platform();
    return 0;
}
