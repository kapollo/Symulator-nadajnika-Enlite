   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  42                     ; 52 void TIM2_DeInit(void)
  42                     ; 53 {
  44                     	switch	.text
  45  0000               _TIM2_DeInit:
  49                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  51  0000 725f5300      	clr	21248
  52                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  54  0004 725f5301      	clr	21249
  55                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  57  0008 725f5303      	clr	21251
  58                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  60  000c 725f5308      	clr	21256
  61                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  63  0010 725f5309      	clr	21257
  64                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  66  0014 725f5308      	clr	21256
  67                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  69  0018 725f5309      	clr	21257
  70                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  72  001c 725f5305      	clr	21253
  73                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  75  0020 725f5306      	clr	21254
  76                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  78  0024 725f5307      	clr	21255
  79                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  81  0028 725f530a      	clr	21258
  82                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  84  002c 725f530b      	clr	21259
  85                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  87  0030 725f530c      	clr	21260
  88                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  90  0034 35ff530d      	mov	21261,#255
  91                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  93  0038 35ff530e      	mov	21262,#255
  94                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
  96  003c 725f530f      	clr	21263
  97                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
  99  0040 725f5310      	clr	21264
 100                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 102  0044 725f5311      	clr	21265
 103                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 105  0048 725f5312      	clr	21266
 106                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 108  004c 725f5313      	clr	21267
 109                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 111  0050 725f5314      	clr	21268
 112                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 114  0054 725f5302      	clr	21250
 115                     ; 81 }
 118  0058 81            	ret
 286                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 286                     ; 90                         uint16_t TIM2_Period)
 286                     ; 91 {
 287                     	switch	.text
 288  0059               _TIM2_TimeBaseInit:
 290  0059 88            	push	a
 291       00000000      OFST:	set	0
 294                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 296  005a c7530c        	ld	21260,a
 297                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 299  005d 7b04          	ld	a,(OFST+4,sp)
 300  005f c7530d        	ld	21261,a
 301                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 303  0062 7b05          	ld	a,(OFST+5,sp)
 304  0064 c7530e        	ld	21262,a
 305                     ; 97 }
 308  0067 84            	pop	a
 309  0068 81            	ret
 466                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 466                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 466                     ; 110                   uint16_t TIM2_Pulse,
 466                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 466                     ; 112 {
 467                     	switch	.text
 468  0069               _TIM2_OC1Init:
 470  0069 89            	pushw	x
 471  006a 88            	push	a
 472       00000001      OFST:	set	1
 475                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 477  006b c65308        	ld	a,21256
 478  006e a4fc          	and	a,#252
 479  0070 c75308        	ld	21256,a
 480                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 480                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 482  0073 7b08          	ld	a,(OFST+7,sp)
 483  0075 a402          	and	a,#2
 484  0077 6b01          	ld	(OFST+0,sp),a
 486  0079 9f            	ld	a,xl
 487  007a a401          	and	a,#1
 488  007c 1a01          	or	a,(OFST+0,sp)
 489  007e ca5308        	or	a,21256
 490  0081 c75308        	ld	21256,a
 491                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 491                     ; 126                           (uint8_t)TIM2_OCMode);
 493  0084 c65305        	ld	a,21253
 494  0087 a48f          	and	a,#143
 495  0089 1a02          	or	a,(OFST+1,sp)
 496  008b c75305        	ld	21253,a
 497                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 499  008e 7b06          	ld	a,(OFST+5,sp)
 500  0090 c7530f        	ld	21263,a
 501                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 503  0093 7b07          	ld	a,(OFST+6,sp)
 504  0095 c75310        	ld	21264,a
 505                     ; 131 }
 508  0098 5b03          	addw	sp,#3
 509  009a 81            	ret
 573                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 573                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 573                     ; 144                   uint16_t TIM2_Pulse,
 573                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 573                     ; 146 {
 574                     	switch	.text
 575  009b               _TIM2_OC2Init:
 577  009b 89            	pushw	x
 578  009c 88            	push	a
 579       00000001      OFST:	set	1
 582                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 584  009d c65308        	ld	a,21256
 585  00a0 a4cf          	and	a,#207
 586  00a2 c75308        	ld	21256,a
 587                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 587                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 589  00a5 7b08          	ld	a,(OFST+7,sp)
 590  00a7 a420          	and	a,#32
 591  00a9 6b01          	ld	(OFST+0,sp),a
 593  00ab 9f            	ld	a,xl
 594  00ac a410          	and	a,#16
 595  00ae 1a01          	or	a,(OFST+0,sp)
 596  00b0 ca5308        	or	a,21256
 597  00b3 c75308        	ld	21256,a
 598                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 598                     ; 162                           (uint8_t)TIM2_OCMode);
 600  00b6 c65306        	ld	a,21254
 601  00b9 a48f          	and	a,#143
 602  00bb 1a02          	or	a,(OFST+1,sp)
 603  00bd c75306        	ld	21254,a
 604                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 606  00c0 7b06          	ld	a,(OFST+5,sp)
 607  00c2 c75311        	ld	21265,a
 608                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 610  00c5 7b07          	ld	a,(OFST+6,sp)
 611  00c7 c75312        	ld	21266,a
 612                     ; 168 }
 615  00ca 5b03          	addw	sp,#3
 616  00cc 81            	ret
 680                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 680                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 680                     ; 181                   uint16_t TIM2_Pulse,
 680                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 680                     ; 183 {
 681                     	switch	.text
 682  00cd               _TIM2_OC3Init:
 684  00cd 89            	pushw	x
 685  00ce 88            	push	a
 686       00000001      OFST:	set	1
 689                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 691  00cf c65309        	ld	a,21257
 692  00d2 a4fc          	and	a,#252
 693  00d4 c75309        	ld	21257,a
 694                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 694                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 696  00d7 7b08          	ld	a,(OFST+7,sp)
 697  00d9 a402          	and	a,#2
 698  00db 6b01          	ld	(OFST+0,sp),a
 700  00dd 9f            	ld	a,xl
 701  00de a401          	and	a,#1
 702  00e0 1a01          	or	a,(OFST+0,sp)
 703  00e2 ca5309        	or	a,21257
 704  00e5 c75309        	ld	21257,a
 705                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 705                     ; 196                           (uint8_t)TIM2_OCMode);
 707  00e8 c65307        	ld	a,21255
 708  00eb a48f          	and	a,#143
 709  00ed 1a02          	or	a,(OFST+1,sp)
 710  00ef c75307        	ld	21255,a
 711                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 713  00f2 7b06          	ld	a,(OFST+5,sp)
 714  00f4 c75313        	ld	21267,a
 715                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 717  00f7 7b07          	ld	a,(OFST+6,sp)
 718  00f9 c75314        	ld	21268,a
 719                     ; 201 }
 722  00fc 5b03          	addw	sp,#3
 723  00fe 81            	ret
 916                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 916                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 916                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 916                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 916                     ; 216                  uint8_t TIM2_ICFilter)
 916                     ; 217 {
 917                     	switch	.text
 918  00ff               _TIM2_ICInit:
 920  00ff 89            	pushw	x
 921       00000000      OFST:	set	0
 924                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
 926  0100 9e            	ld	a,xh
 927  0101 4d            	tnz	a
 928  0102 2614          	jrne	L104
 929                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
 929                     ; 229                (uint8_t)TIM2_ICSelection,
 929                     ; 230                (uint8_t)TIM2_ICFilter);
 931  0104 7b07          	ld	a,(OFST+7,sp)
 932  0106 88            	push	a
 933  0107 7b06          	ld	a,(OFST+6,sp)
 934  0109 97            	ld	xl,a
 935  010a 7b03          	ld	a,(OFST+3,sp)
 936  010c 95            	ld	xh,a
 937  010d cd044a        	call	L3_TI1_Config
 939  0110 84            	pop	a
 940                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 942  0111 7b06          	ld	a,(OFST+6,sp)
 943  0113 cd0340        	call	_TIM2_SetIC1Prescaler
 946  0116 202c          	jra	L304
 947  0118               L104:
 948                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
 950  0118 7b01          	ld	a,(OFST+1,sp)
 951  011a a101          	cp	a,#1
 952  011c 2614          	jrne	L504
 953                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
 953                     ; 239                (uint8_t)TIM2_ICSelection,
 953                     ; 240                (uint8_t)TIM2_ICFilter);
 955  011e 7b07          	ld	a,(OFST+7,sp)
 956  0120 88            	push	a
 957  0121 7b06          	ld	a,(OFST+6,sp)
 958  0123 97            	ld	xl,a
 959  0124 7b03          	ld	a,(OFST+3,sp)
 960  0126 95            	ld	xh,a
 961  0127 cd047a        	call	L5_TI2_Config
 963  012a 84            	pop	a
 964                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 966  012b 7b06          	ld	a,(OFST+6,sp)
 967  012d cd034d        	call	_TIM2_SetIC2Prescaler
 970  0130 2012          	jra	L304
 971  0132               L504:
 972                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
 972                     ; 249                (uint8_t)TIM2_ICSelection,
 972                     ; 250                (uint8_t)TIM2_ICFilter);
 974  0132 7b07          	ld	a,(OFST+7,sp)
 975  0134 88            	push	a
 976  0135 7b06          	ld	a,(OFST+6,sp)
 977  0137 97            	ld	xl,a
 978  0138 7b03          	ld	a,(OFST+3,sp)
 979  013a 95            	ld	xh,a
 980  013b cd04aa        	call	L7_TI3_Config
 982  013e 84            	pop	a
 983                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
 985  013f 7b06          	ld	a,(OFST+6,sp)
 986  0141 cd035a        	call	_TIM2_SetIC3Prescaler
 988  0144               L304:
 989                     ; 255 }
 992  0144 85            	popw	x
 993  0145 81            	ret
