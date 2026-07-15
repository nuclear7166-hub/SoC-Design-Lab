
#ifndef __W5500_H_
#define __W5500_H_

#include "data_type.h"
#include "ax_common.h"

#define WIZ_YES                      1
#define WIZ_NO                       0

#define _W5500_IO_BASE_              0x00000000

#define _W5500_SPI_READ_	           (0x00 << 2) //< SPI interface Read operation in Control Phase
#define _W5500_SPI_WRITE_	           (0x01 << 2) //< SPI interface Write operation in Control Phase

#define WIZCHIP_CREG_BLOCK             0x00 	//< Common register block
#define WIZCHIP_SREG_BLOCK(N)          (1+4*N) //< Socket N register block
#define WIZCHIP_TXBUF_BLOCK(N)         (2+4*N) //< Socket N Tx buffer address block
#define WIZCHIP_RXBUF_BLOCK(N)         (3+4*N) //< Socket N Rx buffer address block

#define WIZCHIP_OFFSET_INC(ADDR, N)    (ADDR + (N<<8)) //< Increase offset address


#define MR                 (_W5500_IO_BASE_ + (0x0000 << 8) + (WIZCHIP_CREG_BLOCK << 3))
#define GAR                (_W5500_IO_BASE_ + (0x0001 << 8) + (WIZCHIP_CREG_BLOCK << 3))
#define SUBR               (_W5500_IO_BASE_ + (0x0005 << 8) + (WIZCHIP_CREG_BLOCK << 3))
#define SHAR               (_W5500_IO_BASE_ + (0x0009 << 8) + (WIZCHIP_CREG_BLOCK << 3))
#define SIPR               (_W5500_IO_BASE_ + (0x000F << 8) + (WIZCHIP_CREG_BLOCK << 3))
#define INTLEVEL           (_W5500_IO_BASE_ + (0x0013 << 8) + (WIZCHIP_CREG_BLOCK << 3))
#define IR                 (_W5500_IO_BASE_ + (0x0015 << 8) + (WIZCHIP_CREG_BLOCK << 3))
#define IMR                (_W5500_IO_BASE_ + (0x0016 << 8) + (WIZCHIP_CREG_BLOCK << 3))
#define SIR                (_W5500_IO_BASE_ + (0x0017 << 8) + (WIZCHIP_CREG_BLOCK << 3))
#define SIMR               (_W5500_IO_BASE_ + (0x0018 << 8) + (WIZCHIP_CREG_BLOCK << 3))
#define RTR                (_W5500_IO_BASE_ + (0x0019 << 8) + (WIZCHIP_CREG_BLOCK << 3))
#define RCR                (_W5500_IO_BASE_ + (0x001B << 8) + (WIZCHIP_CREG_BLOCK << 3))
#define PTIMER             (_W5500_IO_BASE_ + (0x001C << 8) + (WIZCHIP_CREG_BLOCK << 3))
#define PMAGIC             (_W5500_IO_BASE_ + (0x001D << 8) + (WIZCHIP_CREG_BLOCK << 3))
#define PHAR               (_W5500_IO_BASE_ + (0x001E << 8) + (WIZCHIP_CREG_BLOCK << 3))
#define PSID               (_W5500_IO_BASE_ + (0x0024 << 8) + (WIZCHIP_CREG_BLOCK << 3))
#define PMRU               (_W5500_IO_BASE_ + (0x0026 << 8) + (WIZCHIP_CREG_BLOCK << 3))
#define UIPR               (_W5500_IO_BASE_ + (0x0028 << 8) + (WIZCHIP_CREG_BLOCK << 3))
#define UPORTR             (_W5500_IO_BASE_ + (0x002C << 8) + (WIZCHIP_CREG_BLOCK << 3))
#define PHYCFGR            (_W5500_IO_BASE_ + (0x002E << 8) + (WIZCHIP_CREG_BLOCK << 3))

#define VERSIONR           (_W5500_IO_BASE_ + (0x0039 << 8) + (WIZCHIP_CREG_BLOCK << 3))


