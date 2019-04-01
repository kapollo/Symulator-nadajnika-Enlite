   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  14                     .const:	section	.text
  15  0000               _HSIDivFactor:
  16  0000 01            	dc.b	1
  17  0001 02            	dc.b	2
  18  0002 04            	dc.b	4
  19  0003 08            	dc.b	8
  20  0004               _CLKPrescTable:
  21  0004 01            	dc.b	1
  22  0005 02            	dc.b	2
  23  0006 04            	dc.b	4
  24  0007 08            	dc.b	8
  25  0008 0a            	dc.b	10
  26  0009 10            	dc.b	16
  27  000a 14            	dc.b	20
  28  000b 28            	dc.b	40
  57                     ; 72 void CLK_DeInit(void)
  57                     ; 73 {
  59                     	switch	.text
  60  0000               _CLK_DeInit:
  64                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  66  0000 350150c0      	mov	20672,#1
  67                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  69  0004 725f50c1      	clr	20673
  70                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  72  0008 35e150c4      	mov	20676,#225
  73                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  75  000c 725f50c5      	clr	20677
  76                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  78  0010 351850c6      	mov	20678,#24
  79                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  81  0014 35ff50c7      	mov	20679,#255
  82                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  84  0018 35ff50ca      	mov	20682,#255
  85                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  87  001c 725f50c8      	clr	20680
  88                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  90  0020 725f50c9      	clr	20681
  92  0024               L52:
  93                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  95  0024 c650c9        	ld	a,20681
  96  0027 a501          	bcp	a,#1
  97  0029 26f9          	jrne	L52
  98                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 100  002b 725f50c9      	clr	20681
 101                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 103  002f 725f50cc      	clr	20684
 104                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 106  0033 725f50cd      	clr	20685
 107                     ; 88 }
 110  0037 81            	ret
 166                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 166                     ; 100 {
 167                     	switch	.text
 168  0038               _CLK_FastHaltWakeUpCmd:
 172                     ; 104   if (NewState != DISABLE)
 174  0038 4d            	tnz	a
 175  0039 2706          	jreq	L75
 176                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 178  003b 721450c0      	bset	20672,#2
 180  003f 2004          	jra	L16
 181  0041               L75:
 182                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 184  0041 721550c0      	bres	20672,#2
 185  0045               L16:
 186                     ; 114 }
 189  0045 81            	ret
 224                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 224                     ; 122 {
 225                     	switch	.text
 226  0046               _CLK_HSECmd:
 230                     ; 126   if (NewState != DISABLE)
 232  0046 4d            	tnz	a
 233  0047 2706          	jreq	L101
 234                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 236  0049 721050c1      	bset	20673,#0
 238  004d 2004          	jra	L301
 239  004f               L101:
 240                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 242  004f 721150c1      	bres	20673,#0
 243  0053               L301:
 244                     ; 136 }
 247  0053 81            	ret
 282                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 282                     ; 144 {
 283                     	switch	.text
 284  0054               _CLK_HSICmd:
 288                     ; 148   if (NewState != DISABLE)
 290  0054 4d            	tnz	a
 291  0055 2706          	jreq	L321
 292                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 294  0057 721050c0      	bset	20672,#0
 296  005b 2004          	jra	L521
 297  005d               L321:
 298                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 300  005d 721150c0      	bres	20672,#0
 301  0061               L521:
 302                     ; 158 }
 305  0061 81            	ret
 340                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 340                     ; 167 {
 341                     	switch	.text
 342  0062               _CLK_LSICmd:
 346                     ; 171   if (NewState != DISABLE)
 348  0062 4d            	tnz	a
 349  0063 2706          	jreq	L541
 350                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 352  0065 721650c0      	bset	20672,#3
 354  0069 2004          	jra	L741
 355  006b               L541:
 356                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 358  006b 721750c0      	bres	20672,#3
 359  006f               L741:
 360                     ; 181 }
 363  006f 81            	ret
 398                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 398                     ; 190 {
 399                     	switch	.text
 400  0070               _CLK_CCOCmd:
 404                     ; 194   if (NewState != DISABLE)
 406  0070 4d            	tnz	a
 407  0071 2706          	jreq	L761
 408                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 410  0073 721050c9      	bset	20681,#0
 412  0077 2004          	jra	L171
 413  0079               L761:
 414                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 416  0079 721150c9      	bres	20681,#0
 417  007d               L171:
 418                     ; 204 }
 421  007d 81            	ret
 456                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 456                     ; 214 {
 457                     	switch	.text
 458  007e               _CLK_ClockSwitchCmd:
 462                     ; 218   if (NewState != DISABLE )
 464  007e 4d            	tnz	a
 465  007f 2706          	jreq	L112
 466                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 468  0081 721250c5      	bset	20677,#1
 470  0085 2004          	jra	L312
 471  0087               L112:
 472                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 474  0087 721350c5      	bres	20677,#1
 475  008b               L312:
 476                     ; 228 }
 479  008b 81            	ret
 515                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 515                     ; 239 {
 516                     	switch	.text
 517  008c               _CLK_SlowActiveHaltWakeUpCmd:
 521                     ; 243   if (NewState != DISABLE)
 523  008c 4d            	tnz	a
 524  008d 2706          	jreq	L332
 525                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 527  008f 721a50c0      	bset	20672,#5
 529  0093 2004          	jra	L532
 530  0095               L332:
 531                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 533  0095 721b50c0      	bres	20672,#5
 534  0099               L532:
 535                     ; 253 }
 538  0099 81            	ret
 697                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 697                     ; 264 {
 698                     	switch	.text
 699  009a               _CLK_PeripheralClockConfig:
 701  009a 89            	pushw	x
 702       00000000      OFST:	set	0
 705                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 707  009b 9e            	ld	a,xh
 708  009c a510          	bcp	a,#16
 709  009e 2633          	jrne	L123
 710                     ; 271     if (NewState != DISABLE)
 712  00a0 0d02          	tnz	(OFST+2,sp)
 713  00a2 2717          	jreq	L323
 714                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 716  00a4 7b01          	ld	a,(OFST+1,sp)
 717  00a6 a40f          	and	a,#15
 718  00a8 5f            	clrw	x
 719  00a9 97            	ld	xl,a
 720  00aa a601          	ld	a,#1
 721  00ac 5d            	tnzw	x
 722  00ad 2704          	jreq	L62
 723  00af               L03:
 724  00af 48            	sll	a
 725  00b0 5a            	decw	x
 726  00b1 26fc          	jrne	L03
 727  00b3               L62:
 728  00b3 ca50c7        	or	a,20679
 729  00b6 c750c7        	ld	20679,a
 731  00b9 2049          	jra	L723
 732  00bb               L323:
 733                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 735  00bb 7b01          	ld	a,(OFST+1,sp)
 736  00bd a40f          	and	a,#15
 737  00bf 5f            	clrw	x
 738  00c0 97            	ld	xl,a
 739  00c1 a601          	ld	a,#1
 740  00c3 5d            	tnzw	x
 741  00c4 2704          	jreq	L23
 742  00c6               L43:
 743  00c6 48            	sll	a
 744  00c7 5a            	decw	x
 745  00c8 26fc          	jrne	L43
 746  00ca               L23:
 747  00ca 43            	cpl	a
 748  00cb c450c7        	and	a,20679
 749  00ce c750c7        	ld	20679,a
 750  00d1 2031          	jra	L723
 751  00d3               L123:
 752                     ; 284     if (NewState != DISABLE)
 754  00d3 0d02          	tnz	(OFST+2,sp)
 755  00d5 2717          	jreq	L133
 756                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 758  00d7 7b01          	ld	a,(OFST+1,sp)
 759  00d9 a40f          	and	a,#15
 760  00db 5f            	clrw	x
 761  00dc 97            	ld	xl,a
 762  00dd a601          	ld	a,#1
 763  00df 5d            	tnzw	x
 764  00e0 2704          	jreq	L63
 765  00e2               L04:
 766  00e2 48            	sll	a
 767  00e3 5a            	decw	x
 768  00e4 26fc          	jrne	L04
 769  00e6               L63:
 770  00e6 ca50ca        	or	a,20682
 771  00e9 c750ca        	ld	20682,a
 773  00ec 2016          	jra	L723
 774  00ee               L133:
 775                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 777  00ee 7b01          	ld	a,(OFST+1,sp)
 778  00f0 a40f          	and	a,#15
 779  00f2 5f            	clrw	x
 780  00f3 97            	ld	xl,a
 781  00f4 a601          	ld	a,#1
 782  00f6 5d            	tnzw	x
 783  00f7 2704          	jreq	L24
 784  00f9               L44:
 785  00f9 48            	sll	a
 786  00fa 5a            	decw	x
 787  00fb 26fc          	jrne	L44
 788  00fd               L24:
 789  00fd 43            	cpl	a
 790  00fe c450ca        	and	a,20682
 791  0101 c750ca        	ld	20682,a
 792  0104               L723:
 793                     ; 295 }
 796  0104 85            	popw	x
 797  0105 81            	ret
 985                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
 985                     ; 310 {
 986                     	switch	.text
 987  0106               _CLK_ClockSwitchConfig:
 989  0106 89            	pushw	x
 990  0107 5204          	subw	sp,#4
 991       00000004      OFST:	set	4
 994                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
 996  0109 aeffff        	ldw	x,#65535
 997  010c 1f03          	ldw	(OFST-1,sp),x
 999                     ; 313   ErrorStatus Swif = ERROR;
1001                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1003  010e c650c3        	ld	a,20675
1004  0111 6b01          	ld	(OFST-3,sp),a
1006                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1008  0113 7b05          	ld	a,(OFST+1,sp)
1009  0115 a101          	cp	a,#1
1010  0117 264b          	jrne	L544
1011                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1013  0119 721250c5      	bset	20677,#1
1014                     ; 331     if (ITState != DISABLE)
1016  011d 0d09          	tnz	(OFST+5,sp)
1017  011f 2706          	jreq	L744
1018                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1020  0121 721450c5      	bset	20677,#2
1022  0125 2004          	jra	L154
1023  0127               L744:
1024                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1026  0127 721550c5      	bres	20677,#2
1027  012b               L154:
1028                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1030  012b 7b06          	ld	a,(OFST+2,sp)
1031  012d c750c4        	ld	20676,a
1033  0130 2007          	jra	L754
1034  0132               L354:
1035                     ; 346       DownCounter--;
1037  0132 1e03          	ldw	x,(OFST-1,sp)
1038  0134 1d0001        	subw	x,#1
1039  0137 1f03          	ldw	(OFST-1,sp),x
1041  0139               L754:
1042                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1044  0139 c650c5        	ld	a,20677
1045  013c a501          	bcp	a,#1
1046  013e 2704          	jreq	L364
1048  0140 1e03          	ldw	x,(OFST-1,sp)
1049  0142 26ee          	jrne	L354
1050  0144               L364:
1051                     ; 349     if(DownCounter != 0)
1053  0144 1e03          	ldw	x,(OFST-1,sp)
1054  0146 2706          	jreq	L564
1055                     ; 351       Swif = SUCCESS;
1057  0148 a601          	ld	a,#1
1058  014a 6b02          	ld	(OFST-2,sp),a
1061  014c 2002          	jra	L174
1062  014e               L564:
1063                     ; 355       Swif = ERROR;
1065  014e 0f02          	clr	(OFST-2,sp)
1067  0150               L174:
1068                     ; 390   if(Swif != ERROR)
1070  0150 0d02          	tnz	(OFST-2,sp)
1071  0152 2767          	jreq	L515
1072                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1074  0154 0d0a          	tnz	(OFST+6,sp)
1075  0156 2645          	jrne	L715
1077  0158 7b01          	ld	a,(OFST-3,sp)
1078  015a a1e1          	cp	a,#225
1079  015c 263f          	jrne	L715
1080                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1082  015e 721150c0      	bres	20672,#0
1084  0162 2057          	jra	L515
1085  0164               L544:
1086                     ; 361     if (ITState != DISABLE)
1088  0164 0d09          	tnz	(OFST+5,sp)
1089  0166 2706          	jreq	L374
1090                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1092  0168 721450c5      	bset	20677,#2
1094  016c 2004          	jra	L574
1095  016e               L374:
1096                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1098  016e 721550c5      	bres	20677,#2
1099  0172               L574:
1100                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1102  0172 7b06          	ld	a,(OFST+2,sp)
1103  0174 c750c4        	ld	20676,a
1105  0177 2007          	jra	L305
1106  0179               L774:
1107                     ; 376       DownCounter--;
1109  0179 1e03          	ldw	x,(OFST-1,sp)
1110  017b 1d0001        	subw	x,#1
1111  017e 1f03          	ldw	(OFST-1,sp),x
1113  0180               L305:
1114                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1116  0180 c650c5        	ld	a,20677
1117  0183 a508          	bcp	a,#8
1118  0185 2704          	jreq	L705
1120  0187 1e03          	ldw	x,(OFST-1,sp)
1121  0189 26ee          	jrne	L774
1122  018b               L705:
1123                     ; 379     if(DownCounter != 0)
1125  018b 1e03          	ldw	x,(OFST-1,sp)
1126  018d 270a          	jreq	L115
1127                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1129  018f 721250c5      	bset	20677,#1
1130                     ; 383       Swif = SUCCESS;
1132  0193 a601          	ld	a,#1
1133  0195 6b02          	ld	(OFST-2,sp),a
1136  0197 20b7          	jra	L174
1137  0199               L115:
1138                     ; 387       Swif = ERROR;
1140  0199 0f02          	clr	(OFST-2,sp)
1142  019b 20b3          	jra	L174
1143  019d               L715:
1144                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1146  019d 0d0a          	tnz	(OFST+6,sp)
1147  019f 260c          	jrne	L325
1149  01a1 7b01          	ld	a,(OFST-3,sp)
1150  01a3 a1d2          	cp	a,#210
1151  01a5 2606          	jrne	L325
1152                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1154  01a7 721750c0      	bres	20672,#3
1156  01ab 200e          	jra	L515
1157  01ad               L325:
1158                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1160  01ad 0d0a          	tnz	(OFST+6,sp)
1161  01af 260a          	jrne	L515
1163  01b1 7b01          	ld	a,(OFST-3,sp)
1164  01b3 a1b4          	cp	a,#180
1165  01b5 2604          	jrne	L515
1166                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1168  01b7 721150c1      	bres	20673,#0
1169  01bb               L515:
1170                     ; 406   return(Swif);
1172  01bb 7b02          	ld	a,(OFST-2,sp)
1175  01bd 5b06          	addw	sp,#6
1176  01bf 81            	ret
1314                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1314                     ; 416 {
1315                     	switch	.text
1316  01c0               _CLK_HSIPrescalerConfig:
1318  01c0 88            	push	a
1319       00000000      OFST:	set	0
1322                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1324  01c1 c650c6        	ld	a,20678
1325  01c4 a4e7          	and	a,#231
1326  01c6 c750c6        	ld	20678,a
1327                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1329  01c9 c650c6        	ld	a,20678
1330  01cc 1a01          	or	a,(OFST+1,sp)
1331  01ce c750c6        	ld	20678,a
1332                     ; 425 }
1335  01d1 84            	pop	a
1336  01d2 81            	ret
1471                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1471                     ; 437 {
1472                     	switch	.text
1473  01d3               _CLK_CCOConfig:
1475  01d3 88            	push	a
1476       00000000      OFST:	set	0
1479                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1481  01d4 c650c9        	ld	a,20681
1482  01d7 a4e1          	and	a,#225
1483  01d9 c750c9        	ld	20681,a
1484                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1486  01dc c650c9        	ld	a,20681
1487  01df 1a01          	or	a,(OFST+1,sp)
1488  01e1 c750c9        	ld	20681,a
1489                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1491  01e4 721050c9      	bset	20681,#0
1492                     ; 449 }
1495  01e8 84            	pop	a
1496  01e9 81            	ret
1561                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1561                     ; 460 {
1562                     	switch	.text
1563  01ea               _CLK_ITConfig:
1565  01ea 89            	pushw	x
1566       00000000      OFST:	set	0
1569                     ; 465   if (NewState != DISABLE)
1571  01eb 9f            	ld	a,xl
1572  01ec 4d            	tnz	a
1573  01ed 2719          	jreq	L527
1574                     ; 467     switch (CLK_IT)
1576  01ef 9e            	ld	a,xh
1578                     ; 475     default:
1578                     ; 476       break;
1579  01f0 a00c          	sub	a,#12
1580  01f2 270a          	jreq	L166
1581  01f4 a010          	sub	a,#16
1582  01f6 2624          	jrne	L337
1583                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1583                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1585  01f8 721450c5      	bset	20677,#2
1586                     ; 471       break;
1588  01fc 201e          	jra	L337
1589  01fe               L166:
1590                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1590                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1592  01fe 721450c8      	bset	20680,#2
1593                     ; 474       break;
1595  0202 2018          	jra	L337
1596  0204               L366:
1597                     ; 475     default:
1597                     ; 476       break;
1599  0204 2016          	jra	L337
1600  0206               L137:
1602  0206 2014          	jra	L337
1603  0208               L527:
1604                     ; 481     switch (CLK_IT)
1606  0208 7b01          	ld	a,(OFST+1,sp)
1608                     ; 489     default:
1608                     ; 490       break;
1609  020a a00c          	sub	a,#12
1610  020c 270a          	jreq	L766
1611  020e a010          	sub	a,#16
1612  0210 260a          	jrne	L337
1613                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1613                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1615  0212 721550c5      	bres	20677,#2
1616                     ; 485       break;
1618  0216 2004          	jra	L337
1619  0218               L766:
1620                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1620                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1622  0218 721550c8      	bres	20680,#2
1623                     ; 488       break;
1624  021c               L337:
1625                     ; 493 }
1628  021c 85            	popw	x
1629  021d 81            	ret
1630  021e               L176:
1631                     ; 489     default:
1631                     ; 490       break;
1633  021e 20fc          	jra	L337
1634  0220               L737:
1635  0220 20fa          	jra	L337
1670                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1670                     ; 501 {
1671                     	switch	.text
1672  0222               _CLK_SYSCLKConfig:
1674  0222 88            	push	a
1675       00000000      OFST:	set	0
1678                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1680  0223 a580          	bcp	a,#128
1681  0225 2614          	jrne	L757
1682                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1684  0227 c650c6        	ld	a,20678
1685  022a a4e7          	and	a,#231
1686  022c c750c6        	ld	20678,a
1687                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1689  022f 7b01          	ld	a,(OFST+1,sp)
1690  0231 a418          	and	a,#24
1691  0233 ca50c6        	or	a,20678
1692  0236 c750c6        	ld	20678,a
1694  0239 2012          	jra	L167
1695  023b               L757:
1696                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1698  023b c650c6        	ld	a,20678
1699  023e a4f8          	and	a,#248
1700  0240 c750c6        	ld	20678,a
1701                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1703  0243 7b01          	ld	a,(OFST+1,sp)
1704  0245 a407          	and	a,#7
1705  0247 ca50c6        	or	a,20678
1706  024a c750c6        	ld	20678,a
1707  024d               L167:
1708                     ; 515 }
1711  024d 84            	pop	a
1712  024e 81            	ret
1768                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1768                     ; 524 {
1769                     	switch	.text
1770  024f               _CLK_SWIMConfig:
1774                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1776  024f 4d            	tnz	a
1777  0250 2706          	jreq	L1101
1778                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1780  0252 721050cd      	bset	20685,#0
1782  0256 2004          	jra	L3101
1783  0258               L1101:
1784                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1786  0258 721150cd      	bres	20685,#0
1787  025c               L3101:
1788                     ; 538 }
1791  025c 81            	ret
1815                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1815                     ; 548 {
1816                     	switch	.text
1817  025d               _CLK_ClockSecuritySystemEnable:
1821                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1823  025d 721050c8      	bset	20680,#0
1824                     ; 551 }
1827  0261 81            	ret
1852                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1852                     ; 560 {
1853                     	switch	.text
1854  0262               _CLK_GetSYSCLKSource:
1858                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1860  0262 c650c3        	ld	a,20675
1863  0265 81            	ret
1926                     ; 569 uint32_t CLK_GetClockFreq(void)
1926                     ; 570 {
1927                     	switch	.text
1928  0266               _CLK_GetClockFreq:
1930  0266 5209          	subw	sp,#9
1931       00000009      OFST:	set	9
1934                     ; 571   uint32_t clockfrequency = 0;
1936                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1938                     ; 573   uint8_t tmp = 0, presc = 0;
1942                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1944  0268 c650c3        	ld	a,20675
1945  026b 6b09          	ld	(OFST+0,sp),a
1947                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1949  026d 7b09          	ld	a,(OFST+0,sp)
1950  026f a1e1          	cp	a,#225
1951  0271 2641          	jrne	L7601
1952                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1954  0273 c650c6        	ld	a,20678
1955  0276 a418          	and	a,#24
1956  0278 6b09          	ld	(OFST+0,sp),a
1958                     ; 581     tmp = (uint8_t)(tmp >> 3);
1960  027a 0409          	srl	(OFST+0,sp)
1961  027c 0409          	srl	(OFST+0,sp)
1962  027e 0409          	srl	(OFST+0,sp)
1964                     ; 582     presc = HSIDivFactor[tmp];
1966  0280 7b09          	ld	a,(OFST+0,sp)
1967  0282 5f            	clrw	x
1968  0283 97            	ld	xl,a
1969  0284 d60000        	ld	a,(_HSIDivFactor,x)
1970  0287 6b09          	ld	(OFST+0,sp),a
1972                     ; 583     clockfrequency = HSI_VALUE / presc;
1974  0289 7b09          	ld	a,(OFST+0,sp)
1975  028b b703          	ld	c_lreg+3,a
1976  028d 3f02          	clr	c_lreg+2
1977  028f 3f01          	clr	c_lreg+1
1978  0291 3f00          	clr	c_lreg
1979  0293 96            	ldw	x,sp
1980  0294 1c0001        	addw	x,#OFST-8
1981  0297 cd0000        	call	c_rtol
1984  029a ae2400        	ldw	x,#9216
1985  029d bf02          	ldw	c_lreg+2,x
1986  029f ae00f4        	ldw	x,#244
1987  02a2 bf00          	ldw	c_lreg,x
1988  02a4 96            	ldw	x,sp
1989  02a5 1c0001        	addw	x,#OFST-8
1990  02a8 cd0000        	call	c_ludv
1992  02ab 96            	ldw	x,sp
1993  02ac 1c0005        	addw	x,#OFST-4
1994  02af cd0000        	call	c_rtol
1998  02b2 201c          	jra	L1701
1999  02b4               L7601:
2000                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2002  02b4 7b09          	ld	a,(OFST+0,sp)
2003  02b6 a1d2          	cp	a,#210
2004  02b8 260c          	jrne	L3701
2005                     ; 587     clockfrequency = LSI_VALUE;
2007  02ba aef400        	ldw	x,#62464
2008  02bd 1f07          	ldw	(OFST-2,sp),x
2009  02bf ae0001        	ldw	x,#1
2010  02c2 1f05          	ldw	(OFST-4,sp),x
2013  02c4 200a          	jra	L1701
2014  02c6               L3701:
2015                     ; 591     clockfrequency = HSE_VALUE;
2017  02c6 ae3600        	ldw	x,#13824
2018  02c9 1f07          	ldw	(OFST-2,sp),x
2019  02cb ae016e        	ldw	x,#366
2020  02ce 1f05          	ldw	(OFST-4,sp),x
2022  02d0               L1701:
2023                     ; 594   return((uint32_t)clockfrequency);
2025  02d0 96            	ldw	x,sp
2026  02d1 1c0005        	addw	x,#OFST-4
2027  02d4 cd0000        	call	c_ltor
2031  02d7 5b09          	addw	sp,#9
2032  02d9 81            	ret
2131                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2131                     ; 605 {
2132                     	switch	.text
2133  02da               _CLK_AdjustHSICalibrationValue:
2135  02da 88            	push	a
2136       00000000      OFST:	set	0
2139                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2141  02db c650cc        	ld	a,20684
2142  02de a4f8          	and	a,#248
2143  02e0 1a01          	or	a,(OFST+1,sp)
2144  02e2 c750cc        	ld	20684,a
2145                     ; 611 }
2148  02e5 84            	pop	a
2149  02e6 81            	ret
2173                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2173                     ; 623 {
2174                     	switch	.text
2175  02e7               _CLK_SYSCLKEmergencyClear:
2179                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2181  02e7 721150c5      	bres	20677,#0
2182                     ; 625 }
2185  02eb 81            	ret
2338                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2338                     ; 635 {
2339                     	switch	.text
2340  02ec               _CLK_GetFlagStatus:
2342  02ec 89            	pushw	x
2343  02ed 5203          	subw	sp,#3
2344       00000003      OFST:	set	3
2347                     ; 636   uint16_t statusreg = 0;
2349                     ; 637   uint8_t tmpreg = 0;
2351                     ; 638   FlagStatus bitstatus = RESET;
2353                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2355  02ef 01            	rrwa	x,a
2356  02f0 9f            	ld	a,xl
2357  02f1 a4ff          	and	a,#255
2358  02f3 97            	ld	xl,a
2359  02f4 4f            	clr	a
2360  02f5 02            	rlwa	x,a
2361  02f6 1f01          	ldw	(OFST-2,sp),x
2362  02f8 01            	rrwa	x,a
2364                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2366  02f9 1e01          	ldw	x,(OFST-2,sp)
2367  02fb a30100        	cpw	x,#256
2368  02fe 2607          	jrne	L1421
2369                     ; 649     tmpreg = CLK->ICKR;
2371  0300 c650c0        	ld	a,20672
2372  0303 6b03          	ld	(OFST+0,sp),a
2375  0305 202f          	jra	L3421
2376  0307               L1421:
2377                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2379  0307 1e01          	ldw	x,(OFST-2,sp)
2380  0309 a30200        	cpw	x,#512
2381  030c 2607          	jrne	L5421
2382                     ; 653     tmpreg = CLK->ECKR;
2384  030e c650c1        	ld	a,20673
2385  0311 6b03          	ld	(OFST+0,sp),a
2388  0313 2021          	jra	L3421
2389  0315               L5421:
2390                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2392  0315 1e01          	ldw	x,(OFST-2,sp)
2393  0317 a30300        	cpw	x,#768
2394  031a 2607          	jrne	L1521
2395                     ; 657     tmpreg = CLK->SWCR;
2397  031c c650c5        	ld	a,20677
2398  031f 6b03          	ld	(OFST+0,sp),a
2401  0321 2013          	jra	L3421
2402  0323               L1521:
2403                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2405  0323 1e01          	ldw	x,(OFST-2,sp)
2406  0325 a30400        	cpw	x,#1024
2407  0328 2607          	jrne	L5521
2408                     ; 661     tmpreg = CLK->CSSR;
2410  032a c650c8        	ld	a,20680
2411  032d 6b03          	ld	(OFST+0,sp),a
2414  032f 2005          	jra	L3421
2415  0331               L5521:
2416                     ; 665     tmpreg = CLK->CCOR;
2418  0331 c650c9        	ld	a,20681
2419  0334 6b03          	ld	(OFST+0,sp),a
2421  0336               L3421:
2422                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2424  0336 7b05          	ld	a,(OFST+2,sp)
2425  0338 1503          	bcp	a,(OFST+0,sp)
2426  033a 2706          	jreq	L1621
2427                     ; 670     bitstatus = SET;
2429  033c a601          	ld	a,#1
2430  033e 6b03          	ld	(OFST+0,sp),a
2433  0340 2002          	jra	L3621
2434  0342               L1621:
2435                     ; 674     bitstatus = RESET;
2437  0342 0f03          	clr	(OFST+0,sp)
2439  0344               L3621:
2440                     ; 678   return((FlagStatus)bitstatus);
2442  0344 7b03          	ld	a,(OFST+0,sp)
2445  0346 5b05          	addw	sp,#5
2446  0348 81            	ret
2492                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2492                     ; 688 {
2493                     	switch	.text
2494  0349               _CLK_GetITStatus:
2496  0349 88            	push	a
2497  034a 88            	push	a
2498       00000001      OFST:	set	1
2501                     ; 689   ITStatus bitstatus = RESET;
2503                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2505  034b a11c          	cp	a,#28
2506  034d 2611          	jrne	L7031
2507                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2509  034f c450c5        	and	a,20677
2510  0352 a10c          	cp	a,#12
2511  0354 2606          	jrne	L1131
2512                     ; 699       bitstatus = SET;
2514  0356 a601          	ld	a,#1
2515  0358 6b01          	ld	(OFST+0,sp),a
2518  035a 2015          	jra	L5131
2519  035c               L1131:
2520                     ; 703       bitstatus = RESET;
2522  035c 0f01          	clr	(OFST+0,sp)
2524  035e 2011          	jra	L5131
2525  0360               L7031:
2526                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2528  0360 c650c8        	ld	a,20680
2529  0363 1402          	and	a,(OFST+1,sp)
2530  0365 a10c          	cp	a,#12
2531  0367 2606          	jrne	L7131
2532                     ; 711       bitstatus = SET;
2534  0369 a601          	ld	a,#1
2535  036b 6b01          	ld	(OFST+0,sp),a
2538  036d 2002          	jra	L5131
2539  036f               L7131:
2540                     ; 715       bitstatus = RESET;
2542  036f 0f01          	clr	(OFST+0,sp)
2544  0371               L5131:
2545                     ; 720   return bitstatus;
2547  0371 7b01          	ld	a,(OFST+0,sp)
2550  0373 85            	popw	x
2551  0374 81            	ret
2587                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2587                     ; 730 {
2588                     	switch	.text
2589  0375               _CLK_ClearITPendingBit:
2593                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2595  0375 a10c          	cp	a,#12
2596  0377 2606          	jrne	L1431
2597                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2599  0379 721750c8      	bres	20680,#3
2601  037d 2004          	jra	L3431
2602  037f               L1431:
2603                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2605  037f 721750c5      	bres	20677,#3
2606  0383               L3431:
2607                     ; 745 }
2610  0383 81            	ret
2645                     	xdef	_CLKPrescTable
2646                     	xdef	_HSIDivFactor
2647                     	xdef	_CLK_ClearITPendingBit
2648                     	xdef	_CLK_GetITStatus
2649                     	xdef	_CLK_GetFlagStatus
2650                     	xdef	_CLK_GetSYSCLKSource
2651                     	xdef	_CLK_GetClockFreq
2652                     	xdef	_CLK_AdjustHSICalibrationValue
2653                     	xdef	_CLK_SYSCLKEmergencyClear
2654                     	xdef	_CLK_ClockSecuritySystemEnable
2655                     	xdef	_CLK_SWIMConfig
2656                     	xdef	_CLK_SYSCLKConfig
2657                     	xdef	_CLK_ITConfig
2658                     	xdef	_CLK_CCOConfig
2659                     	xdef	_CLK_HSIPrescalerConfig
2660                     	xdef	_CLK_ClockSwitchConfig
2661                     	xdef	_CLK_PeripheralClockConfig
2662                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2663                     	xdef	_CLK_FastHaltWakeUpCmd
2664                     	xdef	_CLK_ClockSwitchCmd
2665                     	xdef	_CLK_CCOCmd
2666                     	xdef	_CLK_LSICmd
2667                     	xdef	_CLK_HSICmd
2668                     	xdef	_CLK_HSECmd
2669                     	xdef	_CLK_DeInit
2670                     	xref.b	c_lreg
2671                     	xref.b	c_x
2690                     	xref	c_ltor
2691                     	xref	c_ludv
2692                     	xref	c_rtol
2693                     	end
