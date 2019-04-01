   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  45                     ; 7 INTERRUPT void EXTI2_ISR(void)
  45                     ; 8 {
  46                     	switch	.text
  47  0000               f_EXTI2_ISR:
  49  0000 8a            	push	cc
  50  0001 84            	pop	a
  51  0002 a4bf          	and	a,#191
  52  0004 88            	push	a
  53  0005 86            	pop	cc
  54  0006 3b0002        	push	c_x+2
  55  0009 be00          	ldw	x,c_x
  56  000b 89            	pushw	x
  57  000c 3b0002        	push	c_y+2
  58  000f be00          	ldw	x,c_y
  59  0011 89            	pushw	x
  60  0012 be02          	ldw	x,c_lreg+2
  61  0014 89            	pushw	x
  62  0015 be00          	ldw	x,c_lreg
  63  0017 89            	pushw	x
  66                     ; 9 	if (GPIO_ReadInputPin(DIO_RFM_Port, DIO1_RFM_Pin)) //gdy pojawi siê sygna³ FIFO_Level na PC1
  68  0018 4b02          	push	#2
  69  001a ae500a        	ldw	x,#20490
  70  001d cd0000        	call	_GPIO_ReadInputPin
  72  0020 5b01          	addw	sp,#1
  73  0022 4d            	tnz	a
  74  0023 270e          	jreq	L12
  75                     ; 11 		start_TX_RX_seq_sem++; //ka¿de wywo³anie tej funkcji zwiêksza start_TX_RX_seq_sem o 1
  77  0025 3c00          	inc	_start_TX_RX_seq_sem
  78                     ; 12 		end_TX_RX_seq_sem = 0; //wyzerowanie znacznika koñca transmisji, bo dopiero transmisja rozpoczyna siê
  80  0027 3f00          	clr	_end_TX_RX_seq_sem
  81                     ; 13 		if (start_TX_RX_seq_sem > 1)
  83  0029 b600          	ld	a,_start_TX_RX_seq_sem
  84  002b a102          	cp	a,#2
  85  002d 2504          	jrult	L12
  86                     ; 14 			start_TX_RX_seq_sem = 1; //utrzymanie wartoœci == 1 semafora start_TX_RX_seq_sem - znacznik startu transmisji
  88  002f 35010000      	mov	_start_TX_RX_seq_sem,#1
  89  0033               L12:
  90                     ; 16 	if (GPIO_ReadInputPin(DIO_RFM_Port, DIO0_RFM_Pin)) //gdy pojawi siê sygna³ Packet_Sent (Tx) na PC2
  92  0033 4b04          	push	#4
  93  0035 ae500a        	ldw	x,#20490
  94  0038 cd0000        	call	_GPIO_ReadInputPin
  96  003b 5b01          	addw	sp,#1
  97  003d 4d            	tnz	a
  98  003e 270e          	jreq	L52
  99                     ; 18 		end_TX_RX_seq_sem++; //ka¿de wywo³anie tej funkcji zwiêksza end_TX_RX_seq_sem o 1
 101  0040 3c00          	inc	_end_TX_RX_seq_sem
 102                     ; 19 		start_TX_RX_seq_sem = 0; //wyzerowanie znacznika pocz¹tku transmisji - wszystkie dane z FIFO zosta³u ju¿ wys³ane
 104  0042 3f00          	clr	_start_TX_RX_seq_sem
 105                     ; 20 		if (end_TX_RX_seq_sem > 1)
 107  0044 b600          	ld	a,_end_TX_RX_seq_sem
 108  0046 a102          	cp	a,#2
 109  0048 2504          	jrult	L52
 110                     ; 21 			end_TX_RX_seq_sem = 1; //utrzymanie wartoœci == 1 semafora end_TX_RX_seq_sem - znacznik koñca transmisji
 112  004a 35010000      	mov	_end_TX_RX_seq_sem,#1
 113  004e               L52:
 114                     ; 23 }
 117  004e 85            	popw	x
 118  004f bf00          	ldw	c_lreg,x
 119  0051 85            	popw	x
 120  0052 bf02          	ldw	c_lreg+2,x
 121  0054 85            	popw	x
 122  0055 bf00          	ldw	c_y,x
 123  0057 320002        	pop	c_y+2
 124  005a 85            	popw	x
 125  005b bf00          	ldw	c_x,x
 126  005d 320002        	pop	c_x+2
 127  0060 80            	iret
 151                     ; 28 INTERRUPT void EXTI1_ISR(void)
 151                     ; 29 {
 152                     	switch	.text
 153  0061               f_EXTI1_ISR:
 155  0061 8a            	push	cc
 156  0062 84            	pop	a
 157  0063 a4bf          	and	a,#191
 158  0065 88            	push	a
 159  0066 86            	pop	cc
 160  0067 3b0002        	push	c_x+2
 161  006a be00          	ldw	x,c_x
 162  006c 89            	pushw	x
 163  006d 3b0002        	push	c_y+2
 164  0070 be00          	ldw	x,c_y
 165  0072 89            	pushw	x
 166  0073 be02          	ldw	x,c_lreg+2
 167  0075 89            	pushw	x
 168  0076 be00          	ldw	x,c_lreg
 169  0078 89            	pushw	x
 172                     ; 30 	if (GPIO_ReadInputPin(Pushbutton_GPIO_Port, Pushbutton4_Pin) == RESET)  /********** gdy naciœniêty czarny przycisk "4" *************/
 174  0079 4b10          	push	#16
 175  007b ae5005        	ldw	x,#20485
 176  007e cd0000        	call	_GPIO_ReadInputPin
 178  0081 5b01          	addw	sp,#1
 179  0083 4d            	tnz	a
 180  0084 260c          	jrne	L14
 181                     ; 32 		pb4sem++; //ka¿de wywo³anie tej funkcji zwiêksza pb4sem o 1 (max wartoœæ 255)
 183  0086 3c00          	inc	_pb4sem
 184                     ; 33 		if (pb4sem > 1)
 186  0088 b600          	ld	a,_pb4sem
 187  008a a102          	cp	a,#2
 188  008c 2504          	jrult	L14
 189                     ; 34 			pb4sem = 1; //utrzymanie wartoœci == 1 semafora pb4sem - znacznik naciœniêcia przycisku "4"
 191  008e 35010000      	mov	_pb4sem,#1
 192  0092               L14:
 193                     ; 36 }
 196  0092 85            	popw	x
 197  0093 bf00          	ldw	c_lreg,x
 198  0095 85            	popw	x
 199  0096 bf02          	ldw	c_lreg+2,x
 200  0098 85            	popw	x
 201  0099 bf00          	ldw	c_y,x
 202  009b 320002        	pop	c_y+2
 203  009e 85            	popw	x
 204  009f bf00          	ldw	c_x,x
 205  00a1 320002        	pop	c_x+2
 206  00a4 80            	iret
 208                     	switch	.ubsct
 209  0000               L54_tick_1ms:
 210  0000 0000          	ds.b	2
 246                     ; 40 INTERRUPT void TIM2_update_overflowISR(void)
 246                     ; 41 {
 247                     	switch	.text
 248  00a5               f_TIM2_update_overflowISR:
 250  00a5 8a            	push	cc
 251  00a6 84            	pop	a
 252  00a7 a4bf          	and	a,#191
 253  00a9 88            	push	a
 254  00aa 86            	pop	cc
 255  00ab 3b0002        	push	c_x+2
 256  00ae be00          	ldw	x,c_x
 257  00b0 89            	pushw	x
 258  00b1 3b0002        	push	c_y+2
 259  00b4 be00          	ldw	x,c_y
 260  00b6 89            	pushw	x
 261  00b7 be02          	ldw	x,c_lreg+2
 262  00b9 89            	pushw	x
 263  00ba be00          	ldw	x,c_lreg
 264  00bc 89            	pushw	x
 267                     ; 43 	TIM2_ClearFlag(TIM2_FLAG_UPDATE); //wyczyszczenie flagi przepe³nienia TIM2
 269  00bd ae0001        	ldw	x,#1
 270  00c0 cd0000        	call	_TIM2_ClearFlag
 272                     ; 44 	tick_1ms++; //ka¿de wywo³anie tej funkcji zwiêksza tick_1ms o 1
 274  00c3 be00          	ldw	x,L54_tick_1ms
 275  00c5 1c0001        	addw	x,#1
 276  00c8 bf00          	ldw	L54_tick_1ms,x
 277                     ; 45 	system_tick++;
 279  00ca be00          	ldw	x,_system_tick
 280  00cc 1c0001        	addw	x,#1
 281  00cf bf00          	ldw	_system_tick,x
 282                     ; 46 	if (tick_1ms >= 500) 
 284  00d1 be00          	ldw	x,L54_tick_1ms
 285  00d3 a301f4        	cpw	x,#500
 286  00d6 250a          	jrult	L56
 287                     ; 48 	  tick_500ms++; //zwiêkszenie tego licznika co ka¿de 500ms
 289  00d8 be00          	ldw	x,_tick_500ms
 290  00da 1c0001        	addw	x,#1
 291  00dd bf00          	ldw	_tick_500ms,x
 292                     ; 49 		tick_1ms = 0;
 294  00df 5f            	clrw	x
 295  00e0 bf00          	ldw	L54_tick_1ms,x
 296  00e2               L56:
 297                     ; 51 }
 300  00e2 85            	popw	x
 301  00e3 bf00          	ldw	c_lreg,x
 302  00e5 85            	popw	x
 303  00e6 bf02          	ldw	c_lreg+2,x
 304  00e8 85            	popw	x
 305  00e9 bf00          	ldw	c_y,x
 306  00eb 320002        	pop	c_y+2
 307  00ee 85            	popw	x
 308  00ef bf00          	ldw	c_x,x
 309  00f1 320002        	pop	c_x+2
 310  00f4 80            	iret
 322                     	xref.b	_end_TX_RX_seq_sem
 323                     	xref.b	_start_TX_RX_seq_sem
 324                     	xref.b	_tick_500ms
 325                     	xref.b	_system_tick
 326                     	xref.b	_pb4sem
 327                     	xdef	f_TIM2_update_overflowISR
 328                     	xdef	f_EXTI1_ISR
 329                     	xdef	f_EXTI2_ISR
 330                     	xref	_TIM2_ClearFlag
 331                     	xref	_GPIO_ReadInputPin
 332                     	xref.b	c_lreg
 333                     	xref.b	c_x
 334                     	xref.b	c_y
 353                     	end