//----------------------------- W5500 Socket Registers IOMAP -----------------------------
#define Sn_MR(N)           (_W5500_IO_BASE_ + (0x0000 << 8) + (WIZCHIP_SREG_BLOCK(N) << 3))
#define Sn_CR(N)           (_W5500_IO_BASE_ + (0x0001 << 8) + (WIZCHIP_SREG_BLOCK(N) << 3))
#define Sn_IR(N)           (_W5500_IO_BASE_ + (0x0002 << 8) + (WIZCHIP_SREG_BLOCK(N) << 3))
#define Sn_SR(N)           (_W5500_IO_BASE_ + (0x0003 << 8) + (WIZCHIP_SREG_BLOCK(N) << 3))
#define Sn_PORT(N)         (_W5500_IO_BASE_ + (0x0004 << 8) + (WIZCHIP_SREG_BLOCK(N) << 3))
#define Sn_DHAR(N)         (_W5500_IO_BASE_ + (0x0006 << 8) + (WIZCHIP_SREG_BLOCK(N) << 3))
#define Sn_DIPR(N)         (_W5500_IO_BASE_ + (0x000C << 8) + (WIZCHIP_SREG_BLOCK(N) << 3))
#define Sn_DPORT(N)        (_W5500_IO_BASE_ + (0x0010 << 8) + (WIZCHIP_SREG_BLOCK(N) << 3))
#define Sn_MSSR(N)         (_W5500_IO_BASE_ + (0x0012 << 8) + (WIZCHIP_SREG_BLOCK(N) << 3))

#define Sn_TOS(N)          (_W5500_IO_BASE_ + (0x0015 << 8) + (WIZCHIP_SREG_BLOCK(N) << 3))
#define Sn_TTL(N)          (_W5500_IO_BASE_ + (0x0016 << 8) + (WIZCHIP_SREG_BLOCK(N) << 3))

#define Sn_RXBUF_SIZE(N)   (_W5500_IO_BASE_ + (0x001E << 8) + (WIZCHIP_SREG_BLOCK(N) << 3))
#define Sn_TXBUF_SIZE(N)   (_W5500_IO_BASE_ + (0x001F << 8) + (WIZCHIP_SREG_BLOCK(N) << 3))
#define Sn_TX_FSR(N)       (_W5500_IO_BASE_ + (0x0020 << 8) + (WIZCHIP_SREG_BLOCK(N) << 3))
#define Sn_TX_RD(N)        (_W5500_IO_BASE_ + (0x0022 << 8) + (WIZCHIP_SREG_BLOCK(N) << 3))
#define Sn_TX_WR(N)        (_W5500_IO_BASE_ + (0x0024 << 8) + (WIZCHIP_SREG_BLOCK(N) << 3))
#define Sn_RX_RSR(N)       (_W5500_IO_BASE_ + (0x0026 << 8) + (WIZCHIP_SREG_BLOCK(N) << 3))
#define Sn_RX_RD(N)        (_W5500_IO_BASE_ + (0x0028 << 8) + (WIZCHIP_SREG_BLOCK(N) << 3))
#define Sn_RX_WR(N)        (_W5500_IO_BASE_ + (0x002A << 8) + (WIZCHIP_SREG_BLOCK(N) << 3))
#define Sn_IMR(N)          (_W5500_IO_BASE_ + (0x002C << 8) + (WIZCHIP_SREG_BLOCK(N) << 3))
#define Sn_FRAG(N)         (_W5500_IO_BASE_ + (0x002D << 8) + (WIZCHIP_SREG_BLOCK(N) << 3))
#define Sn_KPALVTR(N)      (_W5500_IO_BASE_ + (0x002F << 8) + (WIZCHIP_SREG_BLOCK(N) << 3))

#define MR_RST                       0x80
#define MR_WOL                       0x20
#define MR_PB                        0x10
#define MR_PPPOE                     0x08
#define MR_FARP                      0x02
#define IR_CONFLICT                  0x80
#define IR_UNREACH                   0x40
#define IR_PPPoE                     0x20
#define IR_MP                        0x10


// PHYCFGR register value
#define PHYCFGR_RST                  ~(1<<7)  //< For PHY reset, must operate AND mask.
#define PHYCFGR_OPMD                 (1<<6)   // Configre PHY with OPMDC value
#define PHYCFGR_OPMDC_ALLA           (7<<3)
#define PHYCFGR_OPMDC_PDOWN          (6<<3)
#define PHYCFGR_OPMDC_NA             (5<<3)
#define PHYCFGR_OPMDC_100FA          (4<<3)
#define PHYCFGR_OPMDC_100F           (3<<3)
#define PHYCFGR_OPMDC_100H           (2<<3)
#define PHYCFGR_OPMDC_10F            (1<<3)
#define PHYCFGR_OPMDC_10H            (0<<3)
#define PHYCFGR_DPX_FULL             (1<<2)
#define PHYCFGR_DPX_HALF             (0<<2)
#define PHYCFGR_SPD_100              (1<<1)
#define PHYCFGR_SPD_10               (0<<1)
#define PHYCFGR_LNK_ON               (1<<0)
#define PHYCFGR_LNK_OFF              (0<<0)

