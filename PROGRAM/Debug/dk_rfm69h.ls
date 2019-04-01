   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  14                     .const:	section	.text
  15  0000               _RFM69HFreqTbl:
  16  0000 074e          	dc.w	1870
  17  0002 08c0          	dc.w	2240
  18  0004 0900          	dc.w	2304
  19  0006 076c          	dc.w	1900
  20  0008 0880          	dc.w	2176
  21  000a 0900          	dc.w	2304
  22  000c 07d9          	dc.w	2009
  23  000e 0816          	dc.w	2070
  24  0010 0966          	dc.w	2406
  25  0012 07e4          	dc.w	2020
  26  0014 08c0          	dc.w	2240
  27  0016 0900          	dc.w	2304
  28  0018               _RFM69HRateTbl:
  29  0018 0368          	dc.w	872
  30  001a 042b          	dc.w	1067
  31  001c 0334          	dc.w	820
  32  001e 0415          	dc.w	1045
  33  0020 031a          	dc.w	794
  34  0022 040b          	dc.w	1035
  35  0024 030d          	dc.w	781
  36  0026 0405          	dc.w	1029
  37  0028 0307          	dc.w	775
  38  002a 04a1          	dc.w	1185
  39  002c               _RFM69HPowerTbl:
  40  002c 117f          	dc.w	4479
  41  002e 117c          	dc.w	4476
  42  0030 1179          	dc.w	4473
  43  0032 1176          	dc.w	4470
  44  0034 115f          	dc.w	4447
  45  0036               _RFM69HConfigTblTx:
  46  0036 0208          	dc.w	520
  47  0038 0502          	dc.w	1282
  48  003a 0641          	dc.w	1601
  49  003c 2c00          	dc.w	11264
  50  003e 2d10          	dc.w	11536
  51  0040 2e98          	dc.w	11928
  52  0042 2fff          	dc.w	12287
  53  0044 3000          	dc.w	12288
  54  0046 31ff          	dc.w	12799
  55  0048 3200          	dc.w	12800
  56  004a 3700          	dc.w	14080
  57  004c 3834          	dc.w	14388
  58  004e 3c33          	dc.w	15411
  59  0050 6f30          	dc.w	28464
  60  0052 0104          	dc.w	260
  61  0054               _RFM69HConfigTblTx_ContMode:
  62  0054 0248          	dc.w	584
  63  0056 0502          	dc.w	1282
  64  0058 0641          	dc.w	1601
  65  005a 2e00          	dc.w	11776
  66  005c 3700          	dc.w	14080
  67  005e 6f30          	dc.w	28464
  68  0060 0104          	dc.w	260
  69  0062               _RFM69HConfigTblRx:
  70  0062 0208          	dc.w	520
  71  0064 0502          	dc.w	1282
  72  0066 0641          	dc.w	1601
  73  0068 1949          	dc.w	6473
  74  006a 2c00          	dc.w	11264
  75  006c 2d10          	dc.w	11536
  76  006e 2e98          	dc.w	11928
  77  0070 2fff          	dc.w	12287
  78  0072 3000          	dc.w	12288
  79  0074 31ff          	dc.w	12799
  80  0076 3200          	dc.w	12800
  81  0078 3700          	dc.w	14080
  82  007a 3800          	dc.w	14336
  83  007c 3c40          	dc.w	15424
  84  007e 1888          	dc.w	6280
  85  0080 581b          	dc.w	22555
  86  0082 6f00          	dc.w	28416
  87  0084 0104          	dc.w	260
  88  0086               _RFM69HRxTbl:
  89  0086 119f          	dc.w	4511
  90  0088 2540          	dc.w	9536
  91  008a 1310          	dc.w	4880
  92  008c 5a55          	dc.w	23125
  93  008e 5c70          	dc.w	23664
  94  0090 0110          	dc.w	272
  95  0092               _RFM69HTxTbl:
  96  0092 2500          	dc.w	9472
  97  0094 130f          	dc.w	4879
  98  0096 5a55          	dc.w	23125
  99  0098 5c70          	dc.w	23664
 100  009a 010c          	dc.w	268
 101  009c               _RFM69HData:
 102  009c 486f70655246  	dc.b	"HopeRF RFM COBRFM6"
 103  00ae 39485300      	dc.b	"9HS",0
 104  00b2               _gb_RateBuf_Addr:
 105  00b2 04            	dc.b	4
 106  00b3               _gb_FreqBuf_Addr:
 107  00b3 02            	dc.b	2
 108  00b4               _gb_PowerBuf_Addr:
 109  00b4 04            	dc.b	4
 110                     	bsct
 111  0000               _gb_WaitStableFlag:
 112  0000 00            	dc.b	0
 113  0001               _gb_ErrorFlag:
 114  0001 00            	dc.b	0
 115  0002               _gb_SysTimer_1S:
 116  0002 00            	dc.b	0
 117  0003               _gb_StatusRx:
 118  0003 00            	dc.b	0
 119  0004               _nIRQ0:
 120  0004 00            	dc.b	0
 121  0005               _gb_StatusTx:
 122  0005 00            	dc.b	0
 123  0006               _gw_RF_SentInterval:
 124  0006 00            	dc.b	0
 125  0007               _gw_TxTimer:
 126  0007 00            	dc.b	0
 127  0008               _RFData:
 128  0008 00            	dc.b	0
 195                     ; 195 void RFM69H_Config(u8 transceiver_mode, u8 RFM69H_mode)
 195                     ; 196 {
 197                     	switch	.text
 198  0000               _RFM69H_Config:
 200  0000 89            	pushw	x
 201  0001 88            	push	a
 202       00000001      OFST:	set	1
 205                     ; 199 	for(i = 0; i < 3; i++)
 207  0002 0f01          	clr	(OFST+0,sp)
 209  0004               L74:
 210                     ; 201     RFM69H_SPI_write(RFM69HFreqTbl[gb_FreqBuf_Addr][i]);           //setting frequency parameter
 212  0004 7b01          	ld	a,(OFST+0,sp)
 213  0006 5f            	clrw	x
 214  0007 97            	ld	xl,a
 215  0008 58            	sllw	x
 216  0009 de000c        	ldw	x,(_RFM69HFreqTbl+12,x)
 217  000c cd0000        	call	_RFM69H_SPI_write
 219                     ; 202 		for (system_tick = 0; system_tick < 1;); //zaczekanie 1 ms
 221  000f 5f            	clrw	x
 222  0010 bf00          	ldw	_system_tick,x
 223  0012               L55:
 227  0012 be00          	ldw	x,_system_tick
 228  0014 27fc          	jreq	L55
 229                     ; 199 	for(i = 0; i < 3; i++)
 231  0016 0c01          	inc	(OFST+0,sp)
 235  0018 7b01          	ld	a,(OFST+0,sp)
 236  001a a103          	cp	a,#3
 237  001c 25e6          	jrult	L74
 238                     ; 204   for(i = 0; i < 2; i++)
 240  001e 0f01          	clr	(OFST+0,sp)
 242  0020               L36:
 243                     ; 206     RFM69H_SPI_write(RFM69HRateTbl[gb_RateBuf_Addr][i]);           //setting rf rate parameter
 245  0020 7b01          	ld	a,(OFST+0,sp)
 246  0022 5f            	clrw	x
 247  0023 97            	ld	xl,a
 248  0024 58            	sllw	x
 249  0025 de0028        	ldw	x,(_RFM69HRateTbl+16,x)
 250  0028 cd0000        	call	_RFM69H_SPI_write
 252                     ; 207 		for (system_tick = 0; system_tick < 1;); //zaczekanie 1 ms
 254  002b 5f            	clrw	x
 255  002c bf00          	ldw	_system_tick,x
 256  002e               L17:
 260  002e be00          	ldw	x,_system_tick
 261  0030 27fc          	jreq	L17
 262                     ; 204   for(i = 0; i < 2; i++)
 264  0032 0c01          	inc	(OFST+0,sp)
 268  0034 7b01          	ld	a,(OFST+0,sp)
 269  0036 a102          	cp	a,#2
 270  0038 25e6          	jrult	L36
 271                     ; 209   switch (transceiver_mode)
 273  003a 7b02          	ld	a,(OFST+1,sp)
 275                     ; 235 						break;
 276  003c 4d            	tnz	a
 277  003d 2705          	jreq	L3
 278  003f 4a            	dec	a
 279  0040 274a          	jreq	L11
 280  0042 2064          	jra	L101
 281  0044               L3:
 282                     ; 211 		case TX:switch (RFM69H_mode)
 284  0044 7b03          	ld	a,(OFST+2,sp)
 286                     ; 226 													break;
 287  0046 4d            	tnz	a
 288  0047 2705          	jreq	L5
 289  0049 4a            	dec	a
 290  004a 2720          	jreq	L7
 291  004c 205a          	jra	L101
 292  004e               L5:
 293                     ; 213 							case CONTINUOUS:
 293                     ; 214 													for(i = 0; i < (sizeof(RFM69HConfigTblTx_ContMode) / sizeof(&RFM69HConfigTblTx_ContMode[0])); i++)
 295  004e 0f01          	clr	(OFST+0,sp)
 297  0050               L701:
 298                     ; 216 														RFM69H_SPI_write(RFM69HConfigTblTx_ContMode[i]);                          //setting base parameter
 300  0050 7b01          	ld	a,(OFST+0,sp)
 301  0052 5f            	clrw	x
 302  0053 97            	ld	xl,a
 303  0054 58            	sllw	x
 304  0055 de0054        	ldw	x,(_RFM69HConfigTblTx_ContMode,x)
 305  0058 cd0000        	call	_RFM69H_SPI_write
 307                     ; 217 														for (system_tick = 0; system_tick < 1;); //zaczekanie 1 ms
 309  005b 5f            	clrw	x
 310  005c bf00          	ldw	_system_tick,x
 311  005e               L511:
 315  005e be00          	ldw	x,_system_tick
 316  0060 27fc          	jreq	L511
 317                     ; 214 													for(i = 0; i < (sizeof(RFM69HConfigTblTx_ContMode) / sizeof(&RFM69HConfigTblTx_ContMode[0])); i++)
 319  0062 0c01          	inc	(OFST+0,sp)
 323  0064 7b01          	ld	a,(OFST+0,sp)
 324  0066 a107          	cp	a,#7
 325  0068 25e6          	jrult	L701
 326                     ; 219 													break;
 328  006a 203c          	jra	L101
 329  006c               L7:
 330                     ; 220 							case PACKET:
 330                     ; 221 													for(i = 0; i < (sizeof(RFM69HConfigTblTx) / sizeof(&RFM69HConfigTblTx[0])); i++)
 332  006c 0f01          	clr	(OFST+0,sp)
 334  006e               L321:
 335                     ; 223 														RFM69H_SPI_write(RFM69HConfigTblTx[i]);                          //setting base parameter
 337  006e 7b01          	ld	a,(OFST+0,sp)
 338  0070 5f            	clrw	x
 339  0071 97            	ld	xl,a
 340  0072 58            	sllw	x
 341  0073 de0036        	ldw	x,(_RFM69HConfigTblTx,x)
 342  0076 cd0000        	call	_RFM69H_SPI_write
 344                     ; 224 														for (system_tick = 0; system_tick < 1;); //zaczekanie 1 ms
 346  0079 5f            	clrw	x
 347  007a bf00          	ldw	_system_tick,x
 348  007c               L131:
 352  007c be00          	ldw	x,_system_tick
 353  007e 27fc          	jreq	L131
 354                     ; 221 													for(i = 0; i < (sizeof(RFM69HConfigTblTx) / sizeof(&RFM69HConfigTblTx[0])); i++)
 356  0080 0c01          	inc	(OFST+0,sp)
 360  0082 7b01          	ld	a,(OFST+0,sp)
 361  0084 a10f          	cp	a,#15
 362  0086 25e6          	jrult	L321
 363                     ; 226 													break;
 365  0088 201e          	jra	L101
 366  008a               L501:
 367                     ; 228 						break;
 369  008a 201c          	jra	L101
 370  008c               L11:
 371                     ; 229 		case RX:
 371                     ; 230 						for(i = 0; i < (sizeof(RFM69HConfigTblRx) / sizeof(&RFM69HConfigTblRx[0])); i++)
 373  008c 0f01          	clr	(OFST+0,sp)
 375  008e               L731:
 376                     ; 232 							RFM69H_SPI_write(RFM69HConfigTblRx[i]);                          //setting base parameter
 378  008e 7b01          	ld	a,(OFST+0,sp)
 379  0090 5f            	clrw	x
 380  0091 97            	ld	xl,a
 381  0092 58            	sllw	x
 382  0093 de0062        	ldw	x,(_RFM69HConfigTblRx,x)
 383  0096 cd0000        	call	_RFM69H_SPI_write
 385                     ; 233 							for (system_tick = 0; system_tick < 1;); //zaczekanie 1 ms
 387  0099 5f            	clrw	x
 388  009a bf00          	ldw	_system_tick,x
 389  009c               L541:
 393  009c be00          	ldw	x,_system_tick
 394  009e 27fc          	jreq	L541
 395                     ; 230 						for(i = 0; i < (sizeof(RFM69HConfigTblRx) / sizeof(&RFM69HConfigTblRx[0])); i++)
 397  00a0 0c01          	inc	(OFST+0,sp)
 401  00a2 7b01          	ld	a,(OFST+0,sp)
 402  00a4 a112          	cp	a,#18
 403  00a6 25e6          	jrult	L731
 404                     ; 235 						break;
 406  00a8               L101:
 407                     ; 237 }
 410  00a8 5b03          	addw	sp,#3
 411  00aa 81            	ret
 451                     ; 244 void RFM69H_EntryRx(void)
 451                     ; 245 {
 452                     	switch	.text
 453  00ab               _RFM69H_EntryRx:
 455  00ab 88            	push	a
 456       00000001      OFST:	set	1
 459                     ; 247   RFM69H_Config(RX, PACKET);                                         //Module parameter setting
 461  00ac ae0101        	ldw	x,#257
 462  00af cd0000        	call	_RFM69H_Config
 464                     ; 249   for(i = 0; i < (sizeof(RFM69HRxTbl) / sizeof(&RFM69HRxTbl[0])); i++)                         //Define to Rx mode  
 466  00b2 0f01          	clr	(OFST+0,sp)
 468  00b4               L171:
 469                     ; 251     RFM69H_SPI_write(RFM69HRxTbl[i]);
 471  00b4 7b01          	ld	a,(OFST+0,sp)
 472  00b6 5f            	clrw	x
 473  00b7 97            	ld	xl,a
 474  00b8 58            	sllw	x
 475  00b9 de0086        	ldw	x,(_RFM69HRxTbl,x)
 476  00bc cd0000        	call	_RFM69H_SPI_write
 478                     ; 252 		for (system_tick = 0; system_tick < 1;); //zaczekanie 1 ms
 480  00bf 5f            	clrw	x
 481  00c0 bf00          	ldw	_system_tick,x
 482  00c2               L771:
 486  00c2 be00          	ldw	x,_system_tick
 487  00c4 27fc          	jreq	L771
 488                     ; 249   for(i = 0; i < (sizeof(RFM69HRxTbl) / sizeof(&RFM69HRxTbl[0])); i++)                         //Define to Rx mode  
 490  00c6 0c01          	inc	(OFST+0,sp)
 494  00c8 7b01          	ld	a,(OFST+0,sp)
 495  00ca a106          	cp	a,#6
 496  00cc 25e6          	jrult	L171
 497                     ; 255   gb_SysTimer_1S=3;                                        //System time = 3S
 499  00ce 35030002      	mov	_gb_SysTimer_1S,#3
 500                     ; 257   gb_WaitStableFlag=0x0f;                                  //State stable flag initial
 502  00d2 350f0000      	mov	_gb_WaitStableFlag,#15
 503                     ; 258 }
 506  00d6 84            	pop	a
 507  00d7 81            	ret
 558                     ; 266 void RFM69H_EntryTx(u8 RFM69H_mode)
 558                     ; 267 {
 559                     	switch	.text
 560  00d8               _RFM69H_EntryTx:
 562  00d8 88            	push	a
 563       00000001      OFST:	set	1
 566                     ; 269   RFM69H_Config(TX, RFM69H_mode);                                         //Module parameter setting  
 568  00d9 5f            	clrw	x
 569  00da 97            	ld	xl,a
 570  00db cd0000        	call	_RFM69H_Config
 572                     ; 270   RFM69H_SPI_write(RFM69HPowerTbl[gb_PowerBuf_Addr]);              //Setting output power parameter
 574  00de ae115f        	ldw	x,#4447
 575  00e1 cd0000        	call	_RFM69H_SPI_write
 577                     ; 271 	for (system_tick = 0; system_tick < 1;); //zaczekanie 1 ms
 579  00e4 5f            	clrw	x
 580  00e5 bf00          	ldw	_system_tick,x
 581  00e7               L722:
 585  00e7 be00          	ldw	x,_system_tick
 586  00e9 27fc          	jreq	L722
 587                     ; 272 	for(i = 0; i < (sizeof(RFM69HTxTbl) / sizeof(&RFM69HTxTbl[0])); i++)                         //Define to Tx mode  
 589  00eb 0f01          	clr	(OFST+0,sp)
 591  00ed               L532:
 592                     ; 274 		RFM69H_SPI_write(RFM69HTxTbl[i]);
 594  00ed 7b01          	ld	a,(OFST+0,sp)
 595  00ef 5f            	clrw	x
 596  00f0 97            	ld	xl,a
 597  00f1 58            	sllw	x
 598  00f2 de0092        	ldw	x,(_RFM69HTxTbl,x)
 599  00f5 cd0000        	call	_RFM69H_SPI_write
 601                     ; 275 		for (system_tick = 0; system_tick < 1;); //zaczekanie 1 ms
 603  00f8 5f            	clrw	x
 604  00f9 bf00          	ldw	_system_tick,x
 605  00fb               L342:
 609  00fb be00          	ldw	x,_system_tick
 610  00fd 27fc          	jreq	L342
 611                     ; 272 	for(i = 0; i < (sizeof(RFM69HTxTbl) / sizeof(&RFM69HTxTbl[0])); i++)                         //Define to Tx mode  
 613  00ff 0c01          	inc	(OFST+0,sp)
 617  0101 7b01          	ld	a,(OFST+0,sp)
 618  0103 a105          	cp	a,#5
 619  0105 25e6          	jrult	L532
 620                     ; 277   gb_SysTimer_1S = 3;                                        //System time = 3S
 622  0107 35030002      	mov	_gb_SysTimer_1S,#3
 623                     ; 279   gb_WaitStableFlag = 0x0f;                                  //State stable flag initial
 625  010b 350f0000      	mov	_gb_WaitStableFlag,#15
 626                     ; 280 }
 629  010f 84            	pop	a
 630  0110 81            	ret
 669                     ; 288 void RFM69H_TxWaitStable(void)
 669                     ; 289 { 
 670                     	switch	.text
 671  0111               _RFM69H_TxWaitStable:
 673  0111 88            	push	a
 674       00000001      OFST:	set	1
 677                     ; 290   u8 temp = 0;
 679                     ; 291   if(gb_WaitStableFlag == 0x0f) 
 681  0112 b600          	ld	a,_gb_WaitStableFlag
 682  0114 a10f          	cp	a,#15
 683  0116 2625          	jrne	L762
 684                     ; 293     if(gb_SysTimer_1S != 0)
 686  0118 3d02          	tnz	_gb_SysTimer_1S
 687  011a 271b          	jreq	L172
 688                     ; 295       temp = RFM69H_SPI_read(0x27);
 690  011c a627          	ld	a,#39
 691  011e cd0000        	call	_RFM69H_SPI_read
 693  0121 6b01          	ld	(OFST+0,sp),a
 695                     ; 296       if (((temp & 0xA0) == 0xA0) && (temp != 0xff))
 697  0123 7b01          	ld	a,(OFST+0,sp)
 698  0125 a4a0          	and	a,#160
 699  0127 a1a0          	cp	a,#160
 700  0129 2612          	jrne	L762
 702  012b 7b01          	ld	a,(OFST+0,sp)
 703  012d a1ff          	cp	a,#255
 704  012f 270c          	jreq	L762
 705                     ; 298         gb_WaitStableFlag = 1; 
 707  0131 35010000      	mov	_gb_WaitStableFlag,#1
 708  0135 2006          	jra	L762
 709  0137               L172:
 710                     ; 303       gb_ErrorFlag = 1;
 712  0137 35010001      	mov	_gb_ErrorFlag,#1
 713                     ; 304       gb_WaitStableFlag = 0;
 715  013b 3f00          	clr	_gb_WaitStableFlag
 716  013d               L762:
 717                     ; 307 }
 720  013d 84            	pop	a
 721  013e 81            	ret
 760                     ; 315 void RFM69H_RxWaitStable(void)
 760                     ; 316 { 
 761                     	switch	.text
 762  013f               _RFM69H_RxWaitStable:
 764  013f 88            	push	a
 765       00000001      OFST:	set	1
 768                     ; 317   u8 temp=0;
 770                     ; 318   if(gb_WaitStableFlag == 0x0f) 
 772  0140 b600          	ld	a,_gb_WaitStableFlag
 773  0142 a10f          	cp	a,#15
 774  0144 2625          	jrne	L513
 775                     ; 320     if(gb_SysTimer_1S != 0)
 777  0146 3d02          	tnz	_gb_SysTimer_1S
 778  0148 271b          	jreq	L713
 779                     ; 322       temp = RFM69H_SPI_read(0x27);
 781  014a a627          	ld	a,#39
 782  014c cd0000        	call	_RFM69H_SPI_read
 784  014f 6b01          	ld	(OFST+0,sp),a
 786                     ; 323       if (((temp & 0xC0) == 0xC0) && (temp != 0xff))
 788  0151 7b01          	ld	a,(OFST+0,sp)
 789  0153 a4c0          	and	a,#192
 790  0155 a1c0          	cp	a,#192
 791  0157 2612          	jrne	L513
 793  0159 7b01          	ld	a,(OFST+0,sp)
 794  015b a1ff          	cp	a,#255
 795  015d 270c          	jreq	L513
 796                     ; 325         gb_WaitStableFlag = 1;        
 798  015f 35010000      	mov	_gb_WaitStableFlag,#1
 799  0163 2006          	jra	L513
 800  0165               L713:
 801                     ; 330       gb_ErrorFlag = 1;
 803  0165 35010001      	mov	_gb_ErrorFlag,#1
 804                     ; 331       gb_WaitStableFlag = 0;
 806  0169 3f00          	clr	_gb_WaitStableFlag
 807  016b               L513:
 808                     ; 334 }
 811  016b 84            	pop	a
 812  016c 81            	ret
 836                     ; 342 void RFM69H_ClearFIFO(void)
 836                     ; 343 {
 837                     	switch	.text
 838  016d               _RFM69H_ClearFIFO:
 842                     ; 344   RFM69H_SPI_write(0x0104);                                        //Standby
 844  016d ae0104        	ldw	x,#260
 845  0170 cd0000        	call	_RFM69H_SPI_write
 847                     ; 345   RFM69H_SPI_write(0x0110);                                        //entry RxMode
 849  0173 ae0110        	ldw	x,#272
 850  0176 cd0000        	call	_RFM69H_SPI_write
 852                     ; 346 }
 855  0179 81            	ret
 879                     ; 354 void RFM69H_Sleep(void)
 879                     ; 355 {
 880                     	switch	.text
 881  017a               _RFM69H_Sleep:
 885                     ; 356   RFM69H_SPI_write(0x0100);                                        //Sleep
 887  017a ae0100        	ldw	x,#256
 888  017d cd0000        	call	_RFM69H_SPI_write
 890                     ; 357 }
 893  0180 81            	ret
 917                     ; 365 void RFM69H_Standby(void)
 917                     ; 366 {
 918                     	switch	.text
 919  0181               _RFM69H_Standby:
 923                     ; 367   RFM69H_SPI_write(0x0104);                                        //Standby
 925  0181 ae0104        	ldw	x,#260
 926  0184 cd0000        	call	_RFM69H_SPI_write
 928                     ; 368 }
 931  0187 81            	ret
 966                     ; 376 u8 RFM69H_ReadRSSI(void)
 966                     ; 377 {
 967                     	switch	.text
 968  0188               _RFM69H_ReadRSSI:
 970  0188 89            	pushw	x
 971       00000002      OFST:	set	2
 974                     ; 378   u16 temp=0xff;
 976  0189 ae00ff        	ldw	x,#255
 977  018c 1f01          	ldw	(OFST-1,sp),x
 979                     ; 379   if((RFM69H_SPI_read(0x24) & 0x02) == 0x02)
 981  018e a624          	ld	a,#36
 982  0190 cd0000        	call	_RFM69H_SPI_read
 984  0193 a402          	and	a,#2
 985  0195 a102          	cp	a,#2
 986  0197 2617          	jrne	L373
 987                     ; 381     temp = RFM69H_SPI_read(0x24);
 989  0199 a624          	ld	a,#36
 990  019b cd0000        	call	_RFM69H_SPI_read
 992  019e 5f            	clrw	x
 993  019f 97            	ld	xl,a
 994  01a0 1f01          	ldw	(OFST-1,sp),x
 996                     ; 382     temp = 0xff - temp;
 998  01a2 ae00ff        	ldw	x,#255
 999  01a5 72f001        	subw	x,(OFST-1,sp)
1000  01a8 1f01          	ldw	(OFST-1,sp),x
1002                     ; 383     temp >>= 1;
1004  01aa 0401          	srl	(OFST-1,sp)
1005  01ac 0602          	rrc	(OFST+0,sp)
1007                     ; 384     temp &= 0xff;
1009  01ae 0f01          	clr	(OFST-1,sp)
1011  01b0               L373:
1012                     ; 386   return (u8)temp;
1014  01b0 7b02          	ld	a,(OFST+0,sp)
1017  01b2 85            	popw	x
1018  01b3 81            	ret
1068                     ; 396 u8 RFM69H_RxPacket(void)
1068                     ; 397 {
1069                     	switch	.text
1070  01b4               _RFM69H_RxPacket:
1072  01b4 5217          	subw	sp,#23
1073       00000017      OFST:	set	23
1076                     ; 401   RFM69H_RxWaitStable();
1078  01b6 ad87          	call	_RFM69H_RxWaitStable
1080                     ; 402   if(gb_WaitStableFlag == 1)
1082  01b8 b600          	ld	a,_gb_WaitStableFlag
1083  01ba a101          	cp	a,#1
1084  01bc 2608          	jrne	L714
1085                     ; 404     gb_WaitStableFlag = 2;
1087  01be 35020000      	mov	_gb_WaitStableFlag,#2
1088                     ; 405     gb_StatusRx = 1;                                         //Rx state stable
1090  01c2 35010003      	mov	_gb_StatusRx,#1
1091  01c6               L714:
1092                     ; 408   if((nIRQ0 == 1) && (gb_StatusRx == 1))
1094  01c6 b604          	ld	a,_nIRQ0
1095  01c8 a101          	cp	a,#1
1096  01ca 2651          	jrne	L124
1098  01cc b603          	ld	a,_gb_StatusRx
1099  01ce a101          	cp	a,#1
1100  01d0 264b          	jrne	L124
1101                     ; 410     for(i = 0; i < 21; i++) 
1103  01d2 0f17          	clr	(OFST+0,sp)
1105  01d4               L324:
1106                     ; 411       gb_RxData[i] = 0x00;   
1108  01d4 96            	ldw	x,sp
1109  01d5 1c0002        	addw	x,#OFST-21
1110  01d8 9f            	ld	a,xl
1111  01d9 5e            	swapw	x
1112  01da 1b17          	add	a,(OFST+0,sp)
1113  01dc 2401          	jrnc	L03
1114  01de 5c            	incw	x
1115  01df               L03:
1116  01df 02            	rlwa	x,a
1117  01e0 7f            	clr	(x)
1118                     ; 410     for(i = 0; i < 21; i++) 
1120  01e1 0c17          	inc	(OFST+0,sp)
1124  01e3 7b17          	ld	a,(OFST+0,sp)
1125  01e5 a115          	cp	a,#21
1126  01e7 25eb          	jrult	L324
1127                     ; 413     RFM69H_ClearFIFO();    
1129  01e9 ad82          	call	_RFM69H_ClearFIFO
1131                     ; 414     for(i = 0; i < 14; i++)
1133  01eb 0f17          	clr	(OFST+0,sp)
1135  01ed               L134:
1136                     ; 416       if(gb_RxData[i] != RFM69HData[i])
1138  01ed 7b17          	ld	a,(OFST+0,sp)
1139  01ef 5f            	clrw	x
1140  01f0 97            	ld	xl,a
1141  01f1 d6009c        	ld	a,(_RFM69HData,x)
1142  01f4 6b01          	ld	(OFST-22,sp),a
1144  01f6 96            	ldw	x,sp
1145  01f7 1c0002        	addw	x,#OFST-21
1146  01fa 9f            	ld	a,xl
1147  01fb 5e            	swapw	x
1148  01fc 1b17          	add	a,(OFST+0,sp)
1149  01fe 2401          	jrnc	L23
1150  0200 5c            	incw	x
1151  0201               L23:
1152  0201 02            	rlwa	x,a
1153  0202 f6            	ld	a,(x)
1154  0203 1101          	cp	a,(OFST-22,sp)
1155  0205 2608          	jrne	L534
1156                     ; 417         break;  
1158                     ; 414     for(i = 0; i < 14; i++)
1160  0207 0c17          	inc	(OFST+0,sp)
1164  0209 7b17          	ld	a,(OFST+0,sp)
1165  020b a10e          	cp	a,#14
1166  020d 25de          	jrult	L134
1167  020f               L534:
1168                     ; 419     if(i >= 14)   
1170  020f 7b17          	ld	a,(OFST+0,sp)
1171  0211 a10e          	cp	a,#14
1172  0213 2504          	jrult	L144
1173                     ; 420       return(1);                                           //Rx success
1175  0215 a601          	ld	a,#1
1177  0217 2001          	jra	L43
1178  0219               L144:
1179                     ; 422       return(0);
1181  0219 4f            	clr	a
1183  021a               L43:
1185  021a 5b17          	addw	sp,#23
1186  021c 81            	ret
1187  021d               L124:
1188                     ; 425     return(0);
1190  021d 4f            	clr	a
1192  021e 20fa          	jra	L43
1235                     ; 434 u8 RFM69H_TxPacket(void)
1235                     ; 435 {
1236                     	switch	.text
1237  0220               _RFM69H_TxPacket:
1239  0220 88            	push	a
1240       00000001      OFST:	set	1
1243                     ; 436   u8 TxFlag=0;
1245  0221 0f01          	clr	(OFST+0,sp)
1247                     ; 438   RFM69H_TxWaitStable();
1249  0223 cd0111        	call	_RFM69H_TxWaitStable
1251                     ; 439   if(gb_WaitStableFlag == 1)
1253  0226 b600          	ld	a,_gb_WaitStableFlag
1254  0228 a101          	cp	a,#1
1255  022a 2617          	jrne	L564
1256                     ; 441     gb_WaitStableFlag = 2;
1258  022c 35020000      	mov	_gb_WaitStableFlag,#2
1259                     ; 442     if(gb_StatusTx == 0)                                     //First entry Tx mode
1261  0230 3d05          	tnz	_gb_StatusTx
1262  0232 260f          	jrne	L564
1263                     ; 444       gb_StatusTx = 1;                                       //Rx state stable                        
1265  0234 35010005      	mov	_gb_StatusTx,#1
1266                     ; 445       gw_TxTimer = gw_RF_SentInterval;                       //Send time interval
1268  0238 450607        	mov	_gw_TxTimer,_gw_RF_SentInterval
1269                     ; 447       TxFlag = 1;
1271  023b a601          	ld	a,#1
1272  023d 6b01          	ld	(OFST+0,sp),a
1274                     ; 448       gb_WaitStableFlag = 3;
1276  023f 35030000      	mov	_gb_WaitStableFlag,#3
1277  0243               L564:
1278                     ; 451   if(gb_StatusTx == 1)
1280  0243 b605          	ld	a,_gb_StatusTx
1281  0245 a101          	cp	a,#1
1282  0247 2634          	jrne	L174
1283                     ; 453     if(gb_WaitStableFlag == 3 && nIRQ0 == 1)                   //Packet send over
1285  0249 b600          	ld	a,_gb_WaitStableFlag
1286  024b a103          	cp	a,#3
1287  024d 260b          	jrne	L374
1289  024f b604          	ld	a,_nIRQ0
1290  0251 a101          	cp	a,#1
1291  0253 2605          	jrne	L374
1292                     ; 455       gb_WaitStableFlag = 0;
1294  0255 3f00          	clr	_gb_WaitStableFlag
1295                     ; 456       RFM69H_Standby();                                    //Entry Standby mode
1297  0257 cd0181        	call	_RFM69H_Standby
1299  025a               L374:
1300                     ; 458     if(gw_TxTimer == 0)                                      //It's time to Sending
1302  025a 3d07          	tnz	_gw_TxTimer
1303  025c 2611          	jrne	L574
1304                     ; 460       gw_TxTimer = gw_RF_SentInterval;                       //Send time interval
1306  025e 450607        	mov	_gw_TxTimer,_gw_RF_SentInterval
1307                     ; 461       gb_SysTimer_1S = 3;
1309  0261 35030002      	mov	_gb_SysTimer_1S,#3
1310                     ; 462       gb_WaitStableFlag = 0x0f;                              //Promised to call mode stable decide
1312  0265 350f0000      	mov	_gb_WaitStableFlag,#15
1313                     ; 463       RFM69H_SPI_write(0x010C);                              //Entry Tx mode
1315  0269 ae010c        	ldw	x,#268
1316  026c cd0000        	call	_RFM69H_SPI_write
1318  026f               L574:
1319                     ; 465     if(gb_WaitStableFlag == 2)                               //Mode stable
1321  026f b600          	ld	a,_gb_WaitStableFlag
1322  0271 a102          	cp	a,#2
1323  0273 2608          	jrne	L174
1324                     ; 468       TxFlag = 1;
1326  0275 a601          	ld	a,#1
1327  0277 6b01          	ld	(OFST+0,sp),a
1329                     ; 469       gb_WaitStableFlag = 3;
1331  0279 35030000      	mov	_gb_WaitStableFlag,#3
1332  027d               L174:
1333                     ; 472   return TxFlag;
1335  027d 7b01          	ld	a,(OFST+0,sp)
1338  027f 5b01          	addw	sp,#1
1339  0281 81            	ret
1342                     	switch	.const
1343  00b5               _RFM69HTestConfigTbl:
1344  00b5 0248          	dc.w	584
1345  00b7 0502          	dc.w	1282
1346  00b9 0641          	dc.w	1601
1347  00bb 1952          	dc.w	6482
1348  00bd 1888          	dc.w	6280
1349  00bf 2c00          	dc.w	11264
1350  00c1 2d00          	dc.w	11520
1351  00c3 2e00          	dc.w	11776
1352  00c5 3700          	dc.w	14080
1353  00c7 581b          	dc.w	22555
1354  00c9 6f30          	dc.w	28464
1355  00cb 0104          	dc.w	260
1393                     ; 500 void RFM69H_TestConfig(void)
1393                     ; 501 {
1394                     	switch	.text
1395  0282               _RFM69H_TestConfig:
1397  0282 88            	push	a
1398       00000001      OFST:	set	1
1401                     ; 503   for(i = 0; i < 3; i++)                      
1403  0283 0f01          	clr	(OFST+0,sp)
1405  0285               L715:
1406                     ; 504     RFM69H_SPI_write(RFM69HFreqTbl[gb_FreqBuf_Addr][i]);           //setting frequency parameter
1408  0285 7b01          	ld	a,(OFST+0,sp)
1409  0287 5f            	clrw	x
1410  0288 97            	ld	xl,a
1411  0289 58            	sllw	x
1412  028a de000c        	ldw	x,(_RFM69HFreqTbl+12,x)
1413  028d cd0000        	call	_RFM69H_SPI_write
1415                     ; 503   for(i = 0; i < 3; i++)                      
1417  0290 0c01          	inc	(OFST+0,sp)
1421  0292 7b01          	ld	a,(OFST+0,sp)
1422  0294 a103          	cp	a,#3
1423  0296 25ed          	jrult	L715
1424                     ; 505   for(i = 0; i < 2; i++)
1426  0298 0f01          	clr	(OFST+0,sp)
1428  029a               L525:
1429                     ; 506     RFM69H_SPI_write(RFM69HRateTbl[gb_RateBuf_Addr][i]);           //setting rf rate parameter
1431  029a 7b01          	ld	a,(OFST+0,sp)
1432  029c 5f            	clrw	x
1433  029d 97            	ld	xl,a
1434  029e 58            	sllw	x
1435  029f de0028        	ldw	x,(_RFM69HRateTbl+16,x)
1436  02a2 cd0000        	call	_RFM69H_SPI_write
1438                     ; 505   for(i = 0; i < 2; i++)
1440  02a5 0c01          	inc	(OFST+0,sp)
1444  02a7 7b01          	ld	a,(OFST+0,sp)
1445  02a9 a102          	cp	a,#2
1446  02ab 25ed          	jrult	L525
1447                     ; 507   for(i = 0; i < 12; i++)
1449  02ad 0f01          	clr	(OFST+0,sp)
1451  02af               L335:
1452                     ; 508     RFM69H_SPI_write(RFM69HTestConfigTbl[i]);                      //setting base parameter
1454  02af 7b01          	ld	a,(OFST+0,sp)
1455  02b1 5f            	clrw	x
1456  02b2 97            	ld	xl,a
1457  02b3 58            	sllw	x
1458  02b4 de00b5        	ldw	x,(_RFM69HTestConfigTbl,x)
1459  02b7 cd0000        	call	_RFM69H_SPI_write
1461                     ; 507   for(i = 0; i < 12; i++)
1463  02ba 0c01          	inc	(OFST+0,sp)
1467  02bc 7b01          	ld	a,(OFST+0,sp)
1468  02be a10c          	cp	a,#12
1469  02c0 25ed          	jrult	L335
1470                     ; 509 }
1473  02c2 84            	pop	a
1474  02c3 81            	ret
1514                     ; 517 void RFM69H_EntryTestRx(void)
1514                     ; 518 {
1515                     	switch	.text
1516  02c4               _RFM69H_EntryTestRx:
1518  02c4 88            	push	a
1519       00000001      OFST:	set	1
1522                     ; 521   RFM69H_Config(RX, PACKET);                                         //Module parameter setting
1524  02c5 ae0101        	ldw	x,#257
1525  02c8 cd0000        	call	_RFM69H_Config
1527                     ; 522   for(i = 0; i < 6;i++)                                         //Define to Rx mode  
1529  02cb 0f01          	clr	(OFST+0,sp)
1531  02cd               L755:
1532                     ; 523     RFM69H_SPI_write(RFM69HRxTbl[i]);
1534  02cd 7b01          	ld	a,(OFST+0,sp)
1535  02cf 5f            	clrw	x
1536  02d0 97            	ld	xl,a
1537  02d1 58            	sllw	x
1538  02d2 de0086        	ldw	x,(_RFM69HRxTbl,x)
1539  02d5 cd0000        	call	_RFM69H_SPI_write
1541                     ; 522   for(i = 0; i < 6;i++)                                         //Define to Rx mode  
1543  02d8 0c01          	inc	(OFST+0,sp)
1547  02da 7b01          	ld	a,(OFST+0,sp)
1548  02dc a106          	cp	a,#6
1549  02de 25ed          	jrult	L755
1550                     ; 525   gb_SysTimer_1S = 3;                                        //System time = 3S
1552  02e0 35030002      	mov	_gb_SysTimer_1S,#3
1553                     ; 526   gb_StatusTx = 0;                                           //Clear Tx status flag 
1555  02e4 3f05          	clr	_gb_StatusTx
1556                     ; 527   gb_WaitStableFlag = 0x0f;                                  //State stable flag initial
1558  02e6 350f0000      	mov	_gb_WaitStableFlag,#15
1559                     ; 528 }
1562  02ea 84            	pop	a
1563  02eb 81            	ret
1606                     ; 536 void RFM69H_EntryTestTx(void)
1606                     ; 537 {
1607                     	switch	.text
1608  02ec               _RFM69H_EntryTestTx:
1610  02ec 88            	push	a
1611       00000001      OFST:	set	1
1614                     ; 541   RFData = 0;
1616  02ed 3f08          	clr	_RFData
1617                     ; 542   RFM69H_TestConfig();
1619  02ef ad91          	call	_RFM69H_TestConfig
1621                     ; 543   RFM69H_SPI_write(RFM69HPowerTbl[gb_PowerBuf_Addr]);              //Setting output power parameter
1623  02f1 ae115f        	ldw	x,#4447
1624  02f4 cd0000        	call	_RFM69H_SPI_write
1626                     ; 544   for(i = 0; i < 5; i++)                                         //Define to Tx mode  
1628  02f7 0f01          	clr	(OFST+0,sp)
1630  02f9               L306:
1631                     ; 545     RFM69H_SPI_write(RFM69HTxTbl[i]);
1633  02f9 7b01          	ld	a,(OFST+0,sp)
1634  02fb 5f            	clrw	x
1635  02fc 97            	ld	xl,a
1636  02fd 58            	sllw	x
1637  02fe de0092        	ldw	x,(_RFM69HTxTbl,x)
1638  0301 cd0000        	call	_RFM69H_SPI_write
1640                     ; 544   for(i = 0; i < 5; i++)                                         //Define to Tx mode  
1642  0304 0c01          	inc	(OFST+0,sp)
1646  0306 7b01          	ld	a,(OFST+0,sp)
1647  0308 a105          	cp	a,#5
1648  030a 25ed          	jrult	L306
1649                     ; 547   gb_SysTimer_1S = 3;                                        //System time = 3S
1651  030c 35030002      	mov	_gb_SysTimer_1S,#3
1652                     ; 548   gb_StatusRx = 0;                                           //Clear Rx status flag 
1654  0310 3f03          	clr	_gb_StatusRx
1655                     ; 549   gb_WaitStableFlag = 0x0f;                                  //State stable flag initial
1657  0312 350f0000      	mov	_gb_WaitStableFlag,#15
1658                     ; 550 }
1661  0316 84            	pop	a
1662  0317 81            	ret
1688                     ; 558 void RFM69H_TestRx(void)
1688                     ; 559 {
1689                     	switch	.text
1690  0318               _RFM69H_TestRx:
1694                     ; 560   RFM69H_RxWaitStable();
1696  0318 cd013f        	call	_RFM69H_RxWaitStable
1698                     ; 561   if(gb_WaitStableFlag==1)
1700  031b b600          	ld	a,_gb_WaitStableFlag
1701  031d a101          	cp	a,#1
1702  031f 2608          	jrne	L126
1703                     ; 563     gb_WaitStableFlag=2;
1705  0321 35020000      	mov	_gb_WaitStableFlag,#2
1706                     ; 564     gb_StatusRx=1;    
1708  0325 35010003      	mov	_gb_StatusRx,#1
1709  0329               L126:
1710                     ; 566 }
1713  0329 81            	ret
1740                     ; 574 void RFM69H_TestTx(void)
1740                     ; 575 { 
1741                     	switch	.text
1742  032a               _RFM69H_TestTx:
1746                     ; 576   RFM69H_TxWaitStable();
1748  032a cd0111        	call	_RFM69H_TxWaitStable
1750                     ; 577   if(gb_WaitStableFlag==1)
1752  032d b600          	ld	a,_gb_WaitStableFlag
1753  032f a101          	cp	a,#1
1754  0331 260c          	jrne	L336
1755                     ; 579     gb_WaitStableFlag=2;
1757  0333 35020000      	mov	_gb_WaitStableFlag,#2
1758                     ; 580     gb_StatusTx=1;  
1760  0337 35010005      	mov	_gb_StatusTx,#1
1761                     ; 582     RFData=1;                                              //DIO2=1
1763  033b 35010008      	mov	_RFData,#1
1764  033f               L336:
1765                     ; 584 }
1768  033f 81            	ret
1771                     	bsct
1772  0009               _gb_WorkmodeBackup:
1773  0009 00            	dc.b	0
2007                     	xdef	_gb_WorkmodeBackup
2008                     	xdef	_RFM69H_TestTx
2009                     	xdef	_RFM69H_TestRx
2010                     	xdef	_RFM69H_EntryTestTx
2011                     	xdef	_RFM69H_EntryTestRx
2012                     	xdef	_RFM69H_TestConfig
2013                     	xdef	_RFM69HTestConfigTbl
2014                     	xdef	_RFM69H_TxPacket
2015                     	xdef	_RFM69H_RxPacket
2016                     	xdef	_RFM69H_ReadRSSI
2017                     	xdef	_RFM69H_Standby
2018                     	xdef	_RFM69H_ClearFIFO
2019                     	xdef	_RFM69H_Config
2020                     	xdef	_RFData
2021                     	xdef	_gw_TxTimer
2022                     	xdef	_gw_RF_SentInterval
2023                     	xdef	_gb_StatusTx
2024                     	xdef	_nIRQ0
2025                     	xdef	_gb_StatusRx
2026                     	xdef	_gb_ErrorFlag
2027                     	xdef	_gb_PowerBuf_Addr
2028                     	xdef	_gb_FreqBuf_Addr
2029                     	xdef	_gb_RateBuf_Addr
2030                     	xdef	_RFM69HData
2031                     	xdef	_RFM69HTxTbl
2032                     	xdef	_RFM69HRxTbl
2033                     	xdef	_RFM69HConfigTblRx
2034                     	xdef	_RFM69HConfigTblTx_ContMode
2035                     	xdef	_RFM69HConfigTblTx
2036                     	xdef	_RFM69HPowerTbl
2037                     	xdef	_RFM69HRateTbl
2038                     	xdef	_RFM69HFreqTbl
2039                     	xdef	_RFM69H_RxWaitStable
2040                     	xdef	_RFM69H_TxWaitStable
2041                     	xdef	_RFM69H_Sleep
2042                     	xdef	_RFM69H_EntryRx
2043                     	xdef	_RFM69H_EntryTx
2044                     	xdef	_gb_SysTimer_1S
2045                     	xdef	_gb_WaitStableFlag
2046                     	xref	_RFM69H_SPI_read
2047                     	xref	_RFM69H_SPI_write
2048                     	xref.b	_system_tick
2067                     	end
