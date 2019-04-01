#include "tasks.h"
#include "IO_init.h"

#include <string.h>
#include <stdlib.h>
#include "DK_RFM.h"

volatile uint8_t pb4sem; //znacznik naciśnięcia przycisku "4" pilota MED-LINK (tutaj symulacja)
volatile uint16_t system_tick, tick_500ms; //liczniki inkrementowane przerwaniami z przepełnienia timera2			
volatile uint8_t start_TX_RX_seq_sem; //znacznik rozpoczęcia transmisji przez moduł RFM69HCW
volatile uint8_t end_TX_RX_seq_sem; //znacznik zakończenia transmisji przez moduł RFM69HCW

const 
uint8_t marker[] = {0xAB}; //znacznik danych z nadajnika Enlite w trybie normalnej pracy, bez rozruchu
uint8_t flag[] = {0x0F}; //stała flaga 0F, nieznany parametr
uint8_t sensor_ID[] = {0x26, 0x6B, 0x2C}; //ID nadajnika 0x266B2C = 2517804
uint8_t firmware[] = {0x0D}; //wersja firmware 1.3 nadajnika
uint8_t any_data[] = {0x0E, 0x1E}; //stałe bajty danych, nieznane, do sprawdzenia
uint8_t sequence[] = {0x00}; //numery 8 kolejnych sekwencji: 00, 10, 20, 30, 40, 50, 60, 70
uint8_t raw_data[] = {0x0B, 0xB6}; //aktualny pomiar, dane surowe- raw data
uint8_t inp_seq[] = {0x0D, 0x4D, 0x00, 0x5C, 0x5C, 0xCE, 0x0D, 0x4D, 0x0D, 0x4D, 0x0D,   //pozostałe dane z nadajnika, poziom baterii
		     0x4D, 0x0D, 0x4D, 0x0D, 0x4D, 0x0D, 0x4D, 0x0D, 0x4D, 0x00}; // i 8 poprzednich raw data
uint8_t inp_data_to_encode[32] = {0};
uint8_t *seq_to_send = NULL;
										
static const uint8_t const_table[] = {0xFF, 0xFF};										

