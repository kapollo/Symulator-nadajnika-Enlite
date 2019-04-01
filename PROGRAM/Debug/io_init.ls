   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  44                     ; 5 void GPIO_init(void)
  44                     ; 6 {
  46                     	switch	.text
  47  0000               _GPIO_init:
  51                     ; 7 	GPIO_DeInit(GPIOA);
  53  0000 ae5000        	ldw	x,#20480
  54  0003 cd0000        	call	_GPIO_DeInit
  56                     ; 8 	GPIO_DeInit(GPIOB);
  58  0006 ae5005        	ldw	x,#20485
  59  0009 cd0000        	call	_GPIO_DeInit
  61                     ; 9 	GPIO_DeInit(GPIOD);
  63  000c ae500f        	ldw	x,#20495
  64  000f cd0000        	call	_GPIO_DeInit
  66                     ; 10 	GPIO_DeInit(GPIOC);
  68  0012 ae500a        	ldw	x,#20490
  69  0015 cd0000        	call	_GPIO_DeInit
  71                     ; 11 	GPIO_DeInit(GPIOE);
  73  0018 ae5014        	ldw	x,#20500
  74  001b cd0000        	call	_GPIO_DeInit
  76                     ; 12 	GPIO_DeInit(GPIOF);
  78  001e ae5019        	ldw	x,#20505
  79  0021 cd0000        	call	_GPIO_DeInit
  81                     ; 14 	GPIO_Init(GPIOA, GPIO_PIN_ALL, GPIO_MODE_IN_PU_NO_IT); //Port A jako wejœcie z pull-up'ami
  83  0024 4b40          	push	#64
  84  0026 4bff          	push	#255
  85  0028 ae5000        	ldw	x,#20480
  86  002b cd0000        	call	_GPIO_Init
  88  002e 85            	popw	x
  89                     ; 15 	GPIO_Init(GPIOB, GPIO_PIN_ALL, GPIO_MODE_IN_PU_NO_IT); //Port B jako wejœcie z pull-up'ami
  91  002f 4b40          	push	#64
  92  0031 4bff          	push	#255
  93  0033 ae5005        	ldw	x,#20485
  94  0036 cd0000        	call	_GPIO_Init
  96  0039 85            	popw	x
  97                     ; 16 	GPIO_Init(GPIOC, GPIO_PIN_ALL, GPIO_MODE_IN_PU_NO_IT); //Port C jako wejœcie z pull-up'ami
  99  003a 4b40          	push	#64
 100  003c 4bff          	push	#255
 101  003e ae500a        	ldw	x,#20490
 102  0041 cd0000        	call	_GPIO_Init
 104  0044 85            	popw	x
 105                     ; 17 	GPIO_Init(GPIOD, GPIO_PIN_ALL, GPIO_MODE_IN_PU_NO_IT); //Port D jako wejœcie z pull-up'ami
 107  0045 4b40          	push	#64
 108  0047 4bff          	push	#255
 109  0049 ae500f        	ldw	x,#20495
 110  004c cd0000        	call	_GPIO_Init
 112  004f 85            	popw	x
 113                     ; 18 	GPIO_Init(GPIOE, GPIO_PIN_ALL, GPIO_MODE_IN_PU_NO_IT); //Port E jako wejœcie z pull-up'ami
 115  0050 4b40          	push	#64
 116  0052 4bff          	push	#255
 117  0054 ae5014        	ldw	x,#20500
 118  0057 cd0000        	call	_GPIO_Init
 120  005a 85            	popw	x
 121                     ; 19 	GPIO_Init(GPIOF, GPIO_PIN_ALL, GPIO_MODE_IN_PU_NO_IT); //Port F jako wejœcie z pull-up'ami
 123  005b 4b40          	push	#64
 124  005d 4bff          	push	#255
 125  005f ae5019        	ldw	x,#20505
 126  0062 cd0000        	call	_GPIO_Init
 128  0065 85            	popw	x
 129                     ; 22 	GPIO_Init(Pushbutton_GPIO_Port, Pushbutton4_Pin, GPIO_MODE_IN_PU_IT ); //na PB4 jest czarny przycisk "4", bêdzie wyzwalaæ przerwanie, pull-up
 131  0066 4b60          	push	#96
 132  0068 4b10          	push	#16
 133  006a ae5005        	ldw	x,#20485
 134  006d cd0000        	call	_GPIO_Init
 136  0070 85            	popw	x
 137                     ; 24   GPIO_Init(Green_LED_GPIO_Port, Green_LED_Pin, GPIO_MODE_OUT_PP_HIGH_SLOW ); //zielona LED bêdzie zgaszona
 139  0071 4bd0          	push	#208
 140  0073 4b01          	push	#1
 141  0075 ae500f        	ldw	x,#20495
 142  0078 cd0000        	call	_GPIO_Init
 144  007b 85            	popw	x
 145                     ; 25 	GPIO_Init(Red_LED_GPIO_Port, Red_LED_Pin, GPIO_MODE_OUT_PP_HIGH_SLOW ); //czerwona LED bêdzie zgaszona
 147  007c 4bd0          	push	#208
 148  007e 4b04          	push	#4
 149  0080 ae500f        	ldw	x,#20495
 150  0083 cd0000        	call	_GPIO_Init
 152  0086 85            	popw	x
 153                     ; 27 	GPIO_Init(SPI_Port, MISO_Pin, GPIO_MODE_IN_FL_NO_IT);
 155  0087 4b00          	push	#0
 156  0089 4b80          	push	#128
 157  008b ae500a        	ldw	x,#20490
 158  008e cd0000        	call	_GPIO_Init
 160  0091 85            	popw	x
 161                     ; 28 	GPIO_Init(SPI_Port, MOSI_Pin, GPIO_MODE_OUT_PP_HIGH_FAST);
 163  0092 4bf0          	push	#240
 164  0094 4b40          	push	#64
 165  0096 ae500a        	ldw	x,#20490
 166  0099 cd0000        	call	_GPIO_Init
 168  009c 85            	popw	x
 169                     ; 29 	GPIO_Init(SPI_Port, SCK_Pin, GPIO_MODE_OUT_PP_HIGH_FAST);
 171  009d 4bf0          	push	#240
 172  009f 4b20          	push	#32
 173  00a1 ae500a        	ldw	x,#20490
 174  00a4 cd0000        	call	_GPIO_Init
 176  00a7 85            	popw	x
 177                     ; 31 	GPIO_Init(CS_RFM_Port, CS_RFM_Pin, GPIO_MODE_OUT_PP_HIGH_SLOW); //deselect slave SPI RFM69H na czas initu
 179  00a8 4bd0          	push	#208
 180  00aa 4b10          	push	#16
 181  00ac ae500a        	ldw	x,#20490
 182  00af cd0000        	call	_GPIO_Init
 184  00b2 85            	popw	x
 185                     ; 32 	GPIO_Init(RESET_RFM_Port, RESET_RFM_Pin, GPIO_MODE_OUT_PP_LOW_SLOW); //PC3 bêdzie sterowaæ wejœciem resetu modu³u, aktywny poziom wysoki
 187  00b3 4bc0          	push	#192
 188  00b5 4b08          	push	#8
 189  00b7 ae500a        	ldw	x,#20490
 190  00ba cd0000        	call	_GPIO_Init
 192  00bd 85            	popw	x
 193                     ; 33 	GPIO_Init(DIO_RFM_Port, DIO1_RFM_Pin, GPIO_MODE_IN_PU_NO_IT); //PC1 bêdzie póŸniej wyzwalaæ przerwanie zboczem narastaj¹cym przy pracy modu³u RFM69 w Packet Mode, teraz konfig jako zwyk³e wejœcie
 195  00be 4b40          	push	#64
 196  00c0 4b02          	push	#2
 197  00c2 ae500a        	ldw	x,#20490
 198  00c5 cd0000        	call	_GPIO_Init
 200  00c8 85            	popw	x
 201                     ; 34 	GPIO_Init(DIO_RFM_Port, DIO0_RFM_Pin, GPIO_MODE_IN_PU_NO_IT); //PC2 bêdzie póŸniej wyzwalaæ przerwanie zboczem narastaj¹cym, teraz konfig jako zwyk³e wejœcie
 203  00c9 4b40          	push	#64
 204  00cb 4b04          	push	#4
 205  00cd ae500a        	ldw	x,#20490
 206  00d0 cd0000        	call	_GPIO_Init
 208  00d3 85            	popw	x
 209                     ; 35 }
 212  00d4 81            	ret
 237                     ; 39 void EXTI_init(void)
 237                     ; 40 {
 238                     	switch	.text
 239  00d5               _EXTI_init:
 243                     ; 41 	EXTI_DeInit();
 245  00d5 cd0000        	call	_EXTI_DeInit
 247                     ; 42 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_RISE_ONLY); //przerwania przyjmowane z portu C zboczem narastaj¹cym
 249  00d8 ae0201        	ldw	x,#513
 250  00db cd0000        	call	_EXTI_SetExtIntSensitivity
 252                     ; 43 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOB, EXTI_SENSITIVITY_FALL_ONLY); //przerwania przyjmowane z portu B zboczem opadaj¹cym
 254  00de ae0102        	ldw	x,#258
 255  00e1 cd0000        	call	_EXTI_SetExtIntSensitivity
 257                     ; 45 }
 260  00e4 81            	ret
 289                     ; 49 void CLKs_config(void)
 289                     ; 50 {
 290                     	switch	.text
 291  00e5               _CLKs_config:
 295                     ; 53 	CLK_HSICmd(ENABLE); //w³¹czenie HSI
 297  00e5 a601          	ld	a,#1
 298  00e7 cd0000        	call	_CLK_HSICmd
 301  00ea               L34:
 302                     ; 54 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) != SET);
 304  00ea ae0102        	ldw	x,#258
 305  00ed cd0000        	call	_CLK_GetFlagStatus
 307  00f0 a101          	cp	a,#1
 308  00f2 26f6          	jrne	L34
 309                     ; 55 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // HSI / 1
 311  00f4 4f            	clr	a
 312  00f5 cd0000        	call	_CLK_HSIPrescalerConfig
 314                     ; 61 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_MANUAL, CLK_SOURCE_HSI, ENABLE, CLK_CURRENTCLOCKSTATE_ENABLE ); //prze³¹czenie system clk na HSI
 316  00f8 4b01          	push	#1
 317  00fa 4b01          	push	#1
 318  00fc ae00e1        	ldw	x,#225
 319  00ff cd0000        	call	_CLK_ClockSwitchConfig
 321  0102 85            	popw	x
 322                     ; 65 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); //fsysclk = (HSE / 1) / 1
 324  0103 a680          	ld	a,#128
 325  0105 cd0000        	call	_CLK_SYSCLKConfig
 327                     ; 66 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
 329  0108 ae0101        	ldw	x,#257
 330  010b cd0000        	call	_CLK_PeripheralClockConfig
 332                     ; 67 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
 334  010e ae0501        	ldw	x,#1281
 335  0111 cd0000        	call	_CLK_PeripheralClockConfig
 337                     ; 68 }
 340  0114 81            	ret
 366                     ; 71 void SPI_init(void)
 366                     ; 72 {
 367                     	switch	.text
 368  0115               _SPI_init:
 372                     ; 73 	SPI_DeInit();
 374  0115 cd0000        	call	_SPI_DeInit
 376                     ; 74 	SPI_Init(SPI_FIRSTBIT_MSB,
 376                     ; 75 					 SPI_BAUDRATEPRESCALER_2,
 376                     ; 76 					 SPI_MODE_MASTER,
 376                     ; 77 					 SPI_CLOCKPOLARITY_LOW, //when idle
 376                     ; 78 					 SPI_CLOCKPHASE_1EDGE, //set SPI mode 1
 376                     ; 79 					 SPI_DATADIRECTION_2LINES_FULLDUPLEX,
 376                     ; 80 					 SPI_NSS_SOFT,
 376                     ; 81 					 7); //default CRC Polynomial value
 378  0118 4b07          	push	#7
 379  011a 4b02          	push	#2
 380  011c 4b00          	push	#0
 381  011e 4b00          	push	#0
 382  0120 4b00          	push	#0
 383  0122 4b04          	push	#4
 384  0124 5f            	clrw	x
 385  0125 cd0000        	call	_SPI_Init
 387  0128 5b06          	addw	sp,#6
 388                     ; 82 	SPI_Cmd(ENABLE);
 390  012a a601          	ld	a,#1
 391  012c cd0000        	call	_SPI_Cmd
 393                     ; 83 }
 396  012f 81            	ret
 442                     ; 87 uint8_t SPI_send_receive(uint8_t data)
 442                     ; 88 {
 443                     	switch	.text
 444  0130               _SPI_send_receive:
 446  0130 88            	push	a
 447  0131 88            	push	a
 448       00000001      OFST:	set	1
 451  0132               L301:
 452                     ; 90 	while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
 454  0132 a602          	ld	a,#2
 455  0134 cd0000        	call	_SPI_GetFlagStatus
 457  0137 4d            	tnz	a
 458  0138 27f8          	jreq	L301
 459                     ; 91 	SPI_SendData(data);
 461  013a 7b02          	ld	a,(OFST+1,sp)
 462  013c cd0000        	call	_SPI_SendData
 465  013f               L111:
 466                     ; 92 	while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
 468  013f a601          	ld	a,#1
 469  0141 cd0000        	call	_SPI_GetFlagStatus
 471  0144 4d            	tnz	a
 472  0145 27f8          	jreq	L111
 473                     ; 93 	returned_data = SPI_ReceiveData();
 475  0147 cd0000        	call	_SPI_ReceiveData
 477  014a 6b01          	ld	(OFST+0,sp),a
 479                     ; 94 	return returned_data;
 481  014c 7b01          	ld	a,(OFST+0,sp)
 484  014e 85            	popw	x
 485  014f 81            	ret
 515                     ; 98 void Timer2_init(void)
 515                     ; 99 {
 516                     	switch	.text
 517  0150               _Timer2_init:
 521                     ; 100 	TIM2_DeInit();
 523  0150 cd0000        	call	_TIM2_DeInit
 525                     ; 101 	TIM2_TimeBaseInit(TIM2_PRESCALER_2, 8000); //timer2 bêdzie siê przepe³nia³ co ok. 1ms (fsysclk / 2 / 8000) dla zegara 16MHz 
 527  0153 ae1f40        	ldw	x,#8000
 528  0156 89            	pushw	x
 529  0157 a601          	ld	a,#1
 530  0159 cd0000        	call	_TIM2_TimeBaseInit
 532  015c 85            	popw	x
 533                     ; 102 	TIM2_UpdateDisableConfig(DISABLE); //A UEV is generated as soon as a counter overflow occurs
 535  015d 4f            	clr	a
 536  015e cd0000        	call	_TIM2_UpdateDisableConfig
 538                     ; 103 	TIM2_UpdateRequestConfig(TIM2_UPDATESOURCE_GLOBAL); //the UIF bit is set and an update interrupt request is sent only when registers are updated (counter overflow/underflow).
 540  0161 4f            	clr	a
 541  0162 cd0000        	call	_TIM2_UpdateRequestConfig
 543                     ; 104 	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
 545  0165 ae0101        	ldw	x,#257
 546  0168 cd0000        	call	_TIM2_ITConfig
 548                     ; 105 	TIM2_SelectOnePulseMode(TIM2_OPMODE_REPETITIVE);
 550  016b 4f            	clr	a
 551  016c cd0000        	call	_TIM2_SelectOnePulseMode
 553                     ; 106 	TIM2_Cmd(ENABLE); /* Enable TIM2 */
 555  016f a601          	ld	a,#1
 556  0171 cd0000        	call	_TIM2_Cmd
 558                     ; 107 }
 561  0174 81            	ret
 574                     	xdef	_SPI_send_receive
 575                     	xdef	_SPI_init
 576                     	xdef	_Timer2_init
 577                     	xdef	_EXTI_init
 578                     	xdef	_CLKs_config
 579                     	xdef	_GPIO_init
 580                     	xref	_TIM2_SelectOnePulseMode
 581                     	xref	_TIM2_UpdateRequestConfig
 582                     	xref	_TIM2_UpdateDisableConfig
 583                     	xref	_TIM2_ITConfig
 584                     	xref	_TIM2_Cmd
 585                     	xref	_TIM2_TimeBaseInit
 586                     	xref	_TIM2_DeInit
 587                     	xref	_SPI_GetFlagStatus
 588                     	xref	_SPI_ReceiveData
 589                     	xref	_SPI_SendData
 590                     	xref	_SPI_Cmd
 591                     	xref	_SPI_Init
 592                     	xref	_SPI_DeInit
 593                     	xref	_GPIO_Init
 594                     	xref	_GPIO_DeInit
 595                     	xref	_EXTI_SetExtIntSensitivity
 596                     	xref	_EXTI_DeInit
 597                     	xref	_CLK_GetFlagStatus
 598                     	xref	_CLK_SYSCLKConfig
 599                     	xref	_CLK_HSIPrescalerConfig
 600                     	xref	_CLK_ClockSwitchConfig
 601                     	xref	_CLK_PeripheralClockConfig
 602                     	xref	_CLK_HSICmd
 621                     	end
