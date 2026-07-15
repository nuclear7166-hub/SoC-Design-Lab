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
#include "xuartlite.h"
#include "xtmrctr.h"
#include "sleep.h"
#include "xil_exception.h"
#include "xintc.h"

#define GPIO_LED4BITS_DEVICE_ID    XPAR_GPIO_0_DEVICE_ID
#define LED4BITS_CHANNEL1       1

/* definitions for btn0, AXI_GPIO_1 */
#define GPIO_BTN0_DEVICE_ID     XPAR_GPIO_1_DEVICE_ID
#define BTN0_CHANNEL1           1
#define BTN0_INT_MSK      XGPIO_IR_CH1_MASK  /* Channel 1 Interrupt Mask */

/* definitions for btn1, AXI_GPIO_2 */
#define GPIO_BTN1_DEVICE_ID     XPAR_GPIO_2_DEVICE_ID
#define BTN1_CHANNEL1           1
#define BTN1_INT_MSK      XGPIO_IR_CH1_MASK  /* Channel 1 Interrupt Mask */

/* definitions for btn2_3, AXI_GPIO_3 */
#define GPIO_BTN2_3_DEVICE_ID   XPAR_GPIO_3_DEVICE_ID
#define BTN2_3_CHANNEL1         1

/* definitions for UART */
#define UARTLITE_DEVICE_ID      XPAR_UARTLITE_0_DEVICE_ID
#define UARTLITE_INT_IRQ_ID     XPAR_INTC_0_UARTLITE_0_VEC_ID

/* definitions for Timer */
#define TMRCTR_DEVICE_ID        XPAR_TMRCTR_0_DEVICE_ID
#define TMRCTR_INTERRUPT_ID     XPAR_INTC_0_TMRCTR_0_VEC_ID

/* definitions for Interrupt */
#define INTC_DEVICE_ID          XPAR_INTC_0_DEVICE_ID
#define INTC_BTN0_INT_VEC_ID    XPAR_INTC_0_GPIO_1_VEC_ID
#define INTC_BTN1_INT_VEC_ID    XPAR_INTC_0_GPIO_2_VEC_ID

#define LED4              0x01
#define LED5              0x02
#define LED6              0x04
#define LED7              0x08

#define UART_BUFFER_SIZE   100

#define TIMER_CNTR_0        0
#define TMR_RST_VALUE      (0xffffffff - 100000000)

void Gpio1Handler(void *CallBackRef);
void Gpio2Handler(void *CallbackRef);

void UartSendHandler(void *CallBackRef, unsigned int EventData);
void UartRecvHandler(void *CallBackRef, unsigned int EventData);

void TimerCounterHandler(void *CallBackRef, u8 TmrCtrNumber);

XGpio     Gpio_led;
XGpio     Gpio_btn_0;
XGpio     Gpio_btn_1;
XGpio     Gpio_btn_2_3;
XUartLite   UartLite;
XTmrCtr   TimerCounter;
XIntc     Intc;

static volatile int TotalSentCount;

int UartRxIndex1, UartRxIndex2;
u8 UartTxBuf[UART_BUFFER_SIZE];
u8 UartRxBuf[UART_BUFFER_SIZE];

u8 TimerFlag;

void interrupt_init(void)
{
    XIntc_Initialize(&Intc, INTC_DEVICE_ID); // intc 초기화

    XIntc_Connect (&Intc, INTC_BTN0_INT_VEC_ID, (XInterruptHandler)Gpio1Handler, &Gpio_btn_0); // 인터럽트가발생하면 BTN0_INT_VEC_ID로 가고함수의주소를찾아서그함수로
    XIntc_Connect(&Intc, INTC_BTN1_INT_VEC_ID, (XInterruptHandler)Gpio2Handler, &Gpio_btn_1);
    XIntc_Connect(&Intc, UARTLITE_INT_IRQ_ID, (XInterruptHandler)XUartLite_InterruptHandler,  (void *)&UartLite);
    XIntc_Connect(&Intc, TMRCTR_INTERRUPT_ID, (XInterruptHandler)XTmrCtr_InterruptHandler, (void *)&TimerCounter);

    XIntc_Start(&Intc, XIN_REAL_MODE);
    XIntc_Enable(&Intc, UARTLITE_INT_IRQ_ID);  //Interrupt 활성화
    XIntc_Enable(&Intc, INTC_BTN0_INT_VEC_ID);
    XIntc_Enable(&Intc, INTC_BTN1_INT_VEC_ID);
    XIntc_Enable(&Intc, TMRCTR_INTERRUPT_ID);
}

void exception_init(void)
{
   Xil_ExceptionInit();

    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler)XIntc_InterruptHandler, &Intc);
    Xil_ExceptionEnable();
}

void uart_init(void)
{
    XUartLite_Initialize(&UartLite, UARTLITE_DEVICE_ID); //Uart 초기화
    XUartLite_SelfTest(&UartLite);

    XUartLite_SetSendHandler(&UartLite, UartSendHandler, &UartLite);
    XUartLite_SetRecvHandler(&UartLite, UartRecvHandler, &UartLite);
    /* 송신, 수신즉, Send/RecvHandler를넣어주는작업*/
    XUartLite_EnableInterrupt(&UartLite);

    UartRxIndex1 = 0;
    UartRxIndex2 = 0;
}

