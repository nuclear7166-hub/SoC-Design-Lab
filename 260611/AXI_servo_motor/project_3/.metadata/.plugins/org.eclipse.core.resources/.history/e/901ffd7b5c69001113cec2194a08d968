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
#include "xgpio.h"
#include "sleep.h"
#include "xil_exception.h"
#include "xintc.h"

#define AXI_PWM0_BASEADDR 0x00010000
#define PWM0_enable AXI_PWM0_BASEADDR + 0x00
#define PWM0_dir AXI_PWM0_BASEADDR + 0x04
#define PWM0_ocr AXI_PWM0_BASEADDR + 0x08

/*definitions for btn0, AXI_GPIO_1*/
#define GPIO_BTN0_DEVICE_ID XPAR_GPIO_0_DEVICE_ID
#define BTN0_CHANNEL1	1
#define BTN0_INT_MSK 	XGPIO_IR_CH1_MASK

/*definitions for Interrupt*/
#define INTC_DEVICE_ID	XPAR_INTC_0_DEVICE_ID
#define INTC_BTN0_INT_VEC_ID	XPAR_INTC_0_GPIO_0_VEC_ID

XGpio	GPIO_BTN;
XIntc Intc;

void Gpio1Handler(void *CallBackRef);

void interrupt_init(void)
{
	XIntc_Initialize(&Intc, INTC_DEVICE_ID);
	XIntc_Connect(&Intc, INTC_BTN0_INT_VEC_ID,
			(XInterruptHandler)Gpio1Handler, &GPIO_BTN);

	XIntc_Start(&Intc, XIN_REAL_MODE);
	XIntc_Enable(&Intc, INTC_BTN0_INT_VEC_ID);
}
void exception_init(void)
{
	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler)XIntc_InterruptHandler, &Intc);
	Xil_ExceptionEnable();
}
void gpio_init(void)
{
	XGpio_Initialize(&GPIO_BTN, GPIO_BTN0_DEVICE_ID);
	XGpio_InterruptEnable(&GPIO_BTN, BTN0_CHANNEL1);
	XGpio_InterruptGlobalEnable(&GPIO_BTN);
}

u8 direction = 0b01;
u8 duty = 0;
u8 RunFlag = 0;

void Gpio1Handler(void *CallbackRef)
{
	XGpio *GpioPtr = (XGpio *)CallbackRef;
		if((XGpio_DiscreteRead(&GPIO_BTN, BTN0_CHANNEL1) & (1 << 1)))
		{
			if(duty >= 80)
				duty = 80;
			else
				duty = duty + 20;
					Xil_Out32(PWM0_ocr, duty);
					usleep(300000);
		}
		if((XGpio_DiscreteRead(&GPIO_BTN, BTN0_CHANNEL1) & (1 << 2)))
		{
			if(duty == 0)
				duty = 0;
			else
					duty = duty - 20;
						Xil_Out32(PWM0_ocr, duty);
						usleep(300000);
		}
		if((XGpio_DiscreteRead(&GPIO_BTN, BTN0_CHANNEL1) & (1 << 3)))
		{
			if(RunFlag == 1)
			{
				RunFlag = 0;
				Xil_Out32(PWM0_enable, 0);
				Xil_Out32(PWM0_ocr, 0);
				usleep(300000);
			}
			else if(RunFlag == 0)
			{
				RunFlag = 1;
				Xil_Out32(PWM0_enable, 1);
				Xil_Out32(PWM0_ocr, duty);
				usleep(300000);
			}
		}

		XGpio_InterruptClear(GpioPtr, BTN0_CHANNEL1);
}

int main()
{
    init_platform();
    interrupt_init();
    gpio_init();
    exception_init();
    print("Hello World\n\r");
    print("PWM RUN\n\r");


    while(1)
    {
    	if((XGpio_DiscreteRead(&GPIO_BTN, BTN0_CHANNEL1) & (1 << 0)))
    		Xil_Out32(PWM0_dir, 0b10);
    	else
    		Xil_Out32(PWM0_dir, 0b01);
    	usleep(300000);
    }
    cleanup_platform();
    return 0;
}