static const uint16_t crc16_table[] = // Lookup table for CRC-16 calculation with polynomial 0x1021.
       {0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50A5, 0x60C6, 0x70E7,
	0x8108, 0x9129, 0xA14A, 0xB16B, 0xC18C, 0xD1AD, 0xE1CE, 0xF1EF,
	0x1231, 0x0210, 0x3273, 0x2252, 0x52B5, 0x4294, 0x72F7, 0x62D6,
	0x9339, 0x8318, 0xB37B, 0xA35A, 0xD3BD, 0xC39C, 0xF3FF, 0xE3DE,
	0x2462, 0x3443, 0x0420, 0x1401, 0x64E6, 0x74C7, 0x44A4, 0x5485,
	0xA56A, 0xB54B, 0x8528, 0x9509, 0xE5EE, 0xF5CF, 0xC5AC, 0xD58D,
	0x3653, 0x2672, 0x1611, 0x0630, 0x76D7, 0x66F6, 0x5695, 0x46B4,
	0xB75B, 0xA77A, 0x9719, 0x8738, 0xF7DF, 0xE7FE, 0xD79D, 0xC7BC,
	0x48C4, 0x58E5, 0x6886, 0x78A7, 0x0840, 0x1861, 0x2802, 0x3823,
	0xC9CC, 0xD9ED, 0xE98E, 0xF9AF, 0x8948, 0x9969, 0xA90A, 0xB92B,
	0x5AF5, 0x4AD4, 0x7AB7, 0x6A96, 0x1A71, 0x0A50, 0x3A33, 0x2A12,
	0xDBFD, 0xCBDC, 0xFBBF, 0xEB9E, 0x9B79, 0x8B58, 0xBB3B, 0xAB1A,
	0x6CA6, 0x7C87, 0x4CE4, 0x5CC5, 0x2C22, 0x3C03, 0x0C60, 0x1C41,
	0xEDAE, 0xFD8F, 0xCDEC, 0xDDCD, 0xAD2A, 0xBD0B, 0x8D68, 0x9D49,
	0x7E97, 0x6EB6, 0x5ED5, 0x4EF4, 0x3E13, 0x2E32, 0x1E51, 0x0E70,
	0xFF9F, 0xEFBE, 0xDFDD, 0xCFFC, 0xBF1B, 0xAF3A, 0x9F59, 0x8F78,
	0x9188, 0x81A9, 0xB1CA, 0xA1EB, 0xD10C, 0xC12D, 0xF14E, 0xE16F,
	0x1080, 0x00A1, 0x30C2, 0x20E3, 0x5004, 0x4025, 0x7046, 0x6067,
	0x83B9, 0x9398, 0xA3FB, 0xB3DA, 0xC33D, 0xD31C, 0xE37F, 0xF35E,
	0x02B1, 0x1290, 0x22F3, 0x32D2, 0x4235, 0x5214, 0x6277, 0x7256,
	0xB5EA, 0xA5CB, 0x95A8, 0x8589, 0xF56E, 0xE54F, 0xD52C, 0xC50D,
	0x34E2, 0x24C3, 0x14A0, 0x0481, 0x7466, 0x6447, 0x5424, 0x4405,
	0xA7DB, 0xB7FA, 0x8799, 0x97B8, 0xE75F, 0xF77E, 0xC71D, 0xD73C,
	0x26D3, 0x36F2, 0x0691, 0x16B0, 0x6657, 0x7676, 0x4615, 0x5634,
	0xD94C, 0xC96D, 0xF90E, 0xE92F, 0x99C8, 0x89E9, 0xB98A, 0xA9AB,
	0x5844, 0x4865, 0x7806, 0x6827, 0x18C0, 0x08E1, 0x3882, 0x28A3,
	0xCB7D, 0xDB5C, 0xEB3F, 0xFB1E, 0x8BF9, 0x9BD8, 0xABBB, 0xBB9A,
	0x4A75, 0x5A54, 0x6A37, 0x7A16, 0x0AF1, 0x1AD0, 0x2AB3, 0x3A92,
	0xFD2E, 0xED0F, 0xDD6C, 0xCD4D, 0xBDAA, 0xAD8B, 0x9DE8, 0x8DC9,
	0x7C26, 0x6C07, 0x5C64, 0x4C45, 0x3CA2, 0x2C83, 0x1CE0, 0x0CC1,
	0xEF1F, 0xFF3E, 0xCF5D, 0xDF7C, 0xAF9B, 0xBFBA, 0x8FD9, 0x9FF8,
	0x6E17, 0x7E36, 0x4E55, 0x5E74, 0x2E93, 0x3EB2, 0x0ED1, 0x1EF0};


static const uint8_t table_4b6b_code[] = {0b00010101, //0 //dwa najstarsze bity są ignorowane
					  0b00110001, //1
					  0b00110010, //2
					  0b00100011, //3
					  0b00110100, //4
					  0b00100101, //5
					  0b00100110, //6
					  0b00010110, //7
					  0b00011010, //8
					  0b00011001, //9
					  0b00101010, //A
					  0b00001011, //B
					  0b00101100, //C
					  0b00001101, //D
					  0b00001110, //E
					  0b00011100}; //F


/*Funkcja licząca CRC-16 i zwracająca wartość CRC
Argumenty;
data - wskaźnik do tablicy z danymi, dla których ma być policzone CRC
size - wielkość tej tablicy z danymi 
źródło: https://www.menie.org/georges/embedded/crc16.html */
uint16_t crc16(const void *data, uint8_t size)
{
	uint16_t val = 0xFFFF;
	uint8_t *pos = (uint8_t *) data;
	uint8_t *end = pos + size;
	while (pos < end) 
	{
	  val = (val << 8) ^ crc16_table[((val >> 8) ^ (*pos)) & 0xFF];
		pos++;
	}
	return val;
}



