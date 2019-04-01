 /* Program symuluj¹cy nadawanie pakietów z danymi glikemii z nadajnika Enlite z pod³¹czonym sensorem, napisany na mikrokontroler STM8S207K8.
 Nadajnikiem jest modu³ RFM69HCW pracuj¹cy w trybie Packet Mode.
 
 !!! Ostatecznie program nadaje tylko g³ówne pakiety bez powtórzeñ ramek naœladuj¹c sinusoidê. W przybli¿eniu dziewiêæ pomiarów w górê i dziewiêc w dó³.
 Program nie jest idealnym odzwierciedleniem prawdziwego nadajnika Enlite, bo nie wysy³a powtórzeñ ka¿dego pomiaru, ale wystarcza to do utrzymania ci¹g³oœci pomiarów.
 Zmienia sie tylko raw data dla aktualnego pomiaru i pompa potrafi zgubiæ sygna³, pomimo tego, ¿e podczas transmisji 
 jest wysy³ana paczka powtórzonych identycznych ramek przez oko³o 4 sekundy (kilkaset ramek). Rzeczywisty nadajnik wysy³a 
 dok³adnie jedn¹ ramkê z danymi i pompa dok³adnie wie, kiedy ma siê spodziewaæ tych danych. Program jest wystarczaj¹cym symulatorem dla potrzeb testów
 CGM w przypadku pracy z pomp¹ Veo 754 z firmware 3.1E. Program korzysta z wewnêtrznego oscylatora RC, wiêc jego zegar nie jest super dok³adny.
 Mimo tego w okresie 40 minut, które dla pompy s¹ maksymalnym czasem bez komunikatu o utracie sygna³u nadajnika program dzia³a prawid³owo i pompa
 ma ci¹g³oœæ pomiarów. Nawet gdy wyst¹pi utrata kilku pomiarów, to po ponownej synchronizacji dane raw data uzupe³ni¹ siê i tym samym program mo¿e dzia³aæ nieprzerwanie
 przez ca³y cykl 6-dniowej pracy sensora. W programie symulatora nie ma sytuacji rozruchu sensora. Po otrzymaniu pierwszego sygna³u pompa od razu
 zg³asza potrzebê kalibracji i za 15 minut mamy juz poziom glikemii dostêpny na ekranie pompy. Poni¿szy switch jest wyliczony do zrobienia pe³nego
 cyklu sinusoidy i jest wyliczony na podstawie zg³oszeñ pompy o utracie sygna³u i jego dok³adnoœæ wynosi 0,5 sekundy wg wewnêtrznego system_tick!!!  
 
 Do³¹czenie otoczenia do mikrokontrolera:
 piny									otoczenie
 
 PD0(Out) ----------> katoda zielonej LED wskaŸnikowej (aktywny poziom niski)
 
 
 piny									programator
 PD1 ---------------> SWIM
 NRST --------------> NRST
 
 piny									modu³ RFM69H
 PC7(MISO) ---------> MISO
 PC6(MOSI) ---------> MOSI
 PC5(SCK) ----------> SCK
 PC4(CS) -----------> NSS
 PC3 ---------------> RESET (aktywny stan wysoki)
 PC1(IN) -----------> DIO1 Packet Mode: wyjœcie FifoLevel (Set when the number of bytes in the FIFO strictly
																													exceeds FifoThreshold; else cleared) z modu³u RFM69H 
													 Continuous Mode: (wyjœcie z modu³u RFM69H zegara synchronizuj¹cego bity sekwencji nadawczej
													 Poziom na DIO2 (Data) jest próbkowany przy ka¿dym narastaj¹cym zboczu tego zegara, mo¿e siê zmieniaæ przy opadaj¹cym zboczu)
 PC2(IN) -----------> DIO0 Packet Mode: wyjœcie PacketSent (Set in Tx when the complete packet has been sent.
																														cleared when exiting Tx) 
*/

 
#include "IO_init.h"
#include "tasks.h"
#include <string.h>


void main(void)
{
	uint8_t send_seq_cnt = 0;
	uint16_t time_stamp = 0xFFFF; //init, by by³o ró¿ne od wartoœci w tick_500ms
	CLKs_config();
	GPIO_init();
	EXTI_init();
	SPI_init();
	Timer2_init();
	//init_crc8();
	tick_500ms = 0;
	
	enableInterrupts();
	while(1)  //g³ówna pêtla programu
	{
		if ((!(pb4sem)) &&
			  (time_stamp != tick_500ms))
		{
			switch (tick_500ms)
			{                    //dzia³aj¹ce na du¿ej p³ytce
				case 0:    // 00		0
				case 616:  // 10		618
				case 1390: // 20		1400
				case 1902: // 30		1914		
				case 2402: // 40		2420
				case 3092: // 50		3116
				case 3646: // 60		3672
				case 4144: // 70		4174
				case 4786: // 00		4824
				case 5406: // 10		5446
				case 6180: // 20		6224
				case 6692: // 30		6742
				case 7192: // 40		7244
				case 7882: // 50		7938
				case 8434: // 60		8496
				case 8934: // 70		8998
				case 9578: // 00		9648
								pb4sem = true;
								time_stamp = tick_500ms;
								if (tick_500ms == 9578)
									tick_500ms = 0;
								break;
			}
		}
		send_seq_cnt = send_sequence_func(NULL);
		greenLEDblink_func(send_seq_cnt);
		if (send_seq_cnt == 0) //gdy nie jest wysy³ana sekwencja glikemii
		{
			if (tick_500ms & 1) //gdy nieparzysta wartoœæ tick_500ms
				GPIO_WriteLow(Green_LED_GPIO_Port, Green_LED_Pin); //zaœwiecenie zielonej LED
			else
				GPIO_WriteHigh(Green_LED_GPIO_Port, Green_LED_Pin); //zgaszenie zielonej LED
		}
		
	}
}