void gpio_init(void)
{
    XGpio_Initialize(&Gpio_led, GPIO_LED4BITS_DEVICE_ID);
    XGpio_Initialize(&Gpio_btn_0, GPIO_BTN0_DEVICE_ID);
    XGpio_Initialize(&Gpio_btn_1, GPIO_BTN1_DEVICE_ID);
    XGpio_Initialize(&Gpio_btn_2_3, GPIO_BTN2_3_DEVICE_ID);
    XGpio_InterruptEnable(&Gpio_btn_0, BTN0_CHANNEL1);
    XGpio_InterruptEnable(&Gpio_btn_1, BTN1_CHANNEL1);
    XGpio_InterruptGlobalEnable(&Gpio_btn_0);
    XGpio_InterruptGlobalEnable(&Gpio_btn_1);
}

void timer_init(void)
{
    XTmrCtr_Initialize(&TimerCounter, TMRCTR_DEVICE_ID);
    XTmrCtr_SelfTest(&TimerCounter, TIMER_CNTR_0);
    XTmrCtr_SetHandler(&TimerCounter, TimerCounterHandler, &TimerCounter);
    XTmrCtr_SetOptions(&TimerCounter, TIMER_CNTR_0, XTC_INT_MODE_OPTION | XTC_AUTO_RELOAD_OPTION);
    XTmrCtr_SetResetValue(&TimerCounter, TIMER_CNTR_0, TMR_RST_VALUE);
    TimerFlag = 0;
}

int main()
{
    int cnt_1s = 0;

    init_platform();

    gpio_init();
    uart_init();
    timer_init();
    interrupt_init();
    exception_init();

    xil_printf("\r\n App Start v1.0a.. \r\n");
    XTmrCtr_Start(&TimerCounter, TIMER_CNTR_0); // Timer Start
    while (1)
    {
    if(UartRxIndex1 != UartRxIndex2)
        {
            xil_printf("\r\n rcv: %c", UartRxBuf[UartRxIndex2]);
            UartRxIndex2++;
            if(UartRxIndex2 >= UART_BUFFER_SIZE)
                            UartRxIndex2 = 0;
        }
    if(TimerFlag==1)
        {
        TimerFlag = 0;
        xil_printf("\r\n Timer0 isr%d ", cnt_1s++);
        }

        if ((XGpio_DiscreteRead(&Gpio_btn_2_3, BTN2_3_CHANNEL1) & 0x0001))
            {
            XGpio_DiscreteWrite(&Gpio_led, LED4BITS_CHANNEL1, LED6);
            }
            else
                {
                XGpio_DiscreteClear(&Gpio_led, LED4BITS_CHANNEL1, LED6);
                }
                if ((XGpio_DiscreteRead(&Gpio_btn_2_3, BTN2_3_CHANNEL1) & 0x0002))
                    {
                    XGpio_DiscreteWrite(&Gpio_led, LED4BITS_CHANNEL1, LED7);
                    }
                        else
                        {
                        XGpio_DiscreteClear(&Gpio_led, LED4BITS_CHANNEL1, LED7);
                        }
}

    cleanup_platform();
    return 0;
}

void UartSendHandler(void *CallBackRef, unsigned int EventData)
{
	TotalSentCount = EventData;
}
void UartRecvHandler(void *CallBackRef, unsigned int EventData)
{
	u8 rxData;
	XUartLite_Recv(&UartLite, &rxData, 1);
	UartRxBuf[UartRxIndex1] = rxData;

	UartRxIndex1++;
	if(UartRxIndex1 >= UART_BUFFER_SIZE)
	                   UartRxIndex1 = 0;
}

void Gpio1Handler(void *CallbackRef)
{
	static int intrCount = 0;
    XGpio *GpioPtr = (XGpio *)CallbackRef;

	if ((XGpio_DiscreteRead(&Gpio_btn_0, BTN0_CHANNEL1)&0x0001))

	xil_printf("\r\n interrupt-0occurs %d\r\n", intrCount++);

	if(intrCount & 0x01)
	   XGpio_DiscreteWrite(&Gpio_led, LED4BITS_CHANNEL1, LED4);
	else
	   XGpio_DiscreteClear(&Gpio_led, LED4BITS_CHANNEL1, LED4);

	   XGpio_InterruptClear(GpioPtr, BTN0_CHANNEL1);
}

void Gpio2Handler(void *CallbackRef)
{
    static int intrCount = 0;
    XGpio *GpioPtr = (XGpio *)CallbackRef;

    if ((XGpio_DiscreteRead(&Gpio_btn_1, BTN1_CHANNEL1) & 0x0001))
        xil_printf("\r\n interrupt-1 occurs %d\r\n", intrCount++);

    if (intrCount & 0x01)
        XGpio_DiscreteWrite(&Gpio_led, LED4BITS_CHANNEL1, LED5);
    else
        XGpio_DiscreteClear(&Gpio_led, LED4BITS_CHANNEL1, LED5);

    XGpio_InterruptClear(GpioPtr, BTN1_CHANNEL1);   /* Clear the Interrupt */
}


void TimerCounterHandler(void *CallBackRef, u8 TmrCtrNumber)
{
    TimerFlag = 1;
}


void GpioDisableIntr(XIntc *IntcInstancePtr, XGpio *InstancePtr,
                     u16 IntrId, u16 IntrMask)
{
    XGpio_InterruptDisable(InstancePtr, IntrMask);
    XIntc_Disable(IntcInstancePtr, IntrId);

    return;
}
