
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

uint16_t  tcpRxTotal = 0;

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
				xil_printf("\r\n W5500 Received size : %d", size);
				if(size > TCP_BUF_MAX)	size = TCP_BUF_MAX;
				//memset(buf+tcpRxTotal, 0, SPI_FIFO_SIZE);
				ret = recv(sn, buf+tcpRxTotal, size);
				tcpRxTotal += size;
				if(ret <= 0) return ret;
				if(tcpRxTotal >= TCP_BUF_MAX)
				{
					tcpRxTotal = 0;
/*					for(i=0; i<(TCP_BUF_MAX/48); i++)
					{
						xil_printf("B : %d   ", i);
						for(j=0; j<48; j++)   xil_printf("%c", buf[i*48+j]);
						xil_printf("\r\n");
					}
*/
					send(SOCK_TCPS, buf, TCP_BUF_MAX);
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