// IMR register values
#define IM_IR7                  	 0x80
#define IM_IR6                  	 0x40
#define IM_IR5                  	 0x20
#define IM_IR4                  	 0x10

// Sn_MR Default values
#define Sn_MR_MULTI                  0x80
#define Sn_MR_BCASTB                 0x40
#define Sn_MR_ND                     0x20
#define Sn_MR_UCASTB                 0x10
#define Sn_MR_MACRAW                 0x04
//#define Sn_MR_IPRAW                  0x03     /**< IP LAYER RAW SOCK */
#define Sn_MR_UDP                    0x02
#define Sn_MR_TCP                    0x01
#define Sn_MR_CLOSE                  0x00

// Sn_MR values used with Sn_MR_MACRAW
#define Sn_MR_MFEN                   Sn_MR_MULTI
#define Sn_MR_MMB                    Sn_MR_ND
#define Sn_MR_MIP6B                  Sn_MR_UCASTB

// Sn_MR value used with Sn_MR_UDP & Sn_MR_MULTI
#define Sn_MR_MC                     Sn_MR_ND

// Sn_MR alternate values
#define SOCK_STREAM                  Sn_MR_TCP
#define SOCK_DGRAM                   Sn_MR_UDP


// Sn_CR values
#define Sn_CR_OPEN                   0x01
#define Sn_CR_LISTEN                 0x02
#define Sn_CR_CONNECT                0x04
#define Sn_CR_DISCON                 0x08
#define Sn_CR_CLOSE                  0x10
#define Sn_CR_SEND                   0x20
#define Sn_CR_SEND_MAC               0x21
#define Sn_CR_SEND_KEEP              0x22
#define Sn_CR_RECV                   0x40

// Sn_IR values
#define Sn_IR_SENDOK                 0x10
#define Sn_IR_TIMEOUT                0x08
#define Sn_IR_RECV                   0x04
#define Sn_IR_DISCON                 0x02
#define Sn_IR_CON                    0x01

// Sn_SR values
#define SOCK_CLOSED                  0x00
#define SOCK_INIT                    0x13
#define SOCK_LISTEN                  0x14
#define SOCK_SYNSENT                 0x15
#define SOCK_SYNRECV                 0x16
#define SOCK_ESTABLISHED             0x17
#define SOCK_FIN_WAIT                0x18
#define SOCK_CLOSING                 0x1A
#define SOCK_TIME_WAIT               0x1B
#define SOCK_CLOSE_WAIT              0x1C
#define SOCK_LAST_ACK                0x1D
#define SOCK_UDP                     0x22
//#define SOCK_IPRAW                 0x32     // IP raw mode socket
#define SOCK_MACRAW                  0x42
//#define SOCK_PPPOE                 0x5F

// IP PROTOCOL
#define IPPROTO_IP                   0        //< Dummy for IP
#define IPPROTO_ICMP                 1        //< Control message protocol
#define IPPROTO_IGMP                 2        //< Internet group management protocol
#define IPPROTO_GGP                  3        //< Gateway^2 (deprecated)
#define IPPROTO_TCP                  6        //< TCP
#define IPPROTO_PUP                  12       //< PUP
#define IPPROTO_UDP                  17       //< UDP
#define IPPROTO_IDP                  22       //< XNS idp
#define IPPROTO_ND                   77       //< UNOFFICIAL net disk protocol
#define IPPROTO_RAW                  255      //< Raw IP packet

/////////////////////////////////
// Common Register I/O function //
/////////////////////////////////
#define setMR(mr) \
	WIZCHIP_WRITE(MR,mr)

#define getMR() \
		WIZCHIP_READ(MR)

#define setGAR(gar) \
		WIZCHIP_WRITE_BUF(GAR,gar,4)

#define getGAR(gar) \
		WIZCHIP_READ_BUF(GAR,gar,4)

#define setSUBR(subr) \
		WIZCHIP_WRITE_BUF(SUBR, subr,4)

#define getSUBR(subr) \
		WIZCHIP_READ_BUF(SUBR, subr, 4)

#define setSHAR(shar) \
		WIZCHIP_WRITE_BUF(SHAR, shar, 6)

