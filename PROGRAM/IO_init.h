#ifndef IO_INIT_H
#define IO_INIT_H
#include "stm8s_conf.h"



#define Green_LED_Pin           GPIO_PIN_0
#define Green_LED_GPIO_Port     GPIOD
#define Red_LED_Pin             GPIO_PIN_2
#define Red_LED_GPIO_Port       GPIOD

#define Pushbutton4_Pin						GPIO_PIN_4 // przycisk "4"
#define Pushbutton_GPIO_Port			GPIOB



#define MISO_Pin									GPIO_PIN_7
#define MOSI_Pin									GPIO_PIN_6
#define SCK_Pin										GPIO_PIN_5
#define SPI_Port									GPIOC

#define CS_RFM_Pin								GPIO_PIN_4
#define CS_RFM_Port								GPIOC
#define RESET_RFM_Pin							GPIO_PIN_3
#define RESET_RFM_Port						GPIOC
#define DIO1_RFM_Pin							GPIO_PIN_1 //Packet Mode FIFO_Level (Tx or Rx), Continuous Mode Clk (Tx)
#define DIO0_RFM_Pin							GPIO_PIN_2 //Packet Mode Packet_Sent (Tx), unused at Rx and Continuous Mde
#define DIO_RFM_Port							GPIOC



void GPIO_init(void);
void CLKs_config(void);
void EXTI_init(void);
//void Timer4_init(void);
void Timer2_init(void);
void SPI_init(void);
uint8_t SPI_send_receive(uint8_t data);

#endif
