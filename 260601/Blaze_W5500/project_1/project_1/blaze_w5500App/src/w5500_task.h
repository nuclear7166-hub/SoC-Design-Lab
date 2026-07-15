#ifndef __W5500_TASK_H_
#define __W5500_TASK_H_


void     w5500_reset_HW(void);
void     w5500_sw_reset(void);
void     w5500_init(void);
uint8_t  w5500_getphylink(void);

#endif