/*Wersja z kodowaniem 4b6b tablic marker, flag, sensor_ID, firmware, any_data, 
sequence, raw_data, inp_seq połączonych w jedną wspólną tablicę inp_data_to_encode
Funkcja kodująca dane wejściowe do kodu 4b6b
Wynik tego kodowania wpisze do tablicy wskazanej przez seq_tablePtr.
Gdy seq_tablePtr == NULL, to funkcja przydzieli pamięć dla tej tablicy i następnie
zwróci wskaźnik do przydzielonej pamięci dla tablicy seq_tablePtr.
Argumenty:
inp_data_to_encodePtr - wskaźnik do tablicy z danymi do enkodowania
sizeof_inp_data_to_encode - wielkość tablicy z danymi do enkodowania
seq_tablePtr - wskaźnik do tablicy, w której będą zakodowane dane do wysłania */
uint8_t *modified_encode_4b6b_command_params_for_Tx(uint8_t *inp_data_to_encodePtr,
 																									  uint8_t sizeof_inp_data_to_encode,
																									  uint8_t *seq_tablePtr)
{
	uint32_t code_4b6b = 0; //3 najmłodsze bajty będą przechowywać wynik konwersji danych na kod 4b6b, teraz init początkową wartością
	uint8_t table_for_CRC[51]; 
	uint8_t i, j, idx, sizeof_input_data,
		loop_cnt, coded_nibble,  padding,
		next_triple = 0;	//init tej zmiennej
	uint8_t hi_byte, lo_byte;
	uint16_t CRC16 = 0; //init tej zmiennej
	uint8_t *input_data = NULL;
	memset(table_for_CRC, 0, sizeof(table_for_CRC));

	sizeof_input_data = sizeof_inp_data_to_encode + sizeof(CRC16); 
	padding = 36; //plus powyżej wyliczone sizeof_input_data będzie rozmiarem tablicy wskazywanej przez seq_tablePtr 

	i = 0; //wyzerowanie licznika poniższej pętli
	while ((sizeof_inp_data_to_encode> 0) && //gdy liczba dodatkowych parametrów > 0
		(i < sizeof_inp_data_to_encode)) //i jeszcze nie wszystkie parametry zostały przepisane do tablicy table_for_CRC
	{
		table_for_CRC[i] = inp_data_to_encodePtr[i]; //to przepisywanie parametrów do tablicy table_for_CRC
		i++; //zwiększenie licznika pętli
	}
	table_for_CRC[i] = 0xFF; 
	table_for_CRC[i + 1] = 0xFF; //znacznik 0xFFFF końca wypełnionej tablicy table_for_CRC
	idx = 0;
	if (seq_tablePtr == NULL)
		seq_tablePtr = calloc(sizeof_input_data + padding, sizeof(uint8_t));
	if (seq_tablePtr == NULL)
		GPIO_WriteLow(Red_LED_GPIO_Port, Red_LED_Pin); //czerwona LED będzie stale świecić - problem z przydzieleniem pamięci
	else
	{
		seq_tablePtr[sizeof_input_data + padding - 1] = 0xFF; //wstawienie znacznika na końcu tablicy seq_tablePtr
		input_data = inp_data_to_encodePtr; //teraz będzie kodowana do postaci 4b6b zawartość tablicy inp_data_to_encodePtr
		for(i = 0; i < sizeof_input_data; i++) //pętla kodująca dane do postaci 4b6b i wpisująca te dane
		{                                      //do tablicy seq_tablePtr
			loop_cnt = 2; //będą kodowane dwa półbajty input_data, najpierw starszy, później młodszy
			for (j = 0; j < loop_cnt; j++)
			{
				if (j == 0)
					coded_nibble = (input_data[idx] & 0xF0) >> 4; //najpierw starszy półbajt input_data
				else
					coded_nibble = input_data[idx] & 0x0F; //potem młodszy półbajt input_data
				//wyliczana powyżej zmienna coded_nibble będzie indeksować tablicę table_4b6b_code
				code_4b6b = code_4b6b << 6; //każdorazowe jednokrotne przesunięcie o 6 bitów w lewo
				code_4b6b = code_4b6b | (table_4b6b_code[coded_nibble] & 0x3F); //uwzględniane 6 najmłodszych bitów table_4b6b_code
			}
			idx++;
			if (code_4b6b & 0xFC0000) //gdy powyższe pętle wykonały przesunięcie zawartości code_4b6b 4 razy w lewo (czyli wypełniły już 6 najstarszych bitów 3 bajtu tej zmiennej)
			{
				for (j = 0; j < 3; j++) //w tej pętli wpisanie zakodowanej wartości do odpowiednich trzech kolejno następujących po sobie elementów
				{
					seq_tablePtr[next_triple + j] = (code_4b6b >> (16 - (j * 8))) & 0xFF; //tablicy wskazywanej przez seq_tablePtr
					if ((input_data == &idx) && //gdy kodowany jest już bajt indeksu (wtedy wartość idx jest paddindiem
							(j == 2)) //i wypełniony jest ostatni bajt w tablicy seq_tablePtr
						seq_tablePtr[next_triple + j] = 0; //to wyzerowanie tego bajtu
				}
				next_triple = next_triple + j; //po zakończeniu wypełniania trzech elementów, będzie wypełniana następna trójka elementów
				code_4b6b = 0; //init zmiennej przechowującej wynik konwersji danych
			}
			if ((CRC16 == 0) || //gdy jeszcze nie obliczone CRC16
					(idx < 2)) //lub jeszcze pozostał młodszy bajt obliczonego CRC16
			{
				if ((i + 1) == sizeof_inp_data_to_encode)
				{																												
					for (idx = 0; (memcmp(&table_for_CRC[idx], const_table, 2)); idx++); //obliczenie rozmiaru tablicy table_for_CRC
					CRC16 = crc16(table_for_CRC, idx); 
					hi_byte = CRC16 >> 8;
					lo_byte = CRC16 & 0xFF;
					input_data = &hi_byte;
					idx = 0;
				}
				else if (CRC16 != 0)
							{
								input_data = &lo_byte;
								idx = 0;
							}
			}
		}
	}
	return seq_tablePtr;
}




