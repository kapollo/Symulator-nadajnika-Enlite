 /* Program symulujący nadawanie pakietów z danymi glikemii z nadajnika Enlite z podłączonym sensorem, napisany na mikrokontroler STM8S207K8.
 Nadajnikiem jest moduł RFM69HCW pracujący w trybie Packet Mode.
 
 !!! Ostatecznie program nadaje tylko główne pakiety bez powtórzeń ramek naśladując sinusoidę. W przybliżeniu dziewięć pomiarów w górę i dziewięc w dół.
 Program nie jest idealnym odzwierciedleniem prawdziwego nadajnika Enlite, bo nie wysyła powtórzeń każdego pomiaru, ale wystarcza to do utrzymania ciągłości pomiarów.
 Zmienia sie tylko raw data dla aktualnego pomiaru i pompa potrafi zgubić sygnał, pomimo tego, że podczas transmisji 
 jest wysyłana paczka powtórzonych identycznych ramek przez około 4 sekundy (kilkaset ramek). Rzeczywisty nadajnik wysyła 
 dokładnie jedną ramkę z danymi i pompa dokładnie wie, kiedy ma się spodziewać tych danych. Program jest wystarczającym symulatorem dla potrzeb testów
 CGM w przypadku pracy z pompą Veo 754 z firmware 3.1E. Program korzysta z wewnętrznego oscylatora RC, więc jego zegar nie jest super dokładny.
 Mimo tego w okresie 40 minut, które dla pompy są maksymalnym czasem bez komunikatu o utracie sygnału nadajnika program działa prawidłowo i pompa
 ma ciągłość pomiarów. Nawet gdy wystąpi utrata kilku pomiarów, to po ponownej synchronizacji dane raw data uzupełnią się i tym samym program może działać nieprzerwanie
 przez cały cykl 6-dniowej pracy sensora. W programie symulatora nie ma sytuacji rozruchu sensora. Po otrzymaniu pierwszego sygnału pompa od razu
 zgłasza potrzebę kalibracji i za 15 minut mamy juz poziom glikemii dostępny na ekranie pompy. Poniższy switch jest wyliczony do zrobienia pełnego
 cyklu sinusoidy i jest wyliczony na podstawie zgłoszeń pompy o utracie sygnału i jego dokładność wynosi 0,5 sekundy wg wewnętrznego system_tick!!!  
 
 Dołączenie otoczenia do mikrokontrolera:
 piny:		      otoczenie:
 PD0(Out) ----------> katoda zielonej LED wskaźnikowej (aktywny poziom niski)
 PD2(Out) ----------> katoda czerwonej LED wskaźnikowej (aktywny poziom niski)
 
 piny:		      programator:
 PD1 ---------------> SWIM
 NRST --------------> RST
 
 piny:		      moduł RFM69H:
 PC7(MISO) ---------> MISO
 PC6(MOSI) ---------> MOSI
 PC5(SCK) ----------> SCK
 PC4(CS) -----------> NSS
 PC3 ---------------> RESET (aktywny stan wysoki)
 PC1(IN) -----------> DIO1 Packet Mode: wyjście FifoLevel (Set when the number of bytes in the FIFO strictly
 PC2(IN) -----------> DIO0 Packet Mode: wyjście PacketSent (Set in Tx when the complete packet has been sent.
																														cleared when exiting Tx) 
*/

 
#include "IO_init.h"
#include "tasks.h"
#include <string.h>


void main(void)
{
	uint8_t send_seq_cnt = 0;
	uint16_t time_stamp = 0xFFFF; //init, by było różne od wartości w tick_500ms
	CLKs_config();
	GPIO_init();
	EXTI_init();
	SPI_init();
	Timer2_init();
	tick_500ms = 0;
	
	enableInterrupts();
	while(1)  //główna pętla programu
	{
		if ((!(pb4sem)) &&
			  (time_stamp != tick_500ms))
		{
			switch (tick_500ms)
			{                    
				case 0:    // 00
				case 616:  // 10
				case 1390: // 20
				case 1902: // 30	
				case 2402: // 40
				case 3092: // 50
				case 3646: // 60
				case 4144: // 70
				case 4786: // 00
				case 5406: // 10
				case 6180: // 20
				case 6692: // 30
				case 7192: // 40
				case 7882: // 50
				case 8434: // 60
				case 8934: // 70
				case 9578: // 00
					pb4sem = true;
					time_stamp = tick_500ms;
					if (tick_500ms == 9578)
					    tick_500ms = 0;
				break;
			}
		}
		send_seq_cnt = send_sequence_func(NULL);
		greenLEDblink_func(send_seq_cnt);
		if (send_seq_cnt == 0) //gdy nie jest wysyłana sekwencja glikemii
		{
			if (tick_500ms & 1) //gdy nieparzysta wartość tick_500ms
				GPIO_WriteLow(Green_LED_GPIO_Port, Green_LED_Pin); //zaświecenie zielonej LED
			else
				GPIO_WriteHigh(Green_LED_GPIO_Port, Green_LED_Pin); //zgaszenie zielonej LED
		}
		
	}
}