#define getSHAR(shar) \
		WIZCHIP_READ_BUF(SHAR, shar, 6)

#define setSIPR(sipr) \
		WIZCHIP_WRITE_BUF(SIPR, sipr, 4)

#define getSIPR(sipr) \
		WIZCHIP_READ_BUF(SIPR, sipr, 4)

#define setINTLEVEL(intlevel)  {\
		WIZCHIP_WRITE(INTLEVEL,   (uint8_t)(intlevel >> 8)); \
		WIZCHIP_WRITE(WIZCHIP_OFFSET_INC(INTLEVEL,1), (uint8_t) intlevel); \
	}

#define getINTLEVEL() \
		((WIZCHIP_READ(INTLEVEL) << 8) + WIZCHIP_READ(WIZCHIP_OFFSET_INC(INTLEVEL,1)))

#define setIR(ir) \
		WIZCHIP_WRITE(IR, (ir & 0xF0))

#define getIR() \
		(WIZCHIP_READ(IR) & 0xF0)

#define setIMR(imr) \
		WIZCHIP_WRITE(IMR, imr)

#define getIMR() \
		WIZCHIP_READ(IMR)

#define setSIR(sir) \
		WIZCHIP_WRITE(SIR, sir)

#define getSIR() \
		WIZCHIP_READ(SIR)

#define setSIMR(simr) \
		WIZCHIP_WRITE(SIMR, simr)

#define getSIMR() \
		WIZCHIP_READ(SIMR)

#define setRTR(rtr)   {\
		WIZCHIP_WRITE(RTR,   (uint8_t)(rtr >> 8)); \
		WIZCHIP_WRITE(WIZCHIP_OFFSET_INC(RTR,1), (uint8_t) rtr); \
	}

#define getRTR() \
		((WIZCHIP_READ(RTR) << 8) + WIZCHIP_READ(WIZCHIP_OFFSET_INC(RTR,1)))

#define setRCR(rcr) \
		WIZCHIP_WRITE(RCR, rcr)

#define getRCR() \
		WIZCHIP_READ(RCR)

#define setPTIMER(ptimer) \
		WIZCHIP_WRITE(PTIMER, ptimer)

#define getPTIMER() \
		WIZCHIP_READ(PTIMER)

#define setPMAGIC(pmagic) \
		WIZCHIP_WRITE(PMAGIC, pmagic)

#define getPMAGIC() \
		WIZCHIP_READ(PMAGIC)

#define setPHAR(phar) \
		WIZCHIP_WRITE_BUF(PHAR, phar, 6)

#define getPHAR(phar) \
		WIZCHIP_READ_BUF(PHAR, phar, 6)

#define setPSID(psid)  {\
		WIZCHIP_WRITE(PSID,   (uint8_t)(psid >> 8)); \
		WIZCHIP_WRITE(WIZCHIP_OFFSET_INC(PSID,1), (uint8_t) psid); \
	}

#define getPSID() \
		((WIZCHIP_READ(PSID) << 8) + WIZCHIP_READ(WIZCHIP_OFFSET_INC(PSID,1)))

#define setPMRU(pmru) { \
		WIZCHIP_WRITE(PMRU,   (uint8_t)(pmru>>8)); \
		WIZCHIP_WRITE(WIZCHIP_OFFSET_INC(PMRU,1), (uint8_t) pmru); \
	}

#define getPMRU() \
		((WIZCHIP_READ(PMRU) << 8) + WIZCHIP_READ(WIZCHIP_OFFSET_INC(PMRU,1)))

#define getUIPR(uipr) \
		WIZCHIP_READ_BUF(UIPR,uipr,6)

#define getUPORTR() \
	((WIZCHIP_READ(UPORTR) << 8) + WIZCHIP_READ(WIZCHIP_OFFSET_INC(UPORTR,1)))

#define setPHYCFGR(phycfgr) \
		WIZCHIP_WRITE(PHYCFGR, phycfgr)

#define getPHYCFGR() \
		WIZCHIP_READ(PHYCFGR)

#define getVERSIONR() \
		WIZCHIP_READ(VERSIONR)

#define setSn_MR(sn, mr) \
		WIZCHIP_WRITE(Sn_MR(sn),mr)

#define getSn_MR(sn) \
	WIZCHIP_READ(Sn_MR(sn))

#define setSn_CR(sn, cr) \
		WIZCHIP_WRITE(Sn_CR(sn), cr)

#define getSn_CR(sn) \
		WIZCHIP_READ(Sn_CR(sn))