/*Funkcja odczytująca moduł RFM69H przez SPI. Funkcja zwraca odczytany bajt z zaadresowanego rejestru
Argumenty:
address_data: MSB ==Low - odczyt zaadresowanego rejestru RFM69H
	       7 pozostałych bitów - adres jednego ze 128 wewnętrznych rejestrów modułu RFM69H */
uint8_t RFM69H_SPI_read(uint8_t address)
{
	uint8_t data;
	GPIO_WriteLow(CS_RFM_Port, CS_RFM_Pin); //NSS modułu RFM69H = Low - select module
	SPI_send_receive(address & 0x7F); //wysłanie MSB == Low (będzie odczyt) i 7-bit adresu do modułu
	data = SPI_send_receive(0); //niby zapis w celu odczytu danej
	GPIO_WriteHigh(CS_RFM_Port, CS_RFM_Pin); //NSS modułu RFM69H = High - deselect module
	return data;
}



/*Funkcja zapisująca moduł RFM69H przez SPI. 
Argumenty:
address_data: MSB ==High - zapis zaadresowanego rejestru RFM69H
		7 starszych bitów - adres jednego ze 128 wewnętrznych rejestrów modułu RFM69H
		8 młodszych bitów - dana do zapisu do zaadresowanego rejestru */
void RFM69H_SPI_write(uint16_t address_data)
{
	GPIO_WriteLow(CS_RFM_Port, CS_RFM_Pin); //NSS modułu RFM69H = Low - select module
	SPI_send_receive((address_data >> 8) | 0x80); //wysłanie MSB == High (będzie zapis) i 7-bit adresu do modułu
	SPI_send_receive(address_data & 0xFF); //wysłanie danej do modułu
	GPIO_WriteHigh(CS_RFM_Port, CS_RFM_Pin); //NSS modułu RFM69H = High - deselect module
}


