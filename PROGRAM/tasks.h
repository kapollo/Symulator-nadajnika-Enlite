#ifndef TASKS_H
#define TASKS_H

#include "stm8s_conf.h"

#define	false	0
#define	true	!(false)


extern uint8_t pb4sem; //naciœniêcie przycisku "4" powoduje ustawienie semafora
extern uint16_t system_tick, tick_500ms; //liczniki inkrementowane przerwaniami z przepe³nienia timera2			
extern uint8_t start_TX_RX_seq_sem; //znacznik rozpoczêcia transmisji przez modu³ RFM69H
extern uint8_t end_TX_RX_seq_sem; //znacznik zakoñczenia transmisji przez modu³ RFM69H

/*prototypy funkcji pomocniczych */
//void init_crc8(void);
void RFM69H_SPI_write(uint16_t address_data);
uint8_t RFM69H_SPI_read(uint8_t address);

/* prototypy funkcji tasków */
void greenLEDblink_func(uint16_t LED_on_off);
uint16_t send_sequence_func(uint8_t *seq_sent_successPtr);

#endif