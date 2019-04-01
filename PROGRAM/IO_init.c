
#include "IO_init.h"
#include "stm8s_conf.h"

void GPIO_init(void)
{
	GPIO_DeInit(GPIOA);
	GPIO_DeInit(GPIOB);
	GPIO_DeInit(GPIOD);
	GPIO_DeInit(GPIOC);
	GPIO_DeInit(GPIOE);
	GPIO_DeInit(GPIOF);
	//ponizej init wszystkich port�w jako input z pull-up'ami, by zmniejszy� pob�r pr�du przez mikrokontroler
	GPIO_Init(GPIOA, GPIO_PIN_ALL, GPIO_MODE_IN_PU_NO_IT); //Port A jako wej�cie z pull-up'ami
	GPIO_Init(GPIOB, GPIO_PIN_ALL, GPIO_MODE_IN_PU_NO_IT); //Port B jako wej�cie z pull-up'ami
	GPIO_Init(GPIOC, GPIO_PIN_ALL, GPIO_MODE_IN_PU_NO_IT); //Port C jako wej�cie z pull-up'ami
	GPIO_Init(GPIOD, GPIO_PIN_ALL, GPIO_MODE_IN_PU_NO_IT); //Port D jako wej�cie z pull-up'ami
	GPIO_Init(GPIOE, GPIO_PIN_ALL, GPIO_MODE_IN_PU_NO_IT); //Port E jako wej�cie z pull-up'ami
	GPIO_Init(GPIOF, GPIO_PIN_ALL, GPIO_MODE_IN_PU_NO_IT); //Port F jako wej�cie z pull-up'ami
	//poni�ej odpowiedni init potrzebnych linii I/O
	
	GPIO_Init(Pushbutton_GPIO_Port, Pushbutton4_Pin, GPIO_MODE_IN_PU_IT ); //na PB4 jest czarny przycisk "4", b�dzie wyzwala� przerwanie, pull-up

  GPIO_Init(Green_LED_GPIO_Port, Green_LED_Pin, GPIO_MODE_OUT_PP_HIGH_SLOW ); //zielona LED b�dzie zgaszona
	GPIO_Init(Red_LED_GPIO_Port, Red_LED_Pin, GPIO_MODE_OUT_PP_HIGH_SLOW ); //czerwona LED b�dzie zgaszona
	
	GPIO_Init(SPI_Port, MISO_Pin, GPIO_MODE_IN_FL_NO_IT);
	GPIO_Init(SPI_Port, MOSI_Pin, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(SPI_Port, SCK_Pin, GPIO_MODE_OUT_PP_HIGH_FAST);

	GPIO_Init(CS_RFM_Port, CS_RFM_Pin, GPIO_MODE_OUT_PP_HIGH_SLOW); //deselect slave SPI RFM69H na czas initu
	GPIO_Init(RESET_RFM_Port, RESET_RFM_Pin, GPIO_MODE_OUT_PP_LOW_SLOW); //PC3 b�dzie sterowa� wej�ciem resetu modu�u, aktywny poziom wysoki
	GPIO_Init(DIO_RFM_Port, DIO1_RFM_Pin, GPIO_MODE_IN_PU_NO_IT); //PC1 b�dzie p�niej wyzwala� przerwanie zboczem narastaj�cym przy pracy modu�u RFM69 w Packet Mode, teraz konfig jako zwyk�e wej�cie
	GPIO_Init(DIO_RFM_Port, DIO0_RFM_Pin, GPIO_MODE_IN_PU_NO_IT); //PC2 b�dzie p�niej wyzwala� przerwanie zboczem narastaj�cym, teraz konfig jako zwyk�e wej�cie
}



void EXTI_init(void)
{
	EXTI_DeInit();
	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_RISE_ONLY); //przerwania przyjmowane z portu C zboczem narastaj�cym
	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOB, EXTI_SENSITIVITY_FALL_ONLY); //przerwania przyjmowane z portu B zboczem opadaj�cym
	//EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY); //przerwania TLI z PD7 przyjmowane opadaj�cym zboczem
}



void CLKs_config(void)
{
//	ErrorStatus HSE_status = ERROR;
//	uint32_t delay = 131072;
	CLK_HSICmd(ENABLE); //w��czenie HSI
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) != SET);
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // HSI / 1
/*	CLK_HSECmd(ENABLE); //w�aczenie HSE
	while((CLK_GetFlagStatus(CLK_FLAG_HSERDY) != SET) && (delay > 0))
	{
		delay--;
	} */
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_MANUAL, CLK_SOURCE_HSI, ENABLE, CLK_CURRENTCLOCKSTATE_ENABLE ); //prze��czenie system clk na HSI
/*	if (delay > 0)
	  HSE_status = CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE); //prze��czenie system clk na HSE i wy�aczenie HSI
	*/
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); //fsysclk = (HSE / 1) / 1
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
}


void SPI_init(void)
{
	SPI_DeInit();
	SPI_Init(SPI_FIRSTBIT_MSB,
					 SPI_BAUDRATEPRESCALER_2,
					 SPI_MODE_MASTER,
					 SPI_CLOCKPOLARITY_LOW, //when idle
					 SPI_CLOCKPHASE_1EDGE, //set SPI mode 1
					 SPI_DATADIRECTION_2LINES_FULLDUPLEX,
					 SPI_NSS_SOFT,
					 7); //default CRC Polynomial value
	SPI_Cmd(ENABLE);
}



uint8_t SPI_send_receive(uint8_t data)
{
	uint8_t returned_data;
	while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
	SPI_SendData(data);
	while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
	returned_data = SPI_ReceiveData();
	return returned_data;
}


void Timer2_init(void)
{
	TIM2_DeInit();
	TIM2_TimeBaseInit(TIM2_PRESCALER_2, 8000); //timer2 b�dzie si� przepe�nia� co ok. 1ms (fsysclk / 2 / 8000) dla zegara 16MHz 
	TIM2_UpdateDisableConfig(DISABLE); //A UEV is generated as soon as a counter overflow occurs
	TIM2_UpdateRequestConfig(TIM2_UPDATESOURCE_GLOBAL); //the UIF bit is set and an update interrupt request is sent only when registers are updated (counter overflow/underflow).
	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
	TIM2_SelectOnePulseMode(TIM2_OPMODE_REPETITIVE);
	TIM2_Cmd(ENABLE); /* Enable TIM2 */
}