/**********************************************************
**Name:     SPIBurstWrite
**Function: SPI burst write mode
**Input:    adr-----address for write
**          ptr-----data buffer point for write
**          length--how many bytes for write
**Output:   none
**********************************************************/
void BurstWrite(uint8_t adr, uint8_t *ptr, uint8_t length)
{ 
  uint8_t i;

  if(length <= 1)                             //length must more than one
    return;
  else  
  {   
    GPIO_WriteLow(CS_RFM_Port, CS_RFM_Pin); //NSS modułu RFM69H = Low - select module   
    SPI_send_receive(adr | 0x80); //wysłanie MSB == High (będzie zapis) i 7-bit adresu do modułu
    for (i = 0; i < length; i++)
			SPI_send_receive(ptr[i]);
    GPIO_WriteHigh(CS_RFM_Port, CS_RFM_Pin); //NSS modułu RFM69H = High - deselect module
  }
}


/**********************************************************
**Name:     SPIBurstRead
**Function: SPI burst read mode
**Input:    adr-----address for read
**          ptr-----data buffer point for read
**          length--how many bytes for read
**					Break: == true - stop reading; == false - continue reading
**Output:   None
**Return:		how many bytes were read
**********************************************************/
u8 BurstRead(u8 adr, u8 *ptr, u8 length, u8 Break)
{
  u8 i;
  if(length <= 1)                            //length must more than one
    return 0;
  else
  {
    GPIO_WriteLow(CS_RFM_Port, CS_RFM_Pin); //NSS modułu RFM69H = Low - select module   
    SPI_send_receive(adr & 0x7F); //wysłanie MSB == Low (będzie odczyt) i 7-bit adresu do modułu
    for(i = 0; i < length; i++)
		{
			ptr[i] = SPI_send_receive(0);
			if (Break)
			{
				i++; //by funkcja zwróciła rzeczywistą ilość odczytanych bajtów 
				break;
			}
		}
    GPIO_WriteHigh(CS_RFM_Port, CS_RFM_Pin); //NSS modułu RFM69H = High - deselect module
  }
	return i;
}


/*Funkcja przygotowująca nadajnik RFM69H do wysłania sekwencji
Funkcja zwraca true, gdy moduł RFM69H gotowy do nadawaia; false w przeciwnym razie
Argumenty:
RFM69_mode - tryb pracy modułu, może być CONTINUOUS lub PACKET
*/
uint8_t config_RFM69H_for_TX(uint8_t RFM69_mode)
{
//	static uint8_t version;
	GPIO_WriteHigh(RESET_RFM_Port, RESET_RFM_Pin); //== High - reset modułu
	for(system_tick = 0; system_tick < 1;); //zaczekanie 1 ms
	GPIO_WriteLow(RESET_RFM_Port, RESET_RFM_Pin); //== Low - koniec resetu modułu
	for(system_tick = 0; system_tick < 6;); //zaczekanie 5 ms
	RFM69H_EntryTx(RFM69_mode);
	system_tick = 0;
	while (gb_WaitStableFlag == 0x0F) //w tej pętli oczekiwanie na gotowość modułu RFM69H do nadawania
	{
		gb_SysTimer_1S = gb_SysTimer_1S - (system_tick / 1000);
		if (system_tick == 1000)
		  system_tick = 0;
		RFM69H_TxWaitStable();
	}

	return gb_WaitStableFlag;
}


/********************************************************************/
/*           Poniżej funkcje tasków                                 */
/********************************************************************/


