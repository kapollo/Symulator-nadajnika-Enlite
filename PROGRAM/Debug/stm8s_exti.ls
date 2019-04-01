   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  42                     ; 53 void EXTI_DeInit(void)
  42                     ; 54 {
  44                     	switch	.text
  45  0000               _EXTI_DeInit:
  49                     ; 55   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  51  0000 725f50a0      	clr	20640
  52                     ; 56   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  54  0004 725f50a1      	clr	20641
  55                     ; 57 }
  58  0008 81            	ret
 183                     ; 70 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 183                     ; 71 {
 184                     	switch	.text
 185  0009               _EXTI_SetExtIntSensitivity:
 187  0009 89            	pushw	x
 188       00000000      OFST:	set	0
 191                     ; 77   switch (Port)
 193  000a 9e            	ld	a,xh
 195                     ; 99   default:
 195                     ; 100     break;
 196  000b 4d            	tnz	a
 197  000c 270e          	jreq	L12
 198  000e 4a            	dec	a
 199  000f 271d          	jreq	L32
 200  0011 4a            	dec	a
 201  0012 272e          	jreq	L52
 202  0014 4a            	dec	a
 203  0015 2742          	jreq	L72
 204  0017 4a            	dec	a
 205  0018 2756          	jreq	L13
 206  001a 2064          	jra	L311
 207  001c               L12:
 208                     ; 79   case EXTI_PORT_GPIOA:
 208                     ; 80     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 210  001c c650a0        	ld	a,20640
 211  001f a4fc          	and	a,#252
 212  0021 c750a0        	ld	20640,a
 213                     ; 81     EXTI->CR1 |= (uint8_t)(SensitivityValue);
 215  0024 c650a0        	ld	a,20640
 216  0027 1a02          	or	a,(OFST+2,sp)
 217  0029 c750a0        	ld	20640,a
 218                     ; 82     break;
 220  002c 2052          	jra	L311
 221  002e               L32:
 222                     ; 83   case EXTI_PORT_GPIOB:
 222                     ; 84     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 224  002e c650a0        	ld	a,20640
 225  0031 a4f3          	and	a,#243
 226  0033 c750a0        	ld	20640,a
 227                     ; 85     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 229  0036 7b02          	ld	a,(OFST+2,sp)
 230  0038 48            	sll	a
 231  0039 48            	sll	a
 232  003a ca50a0        	or	a,20640
 233  003d c750a0        	ld	20640,a
 234                     ; 86     break;
 236  0040 203e          	jra	L311
 237  0042               L52:
 238                     ; 87   case EXTI_PORT_GPIOC:
 238                     ; 88     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 240  0042 c650a0        	ld	a,20640
 241  0045 a4cf          	and	a,#207
 242  0047 c750a0        	ld	20640,a
 243                     ; 89     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 245  004a 7b02          	ld	a,(OFST+2,sp)
 246  004c 97            	ld	xl,a
 247  004d a610          	ld	a,#16
 248  004f 42            	mul	x,a
 249  0050 9f            	ld	a,xl
 250  0051 ca50a0        	or	a,20640
 251  0054 c750a0        	ld	20640,a
 252                     ; 90     break;
 254  0057 2027          	jra	L311
 255  0059               L72:
 256                     ; 91   case EXTI_PORT_GPIOD:
 256                     ; 92     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 258  0059 c650a0        	ld	a,20640
 259  005c a43f          	and	a,#63
 260  005e c750a0        	ld	20640,a
 261                     ; 93     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 263  0061 7b02          	ld	a,(OFST+2,sp)
 264  0063 97            	ld	xl,a
 265  0064 a640          	ld	a,#64
 266  0066 42            	mul	x,a
 267  0067 9f            	ld	a,xl
 268  0068 ca50a0        	or	a,20640
 269  006b c750a0        	ld	20640,a
 270                     ; 94     break;
 272  006e 2010          	jra	L311
 273  0070               L13:
 274                     ; 95   case EXTI_PORT_GPIOE:
 274                     ; 96     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 276  0070 c650a1        	ld	a,20641
 277  0073 a4fc          	and	a,#252
 278  0075 c750a1        	ld	20641,a
 279                     ; 97     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 281  0078 c650a1        	ld	a,20641
 282  007b 1a02          	or	a,(OFST+2,sp)
 283  007d c750a1        	ld	20641,a
 284                     ; 98     break;
 286  0080               L33:
 287                     ; 99   default:
 287                     ; 100     break;
 289  0080               L311:
 290                     ; 102 }
 293  0080 85            	popw	x
 294  0081 81            	ret
 352                     ; 111 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 352                     ; 112 {
 353                     	switch	.text
 354  0082               _EXTI_SetTLISensitivity:
 358                     ; 117   EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 360  0082 721550a1      	bres	20641,#2
 361                     ; 118   EXTI->CR2 |= (uint8_t)(SensitivityValue);
 363  0086 ca50a1        	or	a,20641
 364  0089 c750a1        	ld	20641,a
 365                     ; 119 }
 368  008c 81            	ret
 414                     ; 126 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 414                     ; 127 {
 415                     	switch	.text
 416  008d               _EXTI_GetExtIntSensitivity:
 418  008d 88            	push	a
 419       00000001      OFST:	set	1
 422                     ; 128   uint8_t value = 0;
 424  008e 0f01          	clr	(OFST+0,sp)
 426                     ; 133   switch (Port)
 429                     ; 150   default:
 429                     ; 151     break;
 430  0090 4d            	tnz	a
 431  0091 270e          	jreq	L341
 432  0093 4a            	dec	a
 433  0094 2714          	jreq	L541
 434  0096 4a            	dec	a
 435  0097 271c          	jreq	L741
 436  0099 4a            	dec	a
 437  009a 2725          	jreq	L151
 438  009c 4a            	dec	a
 439  009d 2730          	jreq	L351
 440  009f 2035          	jra	L302
 441  00a1               L341:
 442                     ; 135   case EXTI_PORT_GPIOA:
 442                     ; 136     value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 444  00a1 c650a0        	ld	a,20640
 445  00a4 a403          	and	a,#3
 446  00a6 6b01          	ld	(OFST+0,sp),a
 448                     ; 137     break;
 450  00a8 202c          	jra	L302
 451  00aa               L541:
 452                     ; 138   case EXTI_PORT_GPIOB:
 452                     ; 139     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 454  00aa c650a0        	ld	a,20640
 455  00ad a40c          	and	a,#12
 456  00af 44            	srl	a
 457  00b0 44            	srl	a
 458  00b1 6b01          	ld	(OFST+0,sp),a
 460                     ; 140     break;
 462  00b3 2021          	jra	L302
 463  00b5               L741:
 464                     ; 141   case EXTI_PORT_GPIOC:
 464                     ; 142     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 466  00b5 c650a0        	ld	a,20640
 467  00b8 a430          	and	a,#48
 468  00ba 4e            	swap	a
 469  00bb a40f          	and	a,#15
 470  00bd 6b01          	ld	(OFST+0,sp),a
 472                     ; 143     break;
 474  00bf 2015          	jra	L302
 475  00c1               L151:
 476                     ; 144   case EXTI_PORT_GPIOD:
 476                     ; 145     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 478  00c1 c650a0        	ld	a,20640
 479  00c4 a4c0          	and	a,#192
 480  00c6 4e            	swap	a
 481  00c7 44            	srl	a
 482  00c8 44            	srl	a
 483  00c9 a403          	and	a,#3
 484  00cb 6b01          	ld	(OFST+0,sp),a
 486                     ; 146     break;
 488  00cd 2007          	jra	L302
 489  00cf               L351:
 490                     ; 147   case EXTI_PORT_GPIOE:
 490                     ; 148     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 492  00cf c650a1        	ld	a,20641
 493  00d2 a403          	and	a,#3
 494  00d4 6b01          	ld	(OFST+0,sp),a
 496                     ; 149     break;
 498  00d6               L551:
 499                     ; 150   default:
 499                     ; 151     break;
 501  00d6               L302:
 502                     ; 154   return((EXTI_Sensitivity_TypeDef)value);
 504  00d6 7b01          	ld	a,(OFST+0,sp)
 507  00d8 5b01          	addw	sp,#1
 508  00da 81            	ret
 544                     ; 162 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 544                     ; 163 {
 545                     	switch	.text
 546  00db               _EXTI_GetTLISensitivity:
 548  00db 88            	push	a
 549       00000001      OFST:	set	1
 552                     ; 164   uint8_t value = 0;
 554                     ; 167   value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 556  00dc c650a1        	ld	a,20641
 557  00df a404          	and	a,#4
 558  00e1 6b01          	ld	(OFST+0,sp),a
 560                     ; 169   return((EXTI_TLISensitivity_TypeDef)value);
 562  00e3 7b01          	ld	a,(OFST+0,sp)
 565  00e5 5b01          	addw	sp,#1
 566  00e7 81            	ret
 579                     	xdef	_EXTI_GetTLISensitivity
 580                     	xdef	_EXTI_GetExtIntSensitivity
 581                     	xdef	_EXTI_SetTLISensitivity
 582                     	xdef	_EXTI_SetExtIntSensitivity
 583                     	xdef	_EXTI_DeInit
 602                     	end
