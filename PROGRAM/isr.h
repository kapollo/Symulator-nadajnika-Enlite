#ifndef ISR_H
#define ISR_H

#include "stm8s.h"

// nie wykorzystuj� INTERRUPT void TLI_ISR(void); 
INTERRUPT void EXTI2_ISR(void);
INTERRUPT void EXTI1_ISR(void);
INTERRUPT void TIM2_update_overflowISR(void);  


#endif