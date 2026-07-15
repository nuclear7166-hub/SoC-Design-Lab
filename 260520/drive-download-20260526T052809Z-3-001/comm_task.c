

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "comm_task.h"
#include "xspi.h"
#include "xspi_l.h"


#define		COMM_BUF_MAX		20

#define		COMM_STX		    0x40		// '@'
#define		COMM_ETX		    0x2A		// '*'
#define		COMM_SPACE		  0x20		// ' '


u8  comm_buf[COMM_BUF_MAX];
u8  comm_etx_flag = 0;
u16 comm_index=0;

extern XSpi      SpiInstance;

void comm_task(void);
uint8_t ato_int8(uint8_t *str);
uint16_t ato_int16(uint8_t *str);



void comm_decode(u8 rdata)
{
	switch(rdata)
	{
	case COMM_STX :
		comm_index = 0;
		break;
	case COMM_ETX :
		comm_etx_flag = 1;
		comm_buf[comm_index] = 0;
		comm_task();
		break;
	default :
		comm_buf[comm_index++] = rdata;
		if(comm_index >= COMM_BUF_MAX)
		{
			xil_printf("Error : overflow rx_buf !! \r\n");
			comm_index = 0;
		}
		break;
	}
}


void comm_task(void)
{
  uint16_t  data16;
  uint8_t   data8 ;
  uint8_t   wbuf[6], rbuf[6];

	// pwm1 frequency write
  if( (comm_buf[0]=='p') && (comm_buf[1]=='f') && (comm_buf[2]=='w') && (comm_buf[3]=='1') )
  {
	  data16 = ato_int16(comm_buf+4);
	  wbuf[0] = 0x64;
	  wbuf[1] = 0x10;
	  wbuf[2] = (uint8_t)(data16>>8);
	  wbuf[3] = (uint8_t)(data16&0xff);
	  XSpi_Transfer(&SpiInstance, wbuf, NULL, 4);
	  xil_printf("pwm1 freq. wrtie : %d \r\n", data16);
  }
  // pwm2 frequency write
  else if( (comm_buf[0]=='p') && (comm_buf[1]=='f') && (comm_buf[2]=='w') && (comm_buf[3]=='2') )
  {
	  data16 = ato_int16(comm_buf+4);
	  wbuf[0] = 0x64;
	  wbuf[1] = 0x11;
	  wbuf[2] = (uint8_t)(data16>>8);
	  wbuf[3] = (uint8_t)(data16&0xff);
	  XSpi_Transfer(&SpiInstance, wbuf, NULL, 4);
	  xil_printf("pwm2 freq. wrtie : %d \r\n", data16);
  }
  // pwm3 frequency write
  else if( (comm_buf[0]=='p') && (comm_buf[1]=='f') && (comm_buf[2]=='w') && (comm_buf[3]=='3') )
  {
	  data16 = ato_int16(comm_buf+4);
	  wbuf[0] = 0x64;
	  wbuf[1] = 0x12;
	  wbuf[2] = (uint8_t)(data16>>8);
	  wbuf[3] = (uint8_t)(data16&0xff);
	  XSpi_Transfer(&SpiInstance, wbuf, NULL, 4);
	  xil_printf("pwm3 freq. wrtie : %d \r\n", data16);
  }
  // pwm4 frequency write
  else if( (comm_buf[0]=='p') && (comm_buf[1]=='f') && (comm_buf[2]=='w') && (comm_buf[3]=='4') )
  {
	  data16 = ato_int16(comm_buf+4);
	  wbuf[0] = 0x64;
	  wbuf[1] = 0x13;
	  wbuf[2] = (uint8_t)(data16>>8);
	  wbuf[3] = (uint8_t)(data16&0xff);
	  XSpi_Transfer(&SpiInstance, wbuf, NULL, 4);
	  xil_printf("pwm4 freq. wrtie : %d \r\n", data16);
  }

  // pwm1 duty write
  else if( (comm_buf[0]=='p') && (comm_buf[1]=='d') && (comm_buf[2]=='w') && (comm_buf[3]=='1') )
  {
	  data8 = ato_int8(comm_buf+4);
	  wbuf[0] = 0x64;
	  wbuf[1] = 0x20;
	  wbuf[2] = 0;
	  wbuf[3] = data8;
	  XSpi_Transfer(&SpiInstance, wbuf, NULL, 4);
	  xil_printf("pwm1 duty wrtie : %d \r\n", data8);
  }
  // pwm2 duty write
  else if( (comm_buf[0]=='p') && (comm_buf[1]=='d') && (comm_buf[2]=='w') && (comm_buf[3]=='2') )
  {
	  data8 = ato_int8(comm_buf+4);
	  wbuf[0] = 0x64;
	  wbuf[1] = 0x21;
	  wbuf[2] = 0;
	  wbuf[3] = data8;
	  XSpi_Transfer(&SpiInstance, wbuf, NULL, 4);
	  xil_printf("pwm2 duty wrtie : %d \r\n", data8);
  }
  // pwm3 duty write
  else if( (comm_buf[0]=='p') && (comm_buf[1]=='d') && (comm_buf[2]=='w') && (comm_buf[3]=='3') )
  {
	  data8 = ato_int8(comm_buf+4);
	  wbuf[0] = 0x64;
	  wbuf[1] = 0x22;
	  wbuf[2] = 0;
	  wbuf[3] = data8;
	  XSpi_Transfer(&SpiInstance, wbuf, NULL, 4);
	  xil_printf("pwm3 duty wrtie : %d \r\n", data8);
  }
  // pwm4 duty write
  else if( (comm_buf[0]=='p') && (comm_buf[1]=='d') && (comm_buf[2]=='w') && (comm_buf[3]=='4') )
  {
	  data8 = ato_int8(comm_buf+4);
	  wbuf[0] = 0x64;
	  wbuf[1] = 0x23;
	  wbuf[2] = 0;
	  wbuf[3] = data8;
	  XSpi_Transfer(&SpiInstance, wbuf, NULL, 4);
	  xil_printf("pwm4 duty wrtie : %d \r\n", data8);
  }

  // pwm1 frequency read
  else if( (comm_buf[0]=='p') && (comm_buf[1]=='f') && (comm_buf[2]=='r') && (comm_buf[3]=='1') )
  {
	  wbuf[0] = 0x65;
	  wbuf[1] = 0x10;
	  wbuf[2] = 0;
	  wbuf[3] = 0;
	  XSpi_Transfer(&SpiInstance, wbuf, rbuf, 4);
	  xil_printf("pwm1 freq. read : %d \r\n", (uint16_t)(rbuf[2]<<8)|rbuf[3]);
  }
  // pwm2 frequency read
  else if( (comm_buf[0]=='p') && (comm_buf[1]=='f') && (comm_buf[2]=='r') && (comm_buf[3]=='2') )
  {
	  wbuf[0] = 0x65;
	  wbuf[1] = 0x11;
	  wbuf[2] = 0;
	  wbuf[3] = 0;
	  XSpi_Transfer(&SpiInstance, wbuf, rbuf, 4);
	  xil_printf("pwm2 freq. read : %d \r\n", (uint16_t)(rbuf[2]<<8)|rbuf[3]);
  }
  // pwm3 frequency read
  else if( (comm_buf[0]=='p') && (comm_buf[1]=='f') && (comm_buf[2]=='r') && (comm_buf[3]=='3') )
  {
	  wbuf[0] = 0x65;
	  wbuf[1] = 0x12;
	  wbuf[2] = 0;
	  wbuf[3] = 0;
	  XSpi_Transfer(&SpiInstance, wbuf, rbuf, 4);
	  xil_printf("pwm3 freq. read : %d \r\n", (uint16_t)(rbuf[2]<<8)|rbuf[3]);
  }
  // pwm4 frequency read
  else if( (comm_buf[0]=='p') && (comm_buf[1]=='f') && (comm_buf[2]=='r') && (comm_buf[3]=='4') )
  {
	  wbuf[0] = 0x65;
	  wbuf[1] = 0x13;
	  wbuf[2] = 0;
	  wbuf[3] = 0;
	  XSpi_Transfer(&SpiInstance, wbuf, rbuf, 4);
	  xil_printf("pwm4 freq. read : %d \r\n", (uint16_t)(rbuf[2]<<8)|rbuf[3]);
  }

  // pwm1 duty read
  else if( (comm_buf[0]=='p') && (comm_buf[1]=='d') && (comm_buf[2]=='r') && (comm_buf[3]=='1') )
  {
	  wbuf[0] = 0x65;
	  wbuf[1] = 0x20;
	  wbuf[2] = 0;
	  wbuf[3] = 0;
	  XSpi_Transfer(&SpiInstance, wbuf, rbuf, 4);
	  xil_printf("pwm1 duty read : %d \r\n", rbuf[3]);
  }
  // pwm2 duty read
  else if( (comm_buf[0]=='p') && (comm_buf[1]=='d') && (comm_buf[2]=='r') && (comm_buf[3]=='2') )
  {
	  wbuf[0] = 0x65;
	  wbuf[1] = 0x21;
	  wbuf[2] = 0;
	  wbuf[3] = 0;
	  XSpi_Transfer(&SpiInstance, wbuf, rbuf, 4);
	  xil_printf("pwm2 duty read : %d \r\n", rbuf[3]);
  }
  // pwm3 duty read
  else if( (comm_buf[0]=='p') && (comm_buf[1]=='d') && (comm_buf[2]=='r') && (comm_buf[3]=='3') )
  {
	  wbuf[0] = 0x65;
	  wbuf[1] = 0x22;
	  wbuf[2] = 0;
	  wbuf[3] = 0;
	  XSpi_Transfer(&SpiInstance, wbuf, rbuf, 4);
	  xil_printf("pwm3 duty read : %d \r\n", rbuf[3]);
  }
  // pwm4 duty read
  else if( (comm_buf[0]=='p') && (comm_buf[1]=='d') && (comm_buf[2]=='r') && (comm_buf[3]=='4') )
  {
	  wbuf[0] = 0x65;
	  wbuf[1] = 0x23;
	  wbuf[2] = 0;
	  wbuf[3] = 0;
	  XSpi_Transfer(&SpiInstance, wbuf, rbuf, 4);
	  xil_printf("pwm4 duty read : %d \r\n", rbuf[3]);
  }

  else
  {
	  xil_printf("6. user queue command - unknown \r\n");
  }

}


uint8_t Char2Int(uint8_t ch)
{
	uint8_t ret = 0;

	if((ch >= '0') && (ch <= '9'))		ret = ch - '0';
	else if((ch >= 'a') && (ch <= 'f'))	ret = ch - 'a' + 10;
	else if((ch >= 'A') && (ch <= 'F'))	ret = ch - 'A' + 10;
	else					ret = 0;

	return(ret);
}

uint8_t ato_int8(uint8_t *str)
{
    return ( (Char2Int(str[0])<<4) | (Char2Int(str[1])) );
}


uint16_t ato_int16(uint8_t *str)
{
    return ( (Char2Int(str[0])<<12) | (Char2Int(str[1])<<8) | (Char2Int(str[2])<<4) | (Char2Int(str[3])) );
}



