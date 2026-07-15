#include "w5500.h"
#include "platform.h"
#include "xgpio.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xspi.h"
#include "xspi_l.h"
#include "w5500.h"
#include "ax_common.h"
#include "sleep.h"

extern XGpio     Gpio_5bits;


void w5500_reset_HW(void)
{
	xil_printf("w5500 HW reset.. \r\n");

	XGpio_DiscreteWrite(&Gpio_5bits, GPIO_5BIT_CHANNEL1, 0);
	sleep(1);
	XGpio_DiscreteWrite(&Gpio_5bits, GPIO_5BIT_CHANNEL1, 0x1f);
}

void w5500_sw_reset(void)
{
	uint8_t gw[4], sn[4], sip[4];
	uint8_t mac[6];

	getSHAR(mac);
	getGAR(gw);  getSUBR(sn);  getSIPR(sip);
	setMR(MR_RST);
	getMR(); // for delay
	setSHAR(mac);
	setGAR(gw);
	setSUBR(sn);
	setSIPR(sip);
}

// socket 0 : TCP
// socket 1 : UDP
// socket 7 : DHCP
void w5500_init(void)
{
   int8_t i;
   uchar8 txsize[8] = {4, 4, 1, 1, 1, 1, 4, 0};
   uchar8 rxsize[8] = {4, 4, 1, 1, 1, 1, 4, 0};

   w5500_sw_reset();

   for(i = 0 ; i < 8; i++)
         setSn_TXBUF_SIZE(i, txsize[i]);

   for(i = 0 ; i < 8; i++)
         setSn_RXBUF_SIZE(i, rxsize[i]);
}

// 0 : ok..
// 1 : error
uint8_t w5500_getphylink(void)
{
	int i;

	for(i=0; i<10; i++)
	{
		if(getPHYCFGR() & PHYCFGR_LNK_ON)
		{
			xil_printf("\r\n PHY link OK.. i : %d \r\n", i);
			return(WIZ_YES);
		}
		sleep(1);
	}

	if(i==10)	xil_printf("PHY link Error.. \r\n");

	return(WIZ_NO);
}
