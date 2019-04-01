 /* Program symuluj�cy nadawanie pakiet�w z danymi glikemii z nadajnika Enlite z pod��czonym sensorem, napisany na mikrokontroler STM8S207K8.
 Nadajnikiem jest modu� RFM69HCW pracuj�cy w trybie Packet Mode.
 
 !!! Ostatecznie program nadaje tylko g��wne pakiety bez powt�rze� ramek na�laduj�c sinusoid�. W przybli�eniu dziewi�� pomiar�w w g�r� i dziewi�c w d�.
 Program nie jest idealnym odzwierciedleniem prawdziwego nadajnika Enlite, bo nie wysy�a powt�rze� ka�dego pomiaru, ale wystarcza to do utrzymania ci�g�o�ci pomiar�w.
 Zmienia sie tylko raw data dla aktualnego pomiaru i pompa potrafi zgubi� sygna�, pomimo tego, �e podczas transmisji 
 jest wysy�ana paczka powt�rzonych identycznych ramek przez oko�o 4 sekundy (kilkaset ramek). Rzeczywisty nadajnik wysy�a 
 dok�adnie jedn� ramk� z danymi i pompa dok�adnie wie, kiedy ma si� spodziewa� tych danych. Program jest wystarczaj�cym symulatorem dla potrzeb test�w
 CGM w przypadku pracy z pomp� Veo 754 z firmware 3.1E. Program korzysta z wewn�trznego oscylatora RC, wi�c jego zegar nie jest super dok�adny.
 Mimo tego w okresie 40 minut, kt�re dla pompy s� maksymalnym czasem bez komunikatu o utracie sygna�u nadajnika program dzia�a prawid�owo i pompa
 ma ci�g�o�� pomiar�w. Nawet gdy wyst�pi utrata kilku pomiar�w, to po ponownej synchronizacji dane raw data uzupe�ni� si� i tym samym program mo�e dzia�a� nieprzerwanie
 przez ca�y cykl 6-dniowej pracy sensora. W programie symulatora nie ma sytuacji rozruchu sensora. Po otrzymaniu pierwszego sygna�u pompa od razu
 zg�asza potrzeb� kalibracji i za 15 minut mamy juz poziom glikemii dost�pny na ekranie pompy. Poni�szy switch jest wyliczony do zrobienia pe�nego
 cyklu sinusoidy i jest wyliczony na podstawie zg�osze� pompy o utracie sygna�u i jego dok�adno�� wynosi 0,5 sekundy wg wewn�trznego system_tick!!!  
 
 Do��czenie otoczenia do mikrokontrolera:
 piny									otoczenie
 
 PD0(Out) ----------> katoda zielonej LED wska�nikowej (aktywny poziom niski)
 
 
 piny									programator
 PD1 ---------------> SWIM
 NRST --------------> NRST
 
 piny									modu� RFM69H
 PC7(MISO) ---------> MISO
 PC6(MOSI) ---------> MOSI
 PC5(SCK) ----------> SCK
 PC4(CS) -----------> NSS
 PC3 ---------------> RESET (aktywny stan wysoki)
 PC1(IN) -----------> DIO1 Packet Mode: wyj�cie FifoLevel (Set when the number of bytes in the FIFO strictly
																													exceeds FifoThreshold; else cleared) z modu�u RFM69H 
													 Continuous Mode: (wyj�cie z modu�u RFM69H zegara synchronizuj�cego bity sekwencji nadawczej
													 Poziom na DIO2 (Data) jest pr�bkowany przy ka�dym narastaj�cym zboczu tego zegara, mo�e si� zmienia� przy opadaj�cym zboczu)
 PC2(IN) -----------> DIO0 Packet Mode: wyj�cie PacketSent (Set in Tx when the complete packet has been sent.
																														cleared when exiting Tx) 
*/

 
#include "IO_init.h"
#include "tasks.h"
#include <string.h>


void main(void)
{
	uint8_t send_seq_cnt = 0;
	uint16_t time_stamp = 0xFFFF; //init, by by�o r�ne od warto�ci w tick_500ms
	CLKs_config();
	GPIO_init();
	EXTI_init();
	SPI_init();
	Timer2_init();
	//init_crc8();
	tick_500ms = 0;
	
	enableInterrupts();
	while(1)  //g��wna p�tla programu
	{
		if ((!(pb4sem)) &&
			  (time_stamp != tick_500ms))
		{
			switch (tick_500ms)
			{                    //dzia�aj�ce na du�ej p�ytce
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
		if (send_seq_cnt == 0) //gdy nie jest wysy�ana sekwencja glikemii
		{
			if (tick_500ms & 1) //gdy nieparzysta warto�� tick_500ms
				GPIO_WriteLow(Green_LED_GPIO_Port, Green_LED_Pin); //za�wiecenie zielonej LED
			else
				GPIO_WriteHigh(Green_LED_GPIO_Port, Green_LED_Pin); //zgaszenie zielonej LED
		}
		
	}
}
