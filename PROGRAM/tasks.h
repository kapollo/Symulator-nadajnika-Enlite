#ifndef TASKS_H
#define TASKS_H

#include "stm8s_conf.h"

#define	false	0
#define	true	!(false)


extern uint8_t pb4sem; //naci�ni�cie przycisku "4" powoduje ustawienie semafora
extern uint16_t system_tick, tick_500ms; //liczniki inkrementowane przerwaniami z przepe�nienia timera2			
extern uint8_t start_TX_RX_seq_sem; //znacznik rozpocz�cia transmisji przez modu� RFM69H
extern uint8_t end_TX_RX_seq_sem; //znacznik zako�czenia transmisji przez modu� RFM69H

/*prototypy funkcji pomocniczych */
//void init_crc8(void);
void RFM69H_SPI_write(uint16_t address_data);
uint8_t RFM69H_SPI_read(uint8_t address);

/* prototypy funkcji task�w */
void greenLEDblink_func(uint16_t LED_on_off);
uint16_t send_sequence_func(uint8_t *seq_sent_successPtr);

#endif