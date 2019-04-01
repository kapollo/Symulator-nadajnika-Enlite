   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  62                     ; 53 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  62                     ; 54 {
  64                     	switch	.text
  65  0000               _WWDG_Init:
  67  0000 89            	pushw	x
  68       00000000      OFST:	set	0
  71                     ; 58   WWDG->WR = WWDG_WR_RESET_VALUE;
  73  0001 357f50d2      	mov	20690,#127
  74                     ; 59   WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
  76  0005 9e            	ld	a,xh
  77  0006 aac0          	or	a,#192
  78  0008 c750d1        	ld	20689,a
  79                     ; 60   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
  81  000b 7b02          	ld	a,(OFST+2,sp)
  82  000d aa40          	or	a,#64
  83  000f a47f          	and	a,#127
  84  0011 c750d2        	ld	20690,a
  85                     ; 61 }
  88  0014 85            	popw	x
  89  0015 81            	ret
 123                     ; 69 void WWDG_SetCounter(uint8_t Counter)
 123                     ; 70 {
 124                     	switch	.text
 125  0016               _WWDG_SetCounter:
 129                     ; 76   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 131  0016 a47f          	and	a,#127
 132  0018 c750d1        	ld	20689,a
 133                     ; 77 }
 136  001b 81            	ret
 159                     ; 86 uint8_t WWDG_GetCounter(void)
 159                     ; 87 {
 160                     	switch	.text
 161  001c               _WWDG_GetCounter:
 165                     ; 88   return(WWDG->CR);
 167  001c c650d1        	ld	a,20689
 170  001f 81            	ret
 193                     ; 96 void WWDG_SWReset(void)
 193                     ; 97 {
 194                     	switch	.text
 195  0020               _WWDG_SWReset:
 199                     ; 98   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 201  0020 358050d1      	mov	20689,#128
 202                     ; 99 }
 205  0024 81            	ret
 240                     ; 108 void WWDG_SetWindowValue(uint8_t WindowValue)
 240                     ; 109 {
 241                     	switch	.text
 242  0025               _WWDG_SetWindowValue:
 246                     ; 113   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 248  0025 aa40          	or	a,#64
 249  0027 a47f          	and	a,#127
 250  0029 c750d2        	ld	20690,a
 251                     ; 114 }
 254  002c 81            	ret
 267                     	xdef	_WWDG_SetWindowValue
 268                     	xdef	_WWDG_SWReset
 269                     	xdef	_WWDG_GetCounter
 270                     	xdef	_WWDG_SetCounter
 271                     	xdef	_WWDG_Init
 290                     	end
