
#ifndef  _W5500_LOOPBACK_H_
#define  _W5500_LOOPBACK_H_

#define SOCK_DHCP       6

#define SOCK_TCPS	0
#define SOCK_UDPS	1
#define PORT_TCPS	5000
#define PORT_UDPS	3000

int32_t loopback_tcps(uint8_t, uint8_t*, uint16_t);


#endif   // _W5500_LOOPBACK_H_