/*Funkcja migająca zielonym LED-em
Argument 
LED_on_off = 0xFFFF - led świeci; = 0x0 - led zgaszona
Zależnie od wyboru bitu tej zmiennej; LED będzie migać z różną częstotliwością*/
void greenLEDblink_func(uint16_t LED_on_off)
{
	static uint8_t LED_old_state;
	if (LED_old_state != (LED_on_off & 0x02)) //gdy zapamiętany stan LED != od nowego, zadanego 
	{                                         //zmienną LED_on_off, to odpowiednia zmiana stanu LED stosownie do stanu  2. bitu zmiennej LED_on_off
		if (LED_on_off & 0x02)
			GPIO_WriteLow(Green_LED_GPIO_Port, Green_LED_Pin);
		else
			GPIO_WriteHigh(Green_LED_GPIO_Port, Green_LED_Pin);
	}
	LED_old_state = (LED_on_off & 0x02); //i zapamiętanie nowego stanu LED
}

	

/* Funkcja, która będzie wysyłać sekwencję glikemii
Funkcja zwraca ilość powtórek wysłania sekwencji glikemii
Argumenty: 
seq_sent_successPtr - wskaźnik do znacznika: == true, gdy udało się wysłać sekwencję glikemii; == false w przeciwnym razie*/
uint16_t send_sequence_func(uint8_t *seq_sent_successPtr)
{
	int8_t	idx = 0;
	uint16_t word;
	static uint8_t *seq_to_send;
	static uint8_t sent_sequence,
								 setup_for_Tx;
	static uint8_t send_seq_cnt;
	static uint8_t nbr_seq;
	static uint8_t inc, dec;
	if ((pb4sem) && 
		(!(sent_sequence))) //gdy jeszcze nie wysłana sekwencja glikemii
	{
		GPIO_WriteLow(Red_LED_GPIO_Port, Red_LED_Pin); //zaświecenie czerwonej LED - początek wysyłania sekwecji
		if (!(setup_for_Tx)) //gdy setup do nadawania jeszcze nie zrobiony
		{
			memcpy(&inp_data_to_encode[idx], marker, sizeof(marker));
			idx = idx + sizeof(marker);
			memcpy(&inp_data_to_encode[idx], flag, sizeof(flag));
			idx = idx + sizeof(flag);
			memcpy(&inp_data_to_encode[idx], sensor_ID, sizeof(sensor_ID));
			idx = idx + sizeof(sensor_ID);
			memcpy(&inp_data_to_encode[idx], firmware, sizeof(firmware));
			idx = idx + sizeof(firmware);
			memcpy(&inp_data_to_encode[idx], any_data, sizeof(any_data));
			idx = idx + sizeof(any_data);
			memcpy(&inp_data_to_encode[idx], sequence, sizeof(sequence));
			idx = idx + sizeof(sequence);
			memcpy(&inp_data_to_encode[idx], raw_data, sizeof(raw_data));
			idx = idx + sizeof(raw_data);
			memcpy(&inp_data_to_encode[idx], inp_seq, sizeof(inp_seq));
			idx = idx + sizeof(inp_seq);
			seq_to_send = modified_encode_4b6b_command_params_for_Tx(inp_data_to_encode, idx, seq_to_send); //wpisanie enkodowanych wartości do tablicy seq_to_send
			if (config_RFM69H_for_TX(PACKET)) //moduł jest gotowy do wysłania komendy po konfigu
			{
				GPIO_WriteHigh(Red_LED_GPIO_Port, Red_LED_Pin); //zgaszenie czerwonej LED
				setup_for_Tx = true; //by już nie powtarzać konfigu modułu RFM69H
				send_seq_cnt = 0; //wyzerowanie licznika wysłań komendy
				GPIO_Init(DIO_RFM_Port, DIO1_RFM_Pin, GPIO_MODE_IN_PU_IT); /*PC1 będzie wyzwalać przerwanie zboczem narastającym
				Na PC1 jest sygnał FIFO_Level. Zbocze narastające pojawia się, gdy ilość danych w FIFO przekroczy nastawiony próg - kryterium startu transmisji */
				GPIO_Init(DIO_RFM_Port, DIO0_RFM_Pin, GPIO_MODE_IN_PU_IT); /*PC2 będzie wyzwalać przerwanie zboczem narastającym
				Na PC2 jest sygnał Packet_sent. Zbocze narastające pojawia się, gdy FIFO jest całkowicie puste i ostatni bit z rejestru przesuwającego został wysłany - kryterium końca transmisji*/
			}
			else //moduł RFM69H nie jest gotowy do nadawania
			{
				setup_for_Tx = false;  
				GPIO_WriteLow(Red_LED_GPIO_Port, Red_LED_Pin); //czerwona LED będzie stale świecić - problem z konfigiem modułu RFM69H
				free(seq_to_send);
				seq_to_send = NULL;
				*seq_sent_successPtr = false;
			}
		}
		else //już zrobiony setup modułu RFM69 do nadawania
		{
			while(start_TX_RX_seq_sem); //zaczekanie na gotowość przyjęcia nowych danych przez FIFO
			BurstWrite(0x00, seq_to_send, 52); //wysłanie sekwencji komendy do FIFO
			while(!(end_TX_RX_seq_sem)); //zaczekanie na koniec transmisji danych z FIFO przez moduł RFM69H
			send_seq_cnt++;
			if (send_seq_cnt > 0x80)
				sent_sequence = true;  //koniec wysyłania sekwencji
			else
				sent_sequence = false;  //by przygotować do powtórki wysyłania sekwencji glikemii
			end_TX_RX_seq_sem = 0; //wyczyszczenie znacznika końca transmisji danych z FIFO
			start_TX_RX_seq_sem = 0; //wyczyszczenie znacznika początku zapisu danych do FIFO
			if (sent_sequence) //gdy już wysłana sekwencja glikemii
			{
				setup_for_Tx = false; //by przygotować do ponownego setupu modułu RFM69H do nadawania
				send_seq_cnt = 0;
				RFM69H_Sleep(); //przełączenie RFM69H w tryb Sleep
			}
		}
	}
	if ((pb4sem) && //gdy ma być wysłana kolejna sekwencja
			(sent_sequence))
	{
		idx = sizeof(inp_seq) - 3; //indeks ostatniej dwójki bajtów przed kończącym zerem w inp_seq
		while ((idx - 2) >= 6) //pętla przesuwająca dwójki bajtów w tablicy inp_seq z pozycji (idx - 2) na pozycję idx
		{  //wykonuje się tak długo, aż (idx - 2) < 6
			memcpy(&inp_seq[idx], &inp_seq[idx - 2], 2);
			idx = idx - 2;
		}
		memcpy(&inp_seq[idx], inp_seq, 2); //przesunięcie dwójki bajtów z początku tablicy inp_seq na pozycję wskazywaną przez idx(pominięcie następnych 4 bajtów za początkową dwójką)
		memcpy(inp_seq, raw_data, 2); //i skopiowanie na początek tablicy inp_seq dwójki bajtów z tablicy raw_data
		nbr_seq = (nbr_seq + 0x10) & 0x70; //zwiększenie numeru sekwencji (starsze 3 bity) i wyzerowanie znacznika powtórki tej samej sekwencji (4 młodsze bity)
		sequence[0] = nbr_seq & 0x70;
		word = (raw_data[0] << 8) | raw_data[1];
		if (word >= 6000)
		{
			dec = true;
			inc = false;
		}
		if (word <= 3000)
		{
			dec = false;
			inc = true;
		}
		if (inc)
			word = word + 375;
		if (dec)
			word = word - 375;
		raw_data[0] = word >> 8;
		raw_data[1] = word & 0xFF;
	}
	if ((pb4sem) && //przygotowanie do wysłania następnej sekwencji po naciśnięciu przycisku
			(sent_sequence))
	{
		GPIO_WriteHigh(Red_LED_GPIO_Port, Red_LED_Pin); //zgaszenie czerwonej LED
		sent_sequence = false;
		pb4sem = false;
	}
	return send_seq_cnt;
}


