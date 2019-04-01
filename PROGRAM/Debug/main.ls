   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  74                     ; 68 void main(void)
  74                     ; 69 {
  76                     	switch	.text
  77  0000               _main:
  79  0000 5203          	subw	sp,#3
  80       00000003      OFST:	set	3
  83                     ; 70 	uint8_t send_seq_cnt = 0;
  85                     ; 71 	uint16_t time_stamp = 0xFFFF; //init, by by³o ró¿ne od wartoœci w tick_500ms
  87  0002 aeffff        	ldw	x,#65535
  88  0005 1f01          	ldw	(OFST-2,sp),x
  90                     ; 72 	CLKs_config();
  92  0007 cd0000        	call	_CLKs_config
  94                     ; 73 	GPIO_init();
  96  000a cd0000        	call	_GPIO_init
  98                     ; 74 	EXTI_init();
 100  000d cd0000        	call	_EXTI_init
 102                     ; 75 	SPI_init();
 104  0010 cd0000        	call	_SPI_init
 106                     ; 76 	Timer2_init();
 108  0013 cd0000        	call	_Timer2_init
 110                     ; 78 	tick_500ms = 0;
 112  0016 5f            	clrw	x
 113  0017 bf00          	ldw	_tick_500ms,x
 114                     ; 80 	enableInterrupts();
 117  0019 9a            rim
 119  001a               L53:
 120                     ; 83 		if ((!(pb4sem)) &&
 120                     ; 84 			  (time_stamp != tick_500ms))
 122  001a 3d00          	tnz	_pb4sem
 123  001c 266d          	jrne	L14
 125  001e 1e01          	ldw	x,(OFST-2,sp)
 126  0020 b300          	cpw	x,_tick_500ms
 127  0022 2767          	jreq	L14
 128                     ; 86 			switch (tick_500ms)
 130  0024 be00          	ldw	x,_tick_500ms
 132                     ; 109 								break;
 133  0026 5d            	tnzw	x
 134  0027 2750          	jreq	L3
 135  0029 1d0268        	subw	x,#616
 136  002c 274b          	jreq	L3
 137  002e 1d0306        	subw	x,#774
 138  0031 2746          	jreq	L3
 139  0033 1d0200        	subw	x,#512
 140  0036 2741          	jreq	L3
 141  0038 1d01f4        	subw	x,#500
 142  003b 273c          	jreq	L3
 143  003d 1d02b2        	subw	x,#690
 144  0040 2737          	jreq	L3
 145  0042 1d022a        	subw	x,#554
 146  0045 2732          	jreq	L3
 147  0047 1d01f2        	subw	x,#498
 148  004a 272d          	jreq	L3
 149  004c 1d0282        	subw	x,#642
 150  004f 2728          	jreq	L3
 151  0051 1d026c        	subw	x,#620
 152  0054 2723          	jreq	L3
 153  0056 1d0306        	subw	x,#774
 154  0059 271e          	jreq	L3
 155  005b 1d0200        	subw	x,#512
 156  005e 2719          	jreq	L3
 157  0060 1d01f4        	subw	x,#500
 158  0063 2714          	jreq	L3
 159  0065 1d02b2        	subw	x,#690
 160  0068 270f          	jreq	L3
 161  006a 1d0228        	subw	x,#552
 162  006d 270a          	jreq	L3
 163  006f 1d01f4        	subw	x,#500
 164  0072 2705          	jreq	L3
 165  0074 1d0284        	subw	x,#644
 166  0077 2612          	jrne	L14
 167  0079               L3:
 168                     ; 88 				case 0:    // 00		0
 168                     ; 89 				case 616:  // 10		618
 168                     ; 90 				case 1390: // 20		1400
 168                     ; 91 				case 1902: // 30		1914		
 168                     ; 92 				case 2402: // 40		2420
 168                     ; 93 				case 3092: // 50		3116
 168                     ; 94 				case 3646: // 60		3672
 168                     ; 95 				case 4144: // 70		4174
 168                     ; 96 				case 4786: // 00		4824
 168                     ; 97 				case 5406: // 10		5446
 168                     ; 98 				case 6180: // 20		6224
 168                     ; 99 				case 6692: // 30		6742
 168                     ; 100 				case 7192: // 40		7244
 168                     ; 101 				case 7882: // 50		7938
 168                     ; 102 				case 8434: // 60		8496
 168                     ; 103 				case 8934: // 70		8998
 168                     ; 104 				case 9578: // 00		9648
 168                     ; 105 								pb4sem = true;
 170  0079 35010000      	mov	_pb4sem,#1
 171                     ; 106 								time_stamp = tick_500ms;
 173  007d be00          	ldw	x,_tick_500ms
 174  007f 1f01          	ldw	(OFST-2,sp),x
 176                     ; 107 								if (tick_500ms == 9578)
 178  0081 be00          	ldw	x,_tick_500ms
 179  0083 a3256a        	cpw	x,#9578
 180  0086 2603          	jrne	L14
 181                     ; 108 									tick_500ms = 0;
 183  0088 5f            	clrw	x
 184  0089 bf00          	ldw	_tick_500ms,x
 185  008b               L54:
 186  008b               L14:
 187                     ; 112 		send_seq_cnt = send_sequence_func(NULL);
 189  008b 5f            	clrw	x
 190  008c cd0000        	call	_send_sequence_func
 192  008f 01            	rrwa	x,a
 193  0090 6b03          	ld	(OFST+0,sp),a
 194  0092 02            	rlwa	x,a
 196                     ; 113 		greenLEDblink_func(send_seq_cnt);
 198  0093 7b03          	ld	a,(OFST+0,sp)
 199  0095 5f            	clrw	x
 200  0096 97            	ld	xl,a
 201  0097 cd0000        	call	_greenLEDblink_func
 203                     ; 114 		if (send_seq_cnt == 0) //gdy nie jest wysy³ana sekwencja glikemii
 205  009a 0d03          	tnz	(OFST+0,sp)
 206  009c 2703          	jreq	L6
 207  009e cc001a        	jp	L53
 208  00a1               L6:
 209                     ; 116 			if (tick_500ms & 1) //gdy nieparzysta wartoœæ tick_500ms
 211  00a1 b601          	ld	a,_tick_500ms+1
 212  00a3 a501          	bcp	a,#1
 213  00a5 270d          	jreq	L35
 214                     ; 117 				GPIO_WriteLow(Green_LED_GPIO_Port, Green_LED_Pin); //zaœwiecenie zielonej LED
 216  00a7 4b01          	push	#1
 217  00a9 ae500f        	ldw	x,#20495
 218  00ac cd0000        	call	_GPIO_WriteLow
 220  00af 84            	pop	a
 222  00b0 ac1a001a      	jpf	L53
 223  00b4               L35:
 224                     ; 119 				GPIO_WriteHigh(Green_LED_GPIO_Port, Green_LED_Pin); //zgaszenie zielonej LED
 226  00b4 4b01          	push	#1
 227  00b6 ae500f        	ldw	x,#20495
 228  00b9 cd0000        	call	_GPIO_WriteHigh
 230  00bc 84            	pop	a
 231  00bd ac1a001a      	jpf	L53
 244                     	xdef	_main
 245                     	xref	_send_sequence_func
 246                     	xref	_greenLEDblink_func
 247                     	xref.b	_tick_500ms
 248                     	xref.b	_pb4sem
 249                     	xref	_SPI_init
 250                     	xref	_Timer2_init
 251                     	xref	_EXTI_init
 252                     	xref	_CLKs_config
 253                     	xref	_GPIO_init
 254                     	xref	_GPIO_WriteLow
 255                     	xref	_GPIO_WriteHigh
 274                     	end
