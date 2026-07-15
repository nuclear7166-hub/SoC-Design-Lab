
#include <stdio.h>
#include "string.h"
#include "platform.h"
#include "ax_common.h"
#include "xil_printf.h"
#include "sleep.h"
#include "w5500.h"
#include "w5500_loopback.h"
#include "w5500_socket.h"
#include "xgpio.h"

extern XGpio     Gpio_5bits;

uint16_t  tcpRxTotal = 0;
uint16_t  tcpMsgIndex = 0;
uint8_t   tcpMsgBuffer[TCP_MSG_MAX];

// TCP & UDP Loopback Test
int32_t loopback_tcps(uint8_t sn, uint8_t* buf, uint16_t port)
{
	int32_t  ret;
	uint16_t size = 0;
	uint8_t  destip[4];
	uint16_t destport;
	int i, j;

	switch(getSn_SR(sn))
	{
		// -------------------------------------------------------------
		// SOCK_ESTABLISHED
		case SOCK_ESTABLISHED :
			if(getSn_IR(sn) & Sn_IR_CON)
			{
				getSn_DIPR(sn, destip);
				destport = getSn_DPORT(sn);
				xil_printf("\r\n Connected - %d.%d.%d.%d  %d \r\n",
				    destip[0], destip[1], destip[2], destip[3], destport);
				setSn_IR(sn,Sn_IR_CON);
			}
			if((size = getSn_RX_RSR(sn)) > 0)
			{
				xil_printf(" W5500 Received size : %d \r\n", size);
				tcpRxTotal += size;
				while(1)
				{
					if(size > TCP_MSG_SIZE)
					{
						memset(buf, 0, SPI_FIFO_SIZE);
						ret = recv(sn, buf, TCP_MSG_SIZE);
						if(ret <= 0) return ret;
						size -= TCP_MSG_SIZE;
						xil_printf(" BD Received size : %d \r\n", TCP_MSG_SIZE);
						memcpy(tcpMsgBuffer+tcpMsgIndex, buf, TCP_MSG_SIZE);
						tcpMsgIndex += TCP_MSG_SIZE;
					}
					else
					{
						memset(buf, 0, SPI_FIFO_SIZE);
						ret = recv(sn, buf, size);
						if(ret <= 0) return ret;
						xil_printf(" BD Received size : %d \r\n", size);
						memcpy(tcpMsgBuffer+tcpMsgIndex, buf, TCP_MSG_SIZE);
						tcpMsgIndex += size;

						break;
					}
				}

				if(tcpRxTotal >= TCP_MSG_MAX)
				{
					tcpRxTotal = 0;
					tcpMsgIndex = 0;

					for(i=0; i<(TCP_MSG_MAX/48); i++)
					{
						xil_printf("B : %d   ", i);
						for(j=0; j<48; j++)   xil_printf("%c", tcpMsgBuffer[i*48+j]);
						xil_printf("\r\n");
					}

					send(SOCK_TCPS, tcpMsgBuffer,                TCP_MSG_SIZE);
					send(SOCK_TCPS, tcpMsgBuffer+TCP_MSG_SIZE,   TCP_MSG_SIZE);
					send(SOCK_TCPS, tcpMsgBuffer+2*TCP_MSG_SIZE, TCP_MSG_SIZE);
					send(SOCK_TCPS, tcpMsgBuffer+3*TCP_MSG_SIZE, TCP_MSG_SIZE);
					send(SOCK_TCPS, tcpMsgBuffer+4*TCP_MSG_SIZE, TCP_MSG_SIZE);
				}
			}
			break;
		// -------------------------------------------------------------
		// SOCK_CLOSE_WAIT
		case SOCK_CLOSE_WAIT :
			if((ret=disconnect(sn)) != SOCK_OK) return ret;
			xil_printf("Socket closed .. \r\n");
			break;								 
		// -------------------------------------------------------------
		// SOCK_INIT
		case SOCK_INIT :
			xil_printf("Listen, TCP server loopback, port : %d  \r\n", port);
			if( (ret = listen(sn)) != SOCK_OK) return ret;
			break;
		// -------------------------------------------------------------
		// SOCK_CLOSED
		case SOCK_CLOSED:
			xil_printf("TCP server loopback start .. \r\n");
			if((ret=socket(sn, Sn_MR_TCP, port, 0x00)) != sn)
			return ret;
			break;
         
		default:
			break;
	}
	return 1;
}
