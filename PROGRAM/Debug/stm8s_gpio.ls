   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
 108                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 108                     ; 54 {
 110                     	switch	.text
 111  0000               _GPIO_DeInit:
 115                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 117  0000 7f            	clr	(x)
 118                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 120  0001 6f02          	clr	(2,x)
 121                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 123  0003 6f03          	clr	(3,x)
 124                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 126  0005 6f04          	clr	(4,x)
 127                     ; 59 }
 130  0007 81            	ret
 370                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 370                     ; 72 {
 371                     	switch	.text
 372  0008               _GPIO_Init:
 374  0008 89            	pushw	x
 375       00000000      OFST:	set	0
 378                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 380  0009 7b05          	ld	a,(OFST+5,sp)
 381  000b 43            	cpl	a
 382  000c e404          	and	a,(4,x)
 383  000e e704          	ld	(4,x),a
 384                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 386  0010 7b06          	ld	a,(OFST+6,sp)
 387  0012 a580          	bcp	a,#128
 388  0014 271d          	jreq	L771
 389                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 391  0016 7b06          	ld	a,(OFST+6,sp)
 392  0018 a510          	bcp	a,#16
 393  001a 2706          	jreq	L102
 394                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 396  001c f6            	ld	a,(x)
 397  001d 1a05          	or	a,(OFST+5,sp)
 398  001f f7            	ld	(x),a
 400  0020 2007          	jra	L302
 401  0022               L102:
 402                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 404  0022 1e01          	ldw	x,(OFST+1,sp)
 405  0024 7b05          	ld	a,(OFST+5,sp)
 406  0026 43            	cpl	a
 407  0027 f4            	and	a,(x)
 408  0028 f7            	ld	(x),a
 409  0029               L302:
 410                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 412  0029 1e01          	ldw	x,(OFST+1,sp)
 413  002b e602          	ld	a,(2,x)
 414  002d 1a05          	or	a,(OFST+5,sp)
 415  002f e702          	ld	(2,x),a
 417  0031 2009          	jra	L502
 418  0033               L771:
 419                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 421  0033 1e01          	ldw	x,(OFST+1,sp)
 422  0035 7b05          	ld	a,(OFST+5,sp)
 423  0037 43            	cpl	a
 424  0038 e402          	and	a,(2,x)
 425  003a e702          	ld	(2,x),a
 426  003c               L502:
 427                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 429  003c 7b06          	ld	a,(OFST+6,sp)
 430  003e a540          	bcp	a,#64
 431  0040 270a          	jreq	L702
 432                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 434  0042 1e01          	ldw	x,(OFST+1,sp)
 435  0044 e603          	ld	a,(3,x)
 436  0046 1a05          	or	a,(OFST+5,sp)
 437  0048 e703          	ld	(3,x),a
 439  004a 2009          	jra	L112
 440  004c               L702:
 441                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 443  004c 1e01          	ldw	x,(OFST+1,sp)
 444  004e 7b05          	ld	a,(OFST+5,sp)
 445  0050 43            	cpl	a
 446  0051 e403          	and	a,(3,x)
 447  0053 e703          	ld	(3,x),a
 448  0055               L112:
 449                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 451  0055 7b06          	ld	a,(OFST+6,sp)
 452  0057 a520          	bcp	a,#32
 453  0059 270a          	jreq	L312
 454                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 456  005b 1e01          	ldw	x,(OFST+1,sp)
 457  005d e604          	ld	a,(4,x)
 458  005f 1a05          	or	a,(OFST+5,sp)
 459  0061 e704          	ld	(4,x),a
 461  0063 2009          	jra	L512
 462  0065               L312:
 463                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 465  0065 1e01          	ldw	x,(OFST+1,sp)
 466  0067 7b05          	ld	a,(OFST+5,sp)
 467  0069 43            	cpl	a
 468  006a e404          	and	a,(4,x)
 469  006c e704          	ld	(4,x),a
 470  006e               L512:
 471                     ; 131 }
 474  006e 85            	popw	x
 475  006f 81            	ret
 521                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 521                     ; 142 {
 522                     	switch	.text
 523  0070               _GPIO_Write:
 525  0070 89            	pushw	x
 526       00000000      OFST:	set	0
 529                     ; 143   GPIOx->ODR = PortVal;
 531  0071 7b05          	ld	a,(OFST+5,sp)
 532  0073 1e01          	ldw	x,(OFST+1,sp)
 533  0075 f7            	ld	(x),a
 534                     ; 144 }
 537  0076 85            	popw	x
 538  0077 81            	ret
 585                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 585                     ; 155 {
 586                     	switch	.text
 587  0078               _GPIO_WriteHigh:
 589  0078 89            	pushw	x
 590       00000000      OFST:	set	0
 593                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 595  0079 f6            	ld	a,(x)
 596  007a 1a05          	or	a,(OFST+5,sp)
 597  007c f7            	ld	(x),a
 598                     ; 157 }
 601  007d 85            	popw	x
 602  007e 81            	ret
 649                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 649                     ; 168 {
 650                     	switch	.text
 651  007f               _GPIO_WriteLow:
 653  007f 89            	pushw	x
 654       00000000      OFST:	set	0
 657                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 659  0080 7b05          	ld	a,(OFST+5,sp)
 660  0082 43            	cpl	a
 661  0083 f4            	and	a,(x)
 662  0084 f7            	ld	(x),a
 663                     ; 170 }
 666  0085 85            	popw	x
 667  0086 81            	ret
 714                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 714                     ; 181 {
 715                     	switch	.text
 716  0087               _GPIO_WriteReverse:
 718  0087 89            	pushw	x
 719       00000000      OFST:	set	0
 722                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 724  0088 f6            	ld	a,(x)
 725  0089 1805          	xor	a,	(OFST+5,sp)
 726  008b f7            	ld	(x),a
 727                     ; 183 }
 730  008c 85            	popw	x
 731  008d 81            	ret
 769                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 769                     ; 192 {
 770                     	switch	.text
 771  008e               _GPIO_ReadOutputData:
 775                     ; 193   return ((uint8_t)GPIOx->ODR);
 777  008e f6            	ld	a,(x)
 780  008f 81            	ret
 817                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 817                     ; 203 {
 818                     	switch	.text
 819  0090               _GPIO_ReadInputData:
 823                     ; 204   return ((uint8_t)GPIOx->IDR);
 825  0090 e601          	ld	a,(1,x)
 828  0092 81            	ret
 896                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 896                     ; 214 {
 897                     	switch	.text
 898  0093               _GPIO_ReadInputPin:
 900  0093 89            	pushw	x
 901       00000000      OFST:	set	0
 904                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 906  0094 e601          	ld	a,(1,x)
 907  0096 1405          	and	a,(OFST+5,sp)
 910  0098 85            	popw	x
 911  0099 81            	ret
 989                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 989                     ; 226 {
 990                     	switch	.text
 991  009a               _GPIO_ExternalPullUpConfig:
 993  009a 89            	pushw	x
 994       00000000      OFST:	set	0
 997                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
 999  009b 0d06          	tnz	(OFST+6,sp)
1000  009d 2708          	jreq	L374
1001                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1003  009f e603          	ld	a,(3,x)
1004  00a1 1a05          	or	a,(OFST+5,sp)
1005  00a3 e703          	ld	(3,x),a
1007  00a5 2009          	jra	L574
1008  00a7               L374:
1009                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1011  00a7 1e01          	ldw	x,(OFST+1,sp)
1012  00a9 7b05          	ld	a,(OFST+5,sp)
1013  00ab 43            	cpl	a
1014  00ac e403          	and	a,(3,x)
1015  00ae e703          	ld	(3,x),a
1016  00b0               L574:
1017                     ; 238 }
1020  00b0 85            	popw	x
1021  00b1 81            	ret
1034                     	xdef	_GPIO_ExternalPullUpConfig
1035                     	xdef	_GPIO_ReadInputPin
1036                     	xdef	_GPIO_ReadOutputData
1037                     	xdef	_GPIO_ReadInputData
1038                     	xdef	_GPIO_WriteReverse
1039                     	xdef	_GPIO_WriteLow
1040                     	xdef	_GPIO_WriteHigh
1041                     	xdef	_GPIO_Write
1042                     	xdef	_GPIO_Init
1043                     	xdef	_GPIO_DeInit
1062                     	end