#define setSn_IR(sn, ir) \
		WIZCHIP_WRITE(Sn_IR(sn), (ir & 0x1F))

#define getSn_IR(sn) \
		(WIZCHIP_READ(Sn_IR(sn)) & 0x1F)

#define setSn_IMR(sn, imr) \
		WIZCHIP_WRITE(Sn_IMR(sn), (imr & 0x1F))

#define getSn_IMR(sn) \
		(WIZCHIP_READ(Sn_IMR(sn)) & 0x1F)

#define getSn_SR(sn) \
		WIZCHIP_READ(Sn_SR(sn))

#define getSn_SR_22(sn) \
		WIZCHIP_READ(sn)


#define setSn_PORT(sn, port)  { \
		WIZCHIP_WRITE(Sn_PORT(sn),   (uint8_t)(port >> 8)); \
		WIZCHIP_WRITE(WIZCHIP_OFFSET_INC(Sn_PORT(sn),1), (uint8_t) port); \
	}

#define getSn_PORT(sn) \
		((WIZCHIP_READ(Sn_PORT(sn)) << 8) + WIZCHIP_READ(WIZCHIP_OFFSET_INC(Sn_PORT(sn),1)))

#define setSn_DHAR(sn, dhar) \
		WIZCHIP_WRITE_BUF(Sn_DHAR(sn), dhar, 6)

#define getSn_DHAR(sn, dhar) \
		WIZCHIP_READ_BUF(Sn_DHAR(sn), dhar, 6)

#define setSn_DIPR(sn, dipr) \
		WIZCHIP_WRITE_BUF(Sn_DIPR(sn), dipr, 4)

#define getSn_DIPR(sn, dipr) \
		WIZCHIP_READ_BUF(Sn_DIPR(sn), dipr, 4)

#define setSn_DPORT(sn, dport) { \
		WIZCHIP_WRITE(Sn_DPORT(sn),   (uint8_t) (dport>>8)); \
		WIZCHIP_WRITE(WIZCHIP_OFFSET_INC(Sn_DPORT(sn),1), (uint8_t)  dport); \
	}

#define getSn_DPORT(sn) \
		((WIZCHIP_READ(Sn_DPORT(sn)) << 8) + WIZCHIP_READ(WIZCHIP_OFFSET_INC(Sn_DPORT(sn),1)))

#define setSn_MSSR(sn, mss) { \
		WIZCHIP_WRITE(Sn_MSSR(sn),   (uint8_t)(mss>>8)); \
		WIZCHIP_WRITE(WIZCHIP_OFFSET_INC(Sn_MSSR(sn),1), (uint8_t) mss); \
	}

#define getSn_MSSR(sn) \
		((WIZCHIP_READ(Sn_MSSR(sn)) << 8) + WIZCHIP_READ(WIZCHIP_OFFSET_INC(Sn_MSSR(sn),1)))

#define setSn_TOS(sn, tos) \
		WIZCHIP_WRITE(Sn_TOS(sn), tos)

#define getSn_TOS(sn) \
		WIZCHIP_READ(Sn_TOS(sn))

#define setSn_TTL(sn, ttl) \
		WIZCHIP_WRITE(Sn_TTL(sn), ttl)

#define getSn_TTL(sn) \
		WIZCHIP_READ(Sn_TTL(sn))

#define setSn_RXBUF_SIZE(sn, rxbufsize) \
		WIZCHIP_WRITE(Sn_RXBUF_SIZE(sn),rxbufsize)

#define getSn_RXBUF_SIZE(sn) \
		WIZCHIP_READ(Sn_RXBUF_SIZE(sn))

#define setSn_TXBUF_SIZE(sn, txbufsize) \
		WIZCHIP_WRITE(Sn_TXBUF_SIZE(sn), txbufsize)

#define getSn_TXBUF_SIZE(sn) \
		WIZCHIP_READ(Sn_TXBUF_SIZE(sn))

#define getSn_TX_RD(sn) \
		((WIZCHIP_READ(Sn_TX_RD(sn)) << 8) + WIZCHIP_READ(WIZCHIP_OFFSET_INC(Sn_TX_RD(sn),1)))

#define setSn_TX_WR(sn, txwr) { \
		WIZCHIP_WRITE(Sn_TX_WR(sn),   (uint8_t)(txwr>>8)); \
		WIZCHIP_WRITE(WIZCHIP_OFFSET_INC(Sn_TX_WR(sn),1), (uint8_t) txwr); \
		}

