#include "isr.h"
#include "IO_init.h"
#include "tasks.h"


// Procedura obs³ugi przerwañ z linii DIO modu³u RFM69H
INTERRUPT void EXTI2_ISR(void)
{
	if (GPIO_ReadInputPin(DIO_RFM_Port, DIO1_RFM_Pin)) //gdy pojawi siê sygna³ FIFO_Level na PC1
	{
		start_TX_RX_seq_sem++; //ka¿de wywo³anie tej funkcji zwiêksza start_TX_RX_seq_sem o 1
		end_TX_RX_seq_sem = 0; //wyzerowanie znacznika koñca transmisji, bo dopiero transmisja rozpoczyna siê
		if (start_TX_RX_seq_sem > 1)
			start_TX_RX_seq_sem = 1; //utrzymanie wartoœci == 1 semafora start_TX_RX_seq_sem - znacznik startu transmisji
	}
	if (GPIO_ReadInputPin(DIO_RFM_Port, DIO0_RFM_Pin)) //gdy pojawi siê sygna³ Packet_Sent (Tx) na PC2
	{
		end_TX_RX_seq_sem++; //ka¿de wywo³anie tej funkcji zwiêksza end_TX_RX_seq_sem o 1
		start_TX_RX_seq_sem = 0; //wyzerowanie znacznika pocz¹tku transmisji - wszystkie dane z FIFO zosta³u ju¿ wys³ane
		if (end_TX_RX_seq_sem > 1)
			end_TX_RX_seq_sem = 1; //utrzymanie wartoœci == 1 semafora end_TX_RX_seq_sem - znacznik koñca transmisji
	}
}



// Procedura obs³ugi przerwañ z przycisków
INTERRUPT void EXTI1_ISR(void)
{
	if (GPIO_ReadInputPin(Pushbutton_GPIO_Port, Pushbutton4_Pin) == RESET)  /********** gdy naciœniêty czarny przycisk "4" *************/
	{
		pb4sem++; //ka¿de wywo³anie tej funkcji zwiêksza pb4sem o 1 (max wartoœæ 255)
		if (pb4sem > 1)
			pb4sem = 1; //utrzymanie wartoœci == 1 semafora pb4sem - znacznik naciœniêcia przycisku "4"
	}
}



INTERRUPT void TIM2_update_overflowISR(void)
{
	volatile static uint16_t tick_1ms;
	TIM2_ClearFlag(TIM2_FLAG_UPDATE); //wyczyszczenie flagi przepe³nienia TIM2
	tick_1ms++; //ka¿de wywo³anie tej funkcji zwiêksza tick_1ms o 1
	system_tick++;
	if (tick_1ms >= 500) 
	{
	  tick_500ms++; //zwiêkszenie tego licznika co ka¿de 500ms
		tick_1ms = 0;
	}
}