1089                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1089                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1089                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1089                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1089                     ; 270                      uint8_t TIM2_ICFilter)
1089                     ; 271 {
1090                     	switch	.text
1091  0146               _TIM2_PWMIConfig:
1093  0146 89            	pushw	x
1094  0147 89            	pushw	x
1095       00000002      OFST:	set	2
1098                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1100                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1102                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1104  0148 9f            	ld	a,xl
1105  0149 a144          	cp	a,#68
1106  014b 2706          	jreq	L754
1107                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1109  014d a644          	ld	a,#68
1110  014f 6b01          	ld	(OFST-1,sp),a
1113  0151 2002          	jra	L164
1114  0153               L754:
1115                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1117  0153 0f01          	clr	(OFST-1,sp)
1119  0155               L164:
1120                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1122  0155 7b07          	ld	a,(OFST+5,sp)
1123  0157 a101          	cp	a,#1
1124  0159 2606          	jrne	L364
1125                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1127  015b a602          	ld	a,#2
1128  015d 6b02          	ld	(OFST+0,sp),a
1131  015f 2004          	jra	L564
1132  0161               L364:
1133                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1135  0161 a601          	ld	a,#1
1136  0163 6b02          	ld	(OFST+0,sp),a
1138  0165               L564:
1139                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1141  0165 0d03          	tnz	(OFST+1,sp)
1142  0167 2626          	jrne	L764
1143                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1143                     ; 305                (uint8_t)TIM2_ICFilter);
1145  0169 7b09          	ld	a,(OFST+7,sp)
1146  016b 88            	push	a
1147  016c 7b08          	ld	a,(OFST+6,sp)
1148  016e 97            	ld	xl,a
1149  016f 7b05          	ld	a,(OFST+3,sp)
1150  0171 95            	ld	xh,a
1151  0172 cd044a        	call	L3_TI1_Config
1153  0175 84            	pop	a
1154                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1156  0176 7b08          	ld	a,(OFST+6,sp)
1157  0178 cd0340        	call	_TIM2_SetIC1Prescaler
1159                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1161  017b 7b09          	ld	a,(OFST+7,sp)
1162  017d 88            	push	a
1163  017e 7b03          	ld	a,(OFST+1,sp)
1164  0180 97            	ld	xl,a
1165  0181 7b02          	ld	a,(OFST+0,sp)
1166  0183 95            	ld	xh,a
1167  0184 cd047a        	call	L5_TI2_Config
1169  0187 84            	pop	a
1170                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1172  0188 7b08          	ld	a,(OFST+6,sp)
1173  018a cd034d        	call	_TIM2_SetIC2Prescaler
1176  018d 2024          	jra	L174
1177  018f               L764:
1178                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1178                     ; 320                (uint8_t)TIM2_ICFilter);
1180  018f 7b09          	ld	a,(OFST+7,sp)
1181  0191 88            	push	a
1182  0192 7b08          	ld	a,(OFST+6,sp)
1183  0194 97            	ld	xl,a
1184  0195 7b05          	ld	a,(OFST+3,sp)
1185  0197 95            	ld	xh,a
1186  0198 cd047a        	call	L5_TI2_Config
1188  019b 84            	pop	a
1189                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1191  019c 7b08          	ld	a,(OFST+6,sp)
1192  019e cd034d        	call	_TIM2_SetIC2Prescaler
1194                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1196  01a1 7b09          	ld	a,(OFST+7,sp)
1197  01a3 88            	push	a
1198  01a4 7b03          	ld	a,(OFST+1,sp)
1199  01a6 97            	ld	xl,a
1200  01a7 7b02          	ld	a,(OFST+0,sp)
1201  01a9 95            	ld	xh,a
1202  01aa cd044a        	call	L3_TI1_Config
1204  01ad 84            	pop	a
1205                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1207  01ae 7b08          	ld	a,(OFST+6,sp)
1208  01b0 cd0340        	call	_TIM2_SetIC1Prescaler
1210  01b3               L174:
1211                     ; 331 }
1214  01b3 5b04          	addw	sp,#4
1215  01b5 81            	ret
1270                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1270                     ; 340 {
1271                     	switch	.text
1272  01b6               _TIM2_Cmd:
1276                     ; 345   if (NewState != DISABLE)
1278  01b6 4d            	tnz	a
1279  01b7 2706          	jreq	L125
1280                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1282  01b9 72105300      	bset	21248,#0
1284  01bd 2004          	jra	L325
1285  01bf               L125:
1286                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1288  01bf 72115300      	bres	21248,#0
1289  01c3               L325:
1290                     ; 353 }
1293  01c3 81            	ret
1372                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1372                     ; 369 {
1373                     	switch	.text
1374  01c4               _TIM2_ITConfig:
1376  01c4 89            	pushw	x
1377       00000000      OFST:	set	0
1380                     ; 374   if (NewState != DISABLE)
1382  01c5 9f            	ld	a,xl
1383  01c6 4d            	tnz	a
1384  01c7 2709          	jreq	L365
1385                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1387  01c9 9e            	ld	a,xh
1388  01ca ca5301        	or	a,21249
1389  01cd c75301        	ld	21249,a
1391  01d0 2009          	jra	L565
1392  01d2               L365:
1393                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1395  01d2 7b01          	ld	a,(OFST+1,sp)
1396  01d4 43            	cpl	a
1397  01d5 c45301        	and	a,21249
1398  01d8 c75301        	ld	21249,a
1399  01db               L565:
1400                     ; 384 }
1403  01db 85            	popw	x
1404  01dc 81            	ret
1440                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1440                     ; 393 {
1441                     	switch	.text
1442  01dd               _TIM2_UpdateDisableConfig:
1446                     ; 398   if (NewState != DISABLE)
1448  01dd 4d            	tnz	a
1449  01de 2706          	jreq	L506
1450                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1452  01e0 72125300      	bset	21248,#1
1454  01e4 2004          	jra	L706
1455  01e6               L506:
1456                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1458  01e6 72135300      	bres	21248,#1
1459  01ea               L706:
1460                     ; 406 }
1463  01ea 81            	ret
1521                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1521                     ; 417 {
1522                     	switch	.text
1523  01eb               _TIM2_UpdateRequestConfig:
1527                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1529  01eb 4d            	tnz	a
1530  01ec 2706          	jreq	L736
1531                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1533  01ee 72145300      	bset	21248,#2
1535  01f2 2004          	jra	L146
1536  01f4               L736:
1537                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1539  01f4 72155300      	bres	21248,#2
1540  01f8               L146:
1541                     ; 430 }
1544  01f8 81            	ret
1601                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1601                     ; 441 {
1602                     	switch	.text
1603  01f9               _TIM2_SelectOnePulseMode:
1607                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1609  01f9 4d            	tnz	a
1610  01fa 2706          	jreq	L176
1611                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1613  01fc 72165300      	bset	21248,#3
1615  0200 2004          	jra	L376
1616  0202               L176:
1617                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1619  0202 72175300      	bres	21248,#3
1620  0206               L376:
1621                     ; 454 }
1624  0206 81            	ret
1692                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1692                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1692                     ; 486 {
1693                     	switch	.text
1694  0207               _TIM2_PrescalerConfig:
1698                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
1700  0207 9e            	ld	a,xh
1701  0208 c7530c        	ld	21260,a
1702                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1704  020b 9f            	ld	a,xl
1705  020c c75304        	ld	21252,a
1706                     ; 496 }
1709  020f 81            	ret
1767                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1767                     ; 508 {
1768                     	switch	.text
1769  0210               _TIM2_ForcedOC1Config:
1771  0210 88            	push	a
1772       00000000      OFST:	set	0
1775                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1775                     ; 514                             | (uint8_t)TIM2_ForcedAction);
1777  0211 c65305        	ld	a,21253
1778  0214 a48f          	and	a,#143
1779  0216 1a01          	or	a,(OFST+1,sp)
1780  0218 c75305        	ld	21253,a
1781                     ; 515 }
1784  021b 84            	pop	a
1785  021c 81            	ret
1821                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1821                     ; 527 {
1822                     	switch	.text
1823  021d               _TIM2_ForcedOC2Config:
1825  021d 88            	push	a
1826       00000000      OFST:	set	0
1829                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1829                     ; 533                           | (uint8_t)TIM2_ForcedAction);
1831  021e c65306        	ld	a,21254
1832  0221 a48f          	and	a,#143
1833  0223 1a01          	or	a,(OFST+1,sp)
1834  0225 c75306        	ld	21254,a
1835                     ; 534 }
1838  0228 84            	pop	a
1839  0229 81            	ret
1875                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1875                     ; 546 {
1876                     	switch	.text
1877  022a               _TIM2_ForcedOC3Config:
1879  022a 88            	push	a
1880       00000000      OFST:	set	0
1883                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1883                     ; 552                             | (uint8_t)TIM2_ForcedAction);
1885  022b c65307        	ld	a,21255
1886  022e a48f          	and	a,#143
1887  0230 1a01          	or	a,(OFST+1,sp)
1888  0232 c75307        	ld	21255,a
1889                     ; 553 }
1892  0235 84            	pop	a
1893  0236 81            	ret
1929                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1929                     ; 562 {
1930                     	switch	.text
1931  0237               _TIM2_ARRPreloadConfig:
1935                     ; 567   if (NewState != DISABLE)
1937  0237 4d            	tnz	a
1938  0238 2706          	jreq	L7201
1939                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
1941  023a 721e5300      	bset	21248,#7
1943  023e 2004          	jra	L1301
1944  0240               L7201:
1945                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
1947  0240 721f5300      	bres	21248,#7
1948  0244               L1301:
1949                     ; 575 }
1952  0244 81            	ret
1988                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
1988                     ; 584 {
1989                     	switch	.text
1990  0245               _TIM2_OC1PreloadConfig:
1994                     ; 589   if (NewState != DISABLE)
1996  0245 4d            	tnz	a
1997  0246 2706          	jreq	L1501
1998                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2000  0248 72165305      	bset	21253,#3
2002  024c 2004          	jra	L3501
2003  024e               L1501:
2004                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2006  024e 72175305      	bres	21253,#3
2007  0252               L3501:
2008                     ; 597 }
2011  0252 81            	ret
2047                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2047                     ; 606 {
2048                     	switch	.text
2049  0253               _TIM2_OC2PreloadConfig:
2053                     ; 611   if (NewState != DISABLE)
2055  0253 4d            	tnz	a
2056  0254 2706          	jreq	L3701
2057                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2059  0256 72165306      	bset	21254,#3
2061  025a 2004          	jra	L5701
2062  025c               L3701:
2063                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2065  025c 72175306      	bres	21254,#3
2066  0260               L5701:
2067                     ; 619 }
2070  0260 81            	ret
2106                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2106                     ; 628 {
2107                     	switch	.text
2108  0261               _TIM2_OC3PreloadConfig:
2112                     ; 633   if (NewState != DISABLE)
2114  0261 4d            	tnz	a
2115  0262 2706          	jreq	L5111
2116                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2118  0264 72165307      	bset	21255,#3
2120  0268 2004          	jra	L7111
2121  026a               L5111:
2122                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2124  026a 72175307      	bres	21255,#3
2125  026e               L7111:
2126                     ; 641 }
2129  026e 81            	ret
2202                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2202                     ; 654 {
2203                     	switch	.text
2204  026f               _TIM2_GenerateEvent:
2208                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2210  026f c75304        	ld	21252,a
2211                     ; 660 }
2214  0272 81            	ret
2250                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2250                     ; 671 {
2251                     	switch	.text
2252  0273               _TIM2_OC1PolarityConfig:
2256                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2258  0273 4d            	tnz	a
2259  0274 2706          	jreq	L1711
2260                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2262  0276 72125308      	bset	21256,#1
2264  027a 2004          	jra	L3711
2265  027c               L1711:
2266                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2268  027c 72135308      	bres	21256,#1
2269  0280               L3711:
2270                     ; 684 }
2273  0280 81            	ret
2309                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2309                     ; 695 {
2310                     	switch	.text
2311  0281               _TIM2_OC2PolarityConfig:
2315                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2317  0281 4d            	tnz	a
2318  0282 2706          	jreq	L3121
2319                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2321  0284 721a5308      	bset	21256,#5
2323  0288 2004          	jra	L5121
2324  028a               L3121:
2325                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2327  028a 721b5308      	bres	21256,#5
2328  028e               L5121:
2329                     ; 708 }
2332  028e 81            	ret
2368                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2368                     ; 719 {
2369                     	switch	.text
2370  028f               _TIM2_OC3PolarityConfig:
2374                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2376  028f 4d            	tnz	a
2377  0290 2706          	jreq	L5321
2378                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2380  0292 72125309      	bset	21257,#1
2382  0296 2004          	jra	L7321
2383  0298               L5321:
2384                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2386  0298 72135309      	bres	21257,#1
2387  029c               L7321:
2388                     ; 732 }
2391  029c 81            	ret
2436                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2436                     ; 746 {
2437                     	switch	.text
2438  029d               _TIM2_CCxCmd:
2440  029d 89            	pushw	x
2441       00000000      OFST:	set	0
2444                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
2446  029e 9e            	ld	a,xh
2447  029f 4d            	tnz	a
2448  02a0 2610          	jrne	L3621
2449                     ; 754     if (NewState != DISABLE)
2451  02a2 9f            	ld	a,xl
2452  02a3 4d            	tnz	a
2453  02a4 2706          	jreq	L5621
2454                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2456  02a6 72105308      	bset	21256,#0
2458  02aa 202a          	jra	L1721
2459  02ac               L5621:
2460                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2462  02ac 72115308      	bres	21256,#0
2463  02b0 2024          	jra	L1721
2464  02b2               L3621:
2465                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
2467  02b2 7b01          	ld	a,(OFST+1,sp)
2468  02b4 a101          	cp	a,#1
2469  02b6 2610          	jrne	L3721
2470                     ; 767     if (NewState != DISABLE)
2472  02b8 0d02          	tnz	(OFST+2,sp)
2473  02ba 2706          	jreq	L5721
2474                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2476  02bc 72185308      	bset	21256,#4
2478  02c0 2014          	jra	L1721
2479  02c2               L5721:
2480                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2482  02c2 72195308      	bres	21256,#4
2483  02c6 200e          	jra	L1721
2484  02c8               L3721:
2485                     ; 779     if (NewState != DISABLE)
2487  02c8 0d02          	tnz	(OFST+2,sp)
2488  02ca 2706          	jreq	L3031
2489                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2491  02cc 72105309      	bset	21257,#0
2493  02d0 2004          	jra	L1721
2494  02d2               L3031:
2495                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2497  02d2 72115309      	bres	21257,#0
2498  02d6               L1721:
2499                     ; 788 }
2502  02d6 85            	popw	x
2503  02d7 81            	ret
2548                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2548                     ; 811 {
2549                     	switch	.text
2550  02d8               _TIM2_SelectOCxM:
2552  02d8 89            	pushw	x
2553       00000000      OFST:	set	0
2556                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
2558  02d9 9e            	ld	a,xh
2559  02da 4d            	tnz	a
2560  02db 2610          	jrne	L1331
2561                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2563  02dd 72115308      	bres	21256,#0
2564                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2564                     ; 823                             | (uint8_t)TIM2_OCMode);
2566  02e1 c65305        	ld	a,21253
2567  02e4 a48f          	and	a,#143
2568  02e6 1a02          	or	a,(OFST+2,sp)
2569  02e8 c75305        	ld	21253,a
2571  02eb 2024          	jra	L3331
2572  02ed               L1331:
2573                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
2575  02ed 7b01          	ld	a,(OFST+1,sp)
2576  02ef a101          	cp	a,#1
2577  02f1 2610          	jrne	L5331
2578                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2580  02f3 72195308      	bres	21256,#4
2581                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2581                     ; 832                             | (uint8_t)TIM2_OCMode);
2583  02f7 c65306        	ld	a,21254
2584  02fa a48f          	and	a,#143
2585  02fc 1a02          	or	a,(OFST+2,sp)
2586  02fe c75306        	ld	21254,a
2588  0301 200e          	jra	L3331
2589  0303               L5331:
2590                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2592  0303 72115309      	bres	21257,#0
2593                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2593                     ; 841                             | (uint8_t)TIM2_OCMode);
2595  0307 c65307        	ld	a,21255
2596  030a a48f          	and	a,#143
2597  030c 1a02          	or	a,(OFST+2,sp)
2598  030e c75307        	ld	21255,a
2599  0311               L3331:
2600                     ; 843 }
2603  0311 85            	popw	x
2604  0312 81            	ret
2638                     ; 851 void TIM2_SetCounter(uint16_t Counter)
2638                     ; 852 {
2639                     	switch	.text
2640  0313               _TIM2_SetCounter:
2644                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
2646  0313 9e            	ld	a,xh
2647  0314 c7530a        	ld	21258,a
2648                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
2650  0317 9f            	ld	a,xl
2651  0318 c7530b        	ld	21259,a
2652                     ; 856 }
2655  031b 81            	ret
2689                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
2689                     ; 865 {
2690                     	switch	.text
2691  031c               _TIM2_SetAutoreload:
2695                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2697  031c 9e            	ld	a,xh
2698  031d c7530d        	ld	21261,a
2699                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
2701  0320 9f            	ld	a,xl
2702  0321 c7530e        	ld	21262,a
2703                     ; 869 }
2706  0324 81            	ret
2740                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
2740                     ; 878 {
2741                     	switch	.text
2742  0325               _TIM2_SetCompare1:
2746                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2748  0325 9e            	ld	a,xh
2749  0326 c7530f        	ld	21263,a
2750                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
2752  0329 9f            	ld	a,xl
2753  032a c75310        	ld	21264,a
2754                     ; 882 }
2757  032d 81            	ret
2791                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
2791                     ; 891 {
2792                     	switch	.text
2793  032e               _TIM2_SetCompare2:
2797                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2799  032e 9e            	ld	a,xh
2800  032f c75311        	ld	21265,a
2801                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
2803  0332 9f            	ld	a,xl
2804  0333 c75312        	ld	21266,a
2805                     ; 895 }
2808  0336 81            	ret
2842                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
2842                     ; 904 {
2843                     	switch	.text
2844  0337               _TIM2_SetCompare3:
2848                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2850  0337 9e            	ld	a,xh
2851  0338 c75313        	ld	21267,a
2852                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
2854  033b 9f            	ld	a,xl
2855  033c c75314        	ld	21268,a
2856                     ; 908 }
2859  033f 81            	ret
2895                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2895                     ; 921 {
2896                     	switch	.text
2897  0340               _TIM2_SetIC1Prescaler:
2899  0340 88            	push	a
2900       00000000      OFST:	set	0
2903                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2903                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
2905  0341 c65305        	ld	a,21253
2906  0344 a4f3          	and	a,#243
2907  0346 1a01          	or	a,(OFST+1,sp)
2908  0348 c75305        	ld	21253,a
2909                     ; 928 }
2912  034b 84            	pop	a
2913  034c 81            	ret
2949                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
2949                     ; 941 {
2950                     	switch	.text
2951  034d               _TIM2_SetIC2Prescaler:
2953  034d 88            	push	a
2954       00000000      OFST:	set	0
2957                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2957                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
2959  034e c65306        	ld	a,21254
2960  0351 a4f3          	and	a,#243
2961  0353 1a01          	or	a,(OFST+1,sp)
2962  0355 c75306        	ld	21254,a
2963                     ; 948 }
2966  0358 84            	pop	a
2967  0359 81            	ret
3003                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3003                     ; 961 {
3004                     	switch	.text
3005  035a               _TIM2_SetIC3Prescaler:
3007  035a 88            	push	a
3008       00000000      OFST:	set	0
3011                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3011                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
3013  035b c65307        	ld	a,21255
3014  035e a4f3          	and	a,#243
3015  0360 1a01          	or	a,(OFST+1,sp)
3016  0362 c75307        	ld	21255,a
3017                     ; 968 }
3020  0365 84            	pop	a
3021  0366 81            	ret
3073                     ; 975 uint16_t TIM2_GetCapture1(void)
3073                     ; 976 {
3074                     	switch	.text
3075  0367               _TIM2_GetCapture1:
3077  0367 5204          	subw	sp,#4
3078       00000004      OFST:	set	4
3081                     ; 978   uint16_t tmpccr1 = 0;
3083                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
3087                     ; 981   tmpccr1h = TIM2->CCR1H;
3089  0369 c6530f        	ld	a,21263
3090  036c 6b02          	ld	(OFST-2,sp),a
3092                     ; 982   tmpccr1l = TIM2->CCR1L;
3094  036e c65310        	ld	a,21264
3095  0371 6b01          	ld	(OFST-3,sp),a
3097                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
3099  0373 7b01          	ld	a,(OFST-3,sp)
3100  0375 5f            	clrw	x
3101  0376 97            	ld	xl,a
3102  0377 1f03          	ldw	(OFST-1,sp),x
3104                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3106  0379 7b02          	ld	a,(OFST-2,sp)
3107  037b 5f            	clrw	x
3108  037c 97            	ld	xl,a
3109  037d 4f            	clr	a
3110  037e 02            	rlwa	x,a
3111  037f 01            	rrwa	x,a
3112  0380 1a04          	or	a,(OFST+0,sp)
3113  0382 01            	rrwa	x,a
3114  0383 1a03          	or	a,(OFST-1,sp)
3115  0385 01            	rrwa	x,a
3116  0386 1f03          	ldw	(OFST-1,sp),x
3118                     ; 987   return (uint16_t)tmpccr1;
3120  0388 1e03          	ldw	x,(OFST-1,sp)
3123  038a 5b04          	addw	sp,#4
3124  038c 81            	ret
3176                     ; 995 uint16_t TIM2_GetCapture2(void)
3176                     ; 996 {
3177                     	switch	.text
3178  038d               _TIM2_GetCapture2:
3180  038d 5204          	subw	sp,#4
3181       00000004      OFST:	set	4
3184                     ; 998   uint16_t tmpccr2 = 0;
3186                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
3190                     ; 1001   tmpccr2h = TIM2->CCR2H;
3192  038f c65311        	ld	a,21265
3193  0392 6b02          	ld	(OFST-2,sp),a
3195                     ; 1002   tmpccr2l = TIM2->CCR2L;
3197  0394 c65312        	ld	a,21266
3198  0397 6b01          	ld	(OFST-3,sp),a
3200                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
3202  0399 7b01          	ld	a,(OFST-3,sp)
3203  039b 5f            	clrw	x
3204  039c 97            	ld	xl,a
3205  039d 1f03          	ldw	(OFST-1,sp),x
3207                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3209  039f 7b02          	ld	a,(OFST-2,sp)
3210  03a1 5f            	clrw	x
3211  03a2 97            	ld	xl,a
3212  03a3 4f            	clr	a
3213  03a4 02            	rlwa	x,a
3214  03a5 01            	rrwa	x,a
3215  03a6 1a04          	or	a,(OFST+0,sp)
3216  03a8 01            	rrwa	x,a
3217  03a9 1a03          	or	a,(OFST-1,sp)
3218  03ab 01            	rrwa	x,a
3219  03ac 1f03          	ldw	(OFST-1,sp),x
3221                     ; 1007   return (uint16_t)tmpccr2;
3223  03ae 1e03          	ldw	x,(OFST-1,sp)
3226  03b0 5b04          	addw	sp,#4
3227  03b2 81            	ret
3279                     ; 1015 uint16_t TIM2_GetCapture3(void)
3279                     ; 1016 {
3280                     	switch	.text
3281  03b3               _TIM2_GetCapture3:
3283  03b3 5204          	subw	sp,#4
3284       00000004      OFST:	set	4
3287                     ; 1018   uint16_t tmpccr3 = 0;
3289                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
3293                     ; 1021   tmpccr3h = TIM2->CCR3H;
3295  03b5 c65313        	ld	a,21267
3296  03b8 6b02          	ld	(OFST-2,sp),a
3298                     ; 1022   tmpccr3l = TIM2->CCR3L;
3300  03ba c65314        	ld	a,21268
3301  03bd 6b01          	ld	(OFST-3,sp),a
3303                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
3305  03bf 7b01          	ld	a,(OFST-3,sp)
3306  03c1 5f            	clrw	x
3307  03c2 97            	ld	xl,a
3308  03c3 1f03          	ldw	(OFST-1,sp),x
3310                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3312  03c5 7b02          	ld	a,(OFST-2,sp)
3313  03c7 5f            	clrw	x
3314  03c8 97            	ld	xl,a
3315  03c9 4f            	clr	a
3316  03ca 02            	rlwa	x,a
3317  03cb 01            	rrwa	x,a
3318  03cc 1a04          	or	a,(OFST+0,sp)
3319  03ce 01            	rrwa	x,a
3320  03cf 1a03          	or	a,(OFST-1,sp)
3321  03d1 01            	rrwa	x,a
3322  03d2 1f03          	ldw	(OFST-1,sp),x
3324                     ; 1027   return (uint16_t)tmpccr3;
3326  03d4 1e03          	ldw	x,(OFST-1,sp)
3329  03d6 5b04          	addw	sp,#4
3330  03d8 81            	ret
3364                     ; 1035 uint16_t TIM2_GetCounter(void)
3364                     ; 1036 {
3365                     	switch	.text
3366  03d9               _TIM2_GetCounter:
3368  03d9 89            	pushw	x
3369       00000002      OFST:	set	2
3372                     ; 1037   uint16_t tmpcntr = 0;
3374                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3376  03da c6530a        	ld	a,21258
3377  03dd 5f            	clrw	x
3378  03de 97            	ld	xl,a
3379  03df 4f            	clr	a
3380  03e0 02            	rlwa	x,a
3381  03e1 1f01          	ldw	(OFST-1,sp),x
3383                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3385  03e3 c6530b        	ld	a,21259
3386  03e6 5f            	clrw	x
3387  03e7 97            	ld	xl,a
3388  03e8 01            	rrwa	x,a
3389  03e9 1a02          	or	a,(OFST+0,sp)
3390  03eb 01            	rrwa	x,a
3391  03ec 1a01          	or	a,(OFST-1,sp)
3392  03ee 01            	rrwa	x,a
3395  03ef 5b02          	addw	sp,#2
3396  03f1 81            	ret
3420                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3420                     ; 1050 {
3421                     	switch	.text
3422  03f2               _TIM2_GetPrescaler:
3426                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3428  03f2 c6530c        	ld	a,21260
3431  03f5 81            	ret
3570                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3570                     ; 1069 {
3571                     	switch	.text
3572  03f6               _TIM2_GetFlagStatus:
3574  03f6 89            	pushw	x
3575  03f7 89            	pushw	x
3576       00000002      OFST:	set	2
3579                     ; 1070   FlagStatus bitstatus = RESET;
3581                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3585                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3587  03f8 9f            	ld	a,xl
3588  03f9 c45302        	and	a,21250
3589  03fc 6b01          	ld	(OFST-1,sp),a
3591                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3593  03fe 7b03          	ld	a,(OFST+1,sp)
3594  0400 6b02          	ld	(OFST+0,sp),a
3596                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3598  0402 c65303        	ld	a,21251
3599  0405 1402          	and	a,(OFST+0,sp)
3600  0407 1a01          	or	a,(OFST-1,sp)
3601  0409 2706          	jreq	L5371
3602                     ; 1081     bitstatus = SET;
3604  040b a601          	ld	a,#1
3605  040d 6b02          	ld	(OFST+0,sp),a
3608  040f 2002          	jra	L7371
3609  0411               L5371:
3610                     ; 1085     bitstatus = RESET;
3612  0411 0f02          	clr	(OFST+0,sp)
3614  0413               L7371:
3615                     ; 1087   return (FlagStatus)bitstatus;
3617  0413 7b02          	ld	a,(OFST+0,sp)
3620  0415 5b04          	addw	sp,#4
3621  0417 81            	ret
3656                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3656                     ; 1104 {
3657                     	switch	.text
3658  0418               _TIM2_ClearFlag:
3662                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3664  0418 9f            	ld	a,xl
3665  0419 43            	cpl	a
3666  041a c75302        	ld	21250,a
3667                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3669  041d 35ff5303      	mov	21251,#255
3670                     ; 1111 }
3673  0421 81            	ret
3737                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3737                     ; 1124 {
3738                     	switch	.text
3739  0422               _TIM2_GetITStatus:
3741  0422 88            	push	a
3742  0423 89            	pushw	x
3743       00000002      OFST:	set	2
3746                     ; 1125   ITStatus bitstatus = RESET;
3748                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3752                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3754  0424 c45302        	and	a,21250
3755  0427 6b01          	ld	(OFST-1,sp),a
3757                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3759  0429 c65301        	ld	a,21249
3760  042c 1403          	and	a,(OFST+1,sp)
3761  042e 6b02          	ld	(OFST+0,sp),a
3763                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3765  0430 0d01          	tnz	(OFST-1,sp)
3766  0432 270a          	jreq	L1102
3768  0434 0d02          	tnz	(OFST+0,sp)
3769  0436 2706          	jreq	L1102
3770                     ; 1137     bitstatus = SET;
3772  0438 a601          	ld	a,#1
3773  043a 6b02          	ld	(OFST+0,sp),a
3776  043c 2002          	jra	L3102
3777  043e               L1102:
3778                     ; 1141     bitstatus = RESET;
3780  043e 0f02          	clr	(OFST+0,sp)
3782  0440               L3102:
3783                     ; 1143   return (ITStatus)(bitstatus);
3785  0440 7b02          	ld	a,(OFST+0,sp)
3788  0442 5b03          	addw	sp,#3
3789  0444 81            	ret
3825                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3825                     ; 1157 {
3826                     	switch	.text
3827  0445               _TIM2_ClearITPendingBit:
3831                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
3833  0445 43            	cpl	a
3834  0446 c75302        	ld	21250,a
3835                     ; 1163 }
3838  0449 81            	ret
3890                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
3890                     ; 1182                        uint8_t TIM2_ICSelection,
3890                     ; 1183                        uint8_t TIM2_ICFilter)
3890                     ; 1184 {
3891                     	switch	.text
3892  044a               L3_TI1_Config:
3894  044a 89            	pushw	x
3895  044b 88            	push	a
3896       00000001      OFST:	set	1
3899                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3901  044c 72115308      	bres	21256,#0
3902                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3902                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3904  0450 7b06          	ld	a,(OFST+5,sp)
3905  0452 97            	ld	xl,a
3906  0453 a610          	ld	a,#16
3907  0455 42            	mul	x,a
3908  0456 9f            	ld	a,xl
3909  0457 1a03          	or	a,(OFST+2,sp)
3910  0459 6b01          	ld	(OFST+0,sp),a
3912  045b c65305        	ld	a,21253
3913  045e a40c          	and	a,#12
3914  0460 1a01          	or	a,(OFST+0,sp)
3915  0462 c75305        	ld	21253,a
3916                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
3918  0465 0d02          	tnz	(OFST+1,sp)
3919  0467 2706          	jreq	L1602
3920                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
3922  0469 72125308      	bset	21256,#1
3924  046d 2004          	jra	L3602
3925  046f               L1602:
3926                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3928  046f 72135308      	bres	21256,#1
3929  0473               L3602:
3930                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
3932  0473 72105308      	bset	21256,#0
3933                     ; 1203 }
3936  0477 5b03          	addw	sp,#3
3937  0479 81            	ret
3989                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
3989                     ; 1222                        uint8_t TIM2_ICSelection,
3989                     ; 1223                        uint8_t TIM2_ICFilter)
3989                     ; 1224 {
3990                     	switch	.text
3991  047a               L5_TI2_Config:
3993  047a 89            	pushw	x
3994  047b 88            	push	a
3995       00000001      OFST:	set	1
3998                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4000  047c 72195308      	bres	21256,#4
4001                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4001                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4003  0480 7b06          	ld	a,(OFST+5,sp)
4004  0482 97            	ld	xl,a
4005  0483 a610          	ld	a,#16
4006  0485 42            	mul	x,a
4007  0486 9f            	ld	a,xl
4008  0487 1a03          	or	a,(OFST+2,sp)
4009  0489 6b01          	ld	(OFST+0,sp),a
4011  048b c65306        	ld	a,21254
4012  048e a40c          	and	a,#12
4013  0490 1a01          	or	a,(OFST+0,sp)
4014  0492 c75306        	ld	21254,a
4015                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4017  0495 0d02          	tnz	(OFST+1,sp)
4018  0497 2706          	jreq	L3112
4019                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4021  0499 721a5308      	bset	21256,#5
4023  049d 2004          	jra	L5112
4024  049f               L3112:
4025                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4027  049f 721b5308      	bres	21256,#5
4028  04a3               L5112:
4029                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4031  04a3 72185308      	bset	21256,#4
4032                     ; 1245 }
4035  04a7 5b03          	addw	sp,#3
4036  04a9 81            	ret
4088                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4088                     ; 1262                        uint8_t TIM2_ICFilter)
4088                     ; 1263 {
4089                     	switch	.text
4090  04aa               L7_TI3_Config:
4092  04aa 89            	pushw	x
4093  04ab 88            	push	a
4094       00000001      OFST:	set	1
4097                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4099  04ac 72115309      	bres	21257,#0
4100                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4100                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4102  04b0 7b06          	ld	a,(OFST+5,sp)
4103  04b2 97            	ld	xl,a
4104  04b3 a610          	ld	a,#16
4105  04b5 42            	mul	x,a
4106  04b6 9f            	ld	a,xl
4107  04b7 1a03          	or	a,(OFST+2,sp)
4108  04b9 6b01          	ld	(OFST+0,sp),a
4110  04bb c65307        	ld	a,21255
4111  04be a40c          	and	a,#12
4112  04c0 1a01          	or	a,(OFST+0,sp)
4113  04c2 c75307        	ld	21255,a
4114                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4116  04c5 0d02          	tnz	(OFST+1,sp)
4117  04c7 2706          	jreq	L5412
4118                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4120  04c9 72125309      	bset	21257,#1
4122  04cd 2004          	jra	L7412
4123  04cf               L5412:
4124                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4126  04cf 72135309      	bres	21257,#1
4127  04d3               L7412:
4128                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4130  04d3 72105309      	bset	21257,#0
4131                     ; 1283 }
4134  04d7 5b03          	addw	sp,#3
4135  04d9 81            	ret
4148                     	xdef	_TIM2_ClearITPendingBit
4149                     	xdef	_TIM2_GetITStatus
4150                     	xdef	_TIM2_ClearFlag
4151                     	xdef	_TIM2_GetFlagStatus
4152                     	xdef	_TIM2_GetPrescaler
4153                     	xdef	_TIM2_GetCounter
4154                     	xdef	_TIM2_GetCapture3
4155                     	xdef	_TIM2_GetCapture2
4156                     	xdef	_TIM2_GetCapture1
4157                     	xdef	_TIM2_SetIC3Prescaler
4158                     	xdef	_TIM2_SetIC2Prescaler
4159                     	xdef	_TIM2_SetIC1Prescaler
4160                     	xdef	_TIM2_SetCompare3
4161                     	xdef	_TIM2_SetCompare2
4162                     	xdef	_TIM2_SetCompare1
4163                     	xdef	_TIM2_SetAutoreload
4164                     	xdef	_TIM2_SetCounter
4165                     	xdef	_TIM2_SelectOCxM
4166                     	xdef	_TIM2_CCxCmd
4167                     	xdef	_TIM2_OC3PolarityConfig
4168                     	xdef	_TIM2_OC2PolarityConfig
4169                     	xdef	_TIM2_OC1PolarityConfig
4170                     	xdef	_TIM2_GenerateEvent
4171                     	xdef	_TIM2_OC3PreloadConfig
4172                     	xdef	_TIM2_OC2PreloadConfig
4173                     	xdef	_TIM2_OC1PreloadConfig
4174                     	xdef	_TIM2_ARRPreloadConfig
4175                     	xdef	_TIM2_ForcedOC3Config
4176                     	xdef	_TIM2_ForcedOC2Config
4177                     	xdef	_TIM2_ForcedOC1Config
4178                     	xdef	_TIM2_PrescalerConfig
4179                     	xdef	_TIM2_SelectOnePulseMode
4180                     	xdef	_TIM2_UpdateRequestConfig
4181                     	xdef	_TIM2_UpdateDisableConfig
4182                     	xdef	_TIM2_ITConfig
4183                     	xdef	_TIM2_Cmd
4184                     	xdef	_TIM2_PWMIConfig
4185                     	xdef	_TIM2_ICInit
4186                     	xdef	_TIM2_OC3Init
4187                     	xdef	_TIM2_OC2Init
4188                     	xdef	_TIM2_OC1Init
4189                     	xdef	_TIM2_TimeBaseInit
4190                     	xdef	_TIM2_DeInit
4209                     	end