#define getSn_TX_WR(sn) \
		((WIZCHIP_READ(Sn_TX_WR(sn)) << 8) + WIZCHIP_READ(WIZCHIP_OFFSET_INC(Sn_TX_WR(sn),1)))


#define setSn_RX_RD(sn, rxrd) { \
		WIZCHIP_WRITE(Sn_RX_RD(sn),   (uint8_t)(rxrd>>8)); \
		WIZCHIP_WRITE(WIZCHIP_OFFSET_INC(Sn_RX_RD(sn),1), (uint8_t) rxrd); \
	}

#define getSn_RX_RD(sn) \
		((WIZCHIP_READ(Sn_RX_RD(sn)) << 8) + WIZCHIP_READ(WIZCHIP_OFFSET_INC(Sn_RX_RD(sn),1)))

#define getSn_RX_WR(sn) \
		((WIZCHIP_READ(Sn_RX_WR(sn)) << 8) + WIZCHIP_READ(WIZCHIP_OFFSET_INC(Sn_RX_WR(sn),1)))


#define setSn_FRAG(sn, frag) { \
		WIZCHIP_WRITE(Sn_FRAG(sn),  (uint8_t)(frag >>8)); \
		WIZCHIP_WRITE(WIZCHIP_OFFSET_INC(Sn_FRAG(sn),1), (uint8_t) frag); \
	}

#define getSn_FRAG(sn) \
		((WIZCHIP_READ(Sn_FRAG(sn)) << 8) + WIZCHIP_READ(WIZCHIP_OFFSET_INC(Sn_FRAG(sn),1)))

#define setSn_KPALVTR(sn, kpalvt) \
		WIZCHIP_WRITE(Sn_KPALVTR(sn), kpalvt)

#define getSn_KPALVTR(sn) \
		WIZCHIP_READ(Sn_KPALVTR(sn))

#define getSn_RxMAX(sn) \
		(getSn_RXBUF_SIZE(sn) << 10)

#define getSn_TxMAX(sn) \
		(getSn_TXBUF_SIZE(sn) << 10)


typedef enum
{
   NETINFO_STATIC = 1,    ///< Static IP configuration by manually.
   NETINFO_DHCP           ///< Dynamic IP configruation from a DHCP sever
}dhcp_mode;


typedef struct wiz_NetInfo_t
{
   uint8_t mac[6];  ///< Source Mac Address
   uint8_t ip[4];   ///< Source IP Address
   uint8_t sn[4];   ///< Subnet Mask
   uint8_t gw[4];   ///< Gateway IP Address
   uint8_t dns[4];  ///< DNS server IP Address
   dhcp_mode dhcp;  ///< 1 - Static, 2 - DHCP
}wiz_NetInfo;


#define _W5500_SPI_VDM_OP_          0x00
#define _W5500_SPI_FDM_OP_LEN1_     0x01
#define _W5500_SPI_FDM_OP_LEN2_     0x02
#define _W5500_SPI_FDM_OP_LEN4_     0x03

////////////////////////////////////////////////////


extern wiz_NetInfo gWIZNETINFO;

extern uint8_t   _DNS_[4];      // DNS server ip address
extern dhcp_mode _DHCP_;        // DHCP mode

extern uint8_t   tcpRxBuffer[SPI_FIFO_SIZE];
extern uint8_t   tcpTxBuffer[SPI_FIFO_SIZE];


uint16_t getSn_TX_FSR(uint8_t sn);
uint16_t getSn_RX_RSR(uint8_t sn);



void     w5500_write(uint16_t addr16, uint8_t bsb, uint16_t data_len, uint8_t *dat8);
void     w5500_read(uint16_t addr16, uint8_t bsb, uint16_t data_len, uint8_t *rbuf);
void     WIZCHIP_WRITE(uint32_t AddrSel, uint8_t wb );
void     WIZCHIP_WRITE_BUF(uint32_t AddrSel, uint8_t* pBuf, uint16_t len);
uint8_t  WIZCHIP_READ(uint32_t AddrSel);
void     WIZCHIP_READ_BUF (uint32_t AddrSel, uint8_t* pBuf, uint16_t len);
uint16_t getSn_TX_FSR(uint8_t sn);
uint16_t getSn_RX_RSR(uint8_t sn);
void     wiz_send_data(uint8_t sn, uint8_t *wizdata, uint16_t len);
void     wiz_recv_data(uint8_t sn, uint8_t *wizdata, uint16_t len);


#endif
