#include "isr.h"
#include "IO_init.h"
#include "tasks.h"


// Procedura obs�ugi przerwa� z linii DIO modu�u RFM69H
INTERRUPT void EXTI2_ISR(void)
{
	if (GPIO_ReadInputPin(DIO_RFM_Port, DIO1_RFM_Pin)) //gdy pojawi si� sygna� FIFO_Level na PC1
	{
		start_TX_RX_seq_sem++; //ka�de wywo�anie tej funkcji zwi�ksza start_TX_RX_seq_sem o 1
		end_TX_RX_seq_sem = 0; //wyzerowanie znacznika ko�ca transmisji, bo dopiero transmisja rozpoczyna si�
		if (start_TX_RX_seq_sem > 1)
			start_TX_RX_seq_sem = 1; //utrzymanie warto�ci == 1 semafora start_TX_RX_seq_sem - znacznik startu transmisji
	}
	if (GPIO_ReadInputPin(DIO_RFM_Port, DIO0_RFM_Pin)) //gdy pojawi si� sygna� Packet_Sent (Tx) na PC2
	{
		end_TX_RX_seq_sem++; //ka�de wywo�anie tej funkcji zwi�ksza end_TX_RX_seq_sem o 1
		start_TX_RX_seq_sem = 0; //wyzerowanie znacznika pocz�tku transmisji - wszystkie dane z FIFO zosta�u ju� wys�ane
		if (end_TX_RX_seq_sem > 1)
			end_TX_RX_seq_sem = 1; //utrzymanie warto�ci == 1 semafora end_TX_RX_seq_sem - znacznik ko�ca transmisji
	}
}



// Procedura obs�ugi przerwa� z przycisk�w
INTERRUPT void EXTI1_ISR(void)
{
	if (GPIO_ReadInputPin(Pushbutton_GPIO_Port, Pushbutton4_Pin) == RESET)  /********** gdy naci�ni�ty czarny przycisk "4" *************/
	{
		pb4sem++; //ka�de wywo�anie tej funkcji zwi�ksza pb4sem o 1 (max warto�� 255)
		if (pb4sem > 1)
			pb4sem = 1; //utrzymanie warto�ci == 1 semafora pb4sem - znacznik naci�ni�cia przycisku "4"
	}
}



INTERRUPT void TIM2_update_overflowISR(void)
{
	volatile static uint16_t tick_1ms;
	TIM2_ClearFlag(TIM2_FLAG_UPDATE); //wyczyszczenie flagi przepe�nienia TIM2
	tick_1ms++; //ka�de wywo�anie tej funkcji zwi�ksza tick_1ms o 1
	system_tick++;
	if (tick_1ms >= 500) 
	{
	  tick_500ms++; //zwi�kszenie tego licznika co ka�de 500ms
		tick_1ms = 0;
	}
}