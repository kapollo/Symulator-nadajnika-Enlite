   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  42                     ; 50 void SPI_DeInit(void)
  42                     ; 51 {
  44                     	switch	.text
  45  0000               _SPI_DeInit:
  49                     ; 52   SPI->CR1    = SPI_CR1_RESET_VALUE;
  51  0000 725f5200      	clr	20992
  52                     ; 53   SPI->CR2    = SPI_CR2_RESET_VALUE;
  54  0004 725f5201      	clr	20993
  55                     ; 54   SPI->ICR    = SPI_ICR_RESET_VALUE;
  57  0008 725f5202      	clr	20994
  58                     ; 55   SPI->SR     = SPI_SR_RESET_VALUE;
  60  000c 35025203      	mov	20995,#2
  61                     ; 56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  63  0010 35075205      	mov	20997,#7
  64                     ; 57 }
  67  0014 81            	ret
 383                     ; 78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 383                     ; 79 {
 384                     	switch	.text
 385  0015               _SPI_Init:
 387  0015 89            	pushw	x
 388  0016 88            	push	a
 389       00000001      OFST:	set	1
 392                     ; 91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 392                     ; 92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 394  0017 7b07          	ld	a,(OFST+6,sp)
 395  0019 1a08          	or	a,(OFST+7,sp)
 396  001b 6b01          	ld	(OFST+0,sp),a
 398  001d 9f            	ld	a,xl
 399  001e 1a02          	or	a,(OFST+1,sp)
 400  0020 1a01          	or	a,(OFST+0,sp)
 401  0022 c75200        	ld	20992,a
 402                     ; 95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 404  0025 7b09          	ld	a,(OFST+8,sp)
 405  0027 1a0a          	or	a,(OFST+9,sp)
 406  0029 c75201        	ld	20993,a
 407                     ; 97   if (Mode == SPI_MODE_MASTER)
 409  002c 7b06          	ld	a,(OFST+5,sp)
 410  002e a104          	cp	a,#4
 411  0030 2606          	jrne	L302
 412                     ; 99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 414  0032 72105201      	bset	20993,#0
 416  0036 2004          	jra	L502
 417  0038               L302:
 418                     ; 103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 420  0038 72115201      	bres	20993,#0
 421  003c               L502:
 422                     ; 107   SPI->CR1 |= (uint8_t)(Mode);
 424  003c c65200        	ld	a,20992
 425  003f 1a06          	or	a,(OFST+5,sp)
 426  0041 c75200        	ld	20992,a
 427                     ; 110   SPI->CRCPR = (uint8_t)CRCPolynomial;
 429  0044 7b0b          	ld	a,(OFST+10,sp)
 430  0046 c75205        	ld	20997,a
 431                     ; 111 }
 434  0049 5b03          	addw	sp,#3
 435  004b 81            	ret
 490                     ; 119 void SPI_Cmd(FunctionalState NewState)
 490                     ; 120 {
 491                     	switch	.text
 492  004c               _SPI_Cmd:
 496                     ; 124   if (NewState != DISABLE)
 498  004c 4d            	tnz	a
 499  004d 2706          	jreq	L532
 500                     ; 126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 502  004f 721c5200      	bset	20992,#6
 504  0053 2004          	jra	L732
 505  0055               L532:
 506                     ; 130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 508  0055 721d5200      	bres	20992,#6
 509  0059               L732:
 510                     ; 132 }
 513  0059 81            	ret
 622                     ; 141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 622                     ; 142 {
 623                     	switch	.text
 624  005a               _SPI_ITConfig:
 626  005a 89            	pushw	x
 627  005b 88            	push	a
 628       00000001      OFST:	set	1
 631                     ; 143   uint8_t itpos = 0;
 633                     ; 149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 635  005c 9e            	ld	a,xh
 636  005d a40f          	and	a,#15
 637  005f 5f            	clrw	x
 638  0060 97            	ld	xl,a
 639  0061 a601          	ld	a,#1
 640  0063 5d            	tnzw	x
 641  0064 2704          	jreq	L41
 642  0066               L61:
 643  0066 48            	sll	a
 644  0067 5a            	decw	x
 645  0068 26fc          	jrne	L61
 646  006a               L41:
 647  006a 6b01          	ld	(OFST+0,sp),a
 649                     ; 151   if (NewState != DISABLE)
 651  006c 0d03          	tnz	(OFST+2,sp)
 652  006e 270a          	jreq	L113
 653                     ; 153     SPI->ICR |= itpos; /* Enable interrupt*/
 655  0070 c65202        	ld	a,20994
 656  0073 1a01          	or	a,(OFST+0,sp)
 657  0075 c75202        	ld	20994,a
 659  0078 2009          	jra	L313
 660  007a               L113:
 661                     ; 157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 663  007a 7b01          	ld	a,(OFST+0,sp)
 664  007c 43            	cpl	a
 665  007d c45202        	and	a,20994
 666  0080 c75202        	ld	20994,a
 667  0083               L313:
 668                     ; 159 }
 671  0083 5b03          	addw	sp,#3
 672  0085 81            	ret
 706                     ; 166 void SPI_SendData(uint8_t Data)
 706                     ; 167 {
 707                     	switch	.text
 708  0086               _SPI_SendData:
 712                     ; 168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 714  0086 c75204        	ld	20996,a
 715                     ; 169 }
 718  0089 81            	ret
 741                     ; 176 uint8_t SPI_ReceiveData(void)
 741                     ; 177 {
 742                     	switch	.text
 743  008a               _SPI_ReceiveData:
 747                     ; 178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 749  008a c65204        	ld	a,20996
 752  008d 81            	ret
 788                     ; 187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 788                     ; 188 {
 789                     	switch	.text
 790  008e               _SPI_NSSInternalSoftwareCmd:
 794                     ; 192   if (NewState != DISABLE)
 796  008e 4d            	tnz	a
 797  008f 2706          	jreq	L163
 798                     ; 194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 800  0091 72105201      	bset	20993,#0
 802  0095 2004          	jra	L363
 803  0097               L163:
 804                     ; 198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 806  0097 72115201      	bres	20993,#0
 807  009b               L363:
 808                     ; 200 }
 811  009b 81            	ret
 834                     ; 207 void SPI_TransmitCRC(void)
 834                     ; 208 {
 835                     	switch	.text
 836  009c               _SPI_TransmitCRC:
 840                     ; 209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 842  009c 72185201      	bset	20993,#4
 843                     ; 210 }
 846  00a0 81            	ret
 882                     ; 218 void SPI_CalculateCRCCmd(FunctionalState NewState)
 882                     ; 219 {
 883                     	switch	.text
 884  00a1               _SPI_CalculateCRCCmd:
 888                     ; 223   if (NewState != DISABLE)
 890  00a1 4d            	tnz	a
 891  00a2 2706          	jreq	L314
 892                     ; 225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
 894  00a4 721a5201      	bset	20993,#5
 896  00a8 2004          	jra	L514
 897  00aa               L314:
 898                     ; 229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
 900  00aa 721b5201      	bres	20993,#5
 901  00ae               L514:
 902                     ; 231 }
 905  00ae 81            	ret
 969                     ; 238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
 969                     ; 239 {
 970                     	switch	.text
 971  00af               _SPI_GetCRC:
 973  00af 88            	push	a
 974       00000001      OFST:	set	1
 977                     ; 240   uint8_t crcreg = 0;
 979                     ; 245   if (SPI_CRC != SPI_CRC_RX)
 981  00b0 4d            	tnz	a
 982  00b1 2707          	jreq	L154
 983                     ; 247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
 985  00b3 c65207        	ld	a,20999
 986  00b6 6b01          	ld	(OFST+0,sp),a
 989  00b8 2005          	jra	L354
 990  00ba               L154:
 991                     ; 251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
 993  00ba c65206        	ld	a,20998
 994  00bd 6b01          	ld	(OFST+0,sp),a
 996  00bf               L354:
 997                     ; 255   return crcreg;
 999  00bf 7b01          	ld	a,(OFST+0,sp)
1002  00c1 5b01          	addw	sp,#1
1003  00c3 81            	ret
1028                     ; 263 void SPI_ResetCRC(void)
1028                     ; 264 {
1029                     	switch	.text
1030  00c4               _SPI_ResetCRC:
1034                     ; 267   SPI_CalculateCRCCmd(ENABLE);
1036  00c4 a601          	ld	a,#1
1037  00c6 add9          	call	_SPI_CalculateCRCCmd
1039                     ; 270   SPI_Cmd(ENABLE);
1041  00c8 a601          	ld	a,#1
1042  00ca ad80          	call	_SPI_Cmd
1044                     ; 271 }
1047  00cc 81            	ret
1071                     ; 278 uint8_t SPI_GetCRCPolynomial(void)
1071                     ; 279 {
1072                     	switch	.text
1073  00cd               _SPI_GetCRCPolynomial:
1077                     ; 280   return SPI->CRCPR; /* Return the CRC polynomial register */
1079  00cd c65205        	ld	a,20997
1082  00d0 81            	ret
1138                     ; 288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1138                     ; 289 {
1139                     	switch	.text
1140  00d1               _SPI_BiDirectionalLineConfig:
1144                     ; 293   if (SPI_Direction != SPI_DIRECTION_RX)
1146  00d1 4d            	tnz	a
1147  00d2 2706          	jreq	L325
1148                     ; 295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1150  00d4 721c5201      	bset	20993,#6
1152  00d8 2004          	jra	L525
1153  00da               L325:
1154                     ; 299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1156  00da 721d5201      	bres	20993,#6
1157  00de               L525:
1158                     ; 301 }
1161  00de 81            	ret
1282                     ; 311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1282                     ; 312 {
1283                     	switch	.text
1284  00df               _SPI_GetFlagStatus:
1286  00df 88            	push	a
1287       00000001      OFST:	set	1
1290                     ; 313   FlagStatus status = RESET;
1292                     ; 318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1294  00e0 c45203        	and	a,20995
1295  00e3 2706          	jreq	L306
1296                     ; 320     status = SET; /* SPI_FLAG is set */
1298  00e5 a601          	ld	a,#1
1299  00e7 6b01          	ld	(OFST+0,sp),a
1302  00e9 2002          	jra	L506
1303  00eb               L306:
1304                     ; 324     status = RESET; /* SPI_FLAG is reset*/
1306  00eb 0f01          	clr	(OFST+0,sp)
1308  00ed               L506:
1309                     ; 328   return status;
1311  00ed 7b01          	ld	a,(OFST+0,sp)
1314  00ef 5b01          	addw	sp,#1
1315  00f1 81            	ret
1350                     ; 346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1350                     ; 347 {
1351                     	switch	.text
1352  00f2               _SPI_ClearFlag:
1356                     ; 350   SPI->SR = (uint8_t)(~SPI_FLAG);
1358  00f2 43            	cpl	a
1359  00f3 c75203        	ld	20995,a
1360                     ; 351 }
1363  00f6 81            	ret
1445                     ; 366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1445                     ; 367 {
1446                     	switch	.text
1447  00f7               _SPI_GetITStatus:
1449  00f7 88            	push	a
1450  00f8 89            	pushw	x
1451       00000002      OFST:	set	2
1454                     ; 368   ITStatus pendingbitstatus = RESET;
1456                     ; 369   uint8_t itpos = 0;
1458                     ; 370   uint8_t itmask1 = 0;
1460                     ; 371   uint8_t itmask2 = 0;
1462                     ; 372   uint8_t enablestatus = 0;
1464                     ; 375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1466  00f9 a40f          	and	a,#15
1467  00fb 5f            	clrw	x
1468  00fc 97            	ld	xl,a
1469  00fd a601          	ld	a,#1
1470  00ff 5d            	tnzw	x
1471  0100 2704          	jreq	L05
1472  0102               L25:
1473  0102 48            	sll	a
1474  0103 5a            	decw	x
1475  0104 26fc          	jrne	L25
1476  0106               L05:
1477  0106 6b01          	ld	(OFST-1,sp),a
1479                     ; 378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1481  0108 7b03          	ld	a,(OFST+1,sp)
1482  010a 4e            	swap	a
1483  010b a40f          	and	a,#15
1484  010d 6b02          	ld	(OFST+0,sp),a
1486                     ; 380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1488  010f 7b02          	ld	a,(OFST+0,sp)
1489  0111 5f            	clrw	x
1490  0112 97            	ld	xl,a
1491  0113 a601          	ld	a,#1
1492  0115 5d            	tnzw	x
1493  0116 2704          	jreq	L45
1494  0118               L65:
1495  0118 48            	sll	a
1496  0119 5a            	decw	x
1497  011a 26fc          	jrne	L65
1498  011c               L45:
1499  011c 6b02          	ld	(OFST+0,sp),a
1501                     ; 382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1503  011e c65203        	ld	a,20995
1504  0121 1402          	and	a,(OFST+0,sp)
1505  0123 6b02          	ld	(OFST+0,sp),a
1507                     ; 384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
1509  0125 c65202        	ld	a,20994
1510  0128 1501          	bcp	a,(OFST-1,sp)
1511  012a 270a          	jreq	L766
1513  012c 0d02          	tnz	(OFST+0,sp)
1514  012e 2706          	jreq	L766
1515                     ; 387     pendingbitstatus = SET;
1517  0130 a601          	ld	a,#1
1518  0132 6b02          	ld	(OFST+0,sp),a
1521  0134 2002          	jra	L176
1522  0136               L766:
1523                     ; 392     pendingbitstatus = RESET;
1525  0136 0f02          	clr	(OFST+0,sp)
1527  0138               L176:
1528                     ; 395   return  pendingbitstatus;
1530  0138 7b02          	ld	a,(OFST+0,sp)
1533  013a 5b03          	addw	sp,#3
1534  013c 81            	ret
1579                     ; 412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1579                     ; 413 {
1580                     	switch	.text
1581  013d               _SPI_ClearITPendingBit:
1583  013d 88            	push	a
1584       00000001      OFST:	set	1
1587                     ; 414   uint8_t itpos = 0;
1589                     ; 420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1591  013e a4f0          	and	a,#240
1592  0140 4e            	swap	a
1593  0141 a40f          	and	a,#15
1594  0143 5f            	clrw	x
1595  0144 97            	ld	xl,a
1596  0145 a601          	ld	a,#1
1597  0147 5d            	tnzw	x
1598  0148 2704          	jreq	L26
1599  014a               L46:
1600  014a 48            	sll	a
1601  014b 5a            	decw	x
1602  014c 26fc          	jrne	L46
1603  014e               L26:
1604  014e 6b01          	ld	(OFST+0,sp),a
1606                     ; 422   SPI->SR = (uint8_t)(~itpos);
1608  0150 7b01          	ld	a,(OFST+0,sp)
1609  0152 43            	cpl	a
1610  0153 c75203        	ld	20995,a
1611                     ; 424 }
1614  0156 84            	pop	a
1615  0157 81            	ret
1628                     	xdef	_SPI_ClearITPendingBit
1629                     	xdef	_SPI_GetITStatus
1630                     	xdef	_SPI_ClearFlag
1631                     	xdef	_SPI_GetFlagStatus
1632                     	xdef	_SPI_BiDirectionalLineConfig
1633                     	xdef	_SPI_GetCRCPolynomial
1634                     	xdef	_SPI_ResetCRC
1635                     	xdef	_SPI_GetCRC
1636                     	xdef	_SPI_CalculateCRCCmd
1637                     	xdef	_SPI_TransmitCRC
1638                     	xdef	_SPI_NSSInternalSoftwareCmd
1639                     	xdef	_SPI_ReceiveData
1640                     	xdef	_SPI_SendData
1641                     	xdef	_SPI_ITConfig
1642                     	xdef	_SPI_Cmd
1643                     	xdef	_SPI_Init
1644                     	xdef	_SPI_DeInit
1663                     	end
