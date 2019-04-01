#ifndef __DK_RFM_h__
#define __DK_RFM_h__

#include "stm8s.h"
#include "tasks.h"

enum Transceiver_Mode
{
	TX,
	RX
};

enum RFM69H_Mode
{
	CONTINUOUS,
	PACKET
};


extern u8 gb_WaitStableFlag;
extern u8 gb_SysTimer_1S;

void RFM69H_EntryTx(u8 RFM69H_mode);
void RFM69H_EntryRx(void);
void RFM69H_Sleep(void);
void RFM69H_TxWaitStable(void);
void RFM69H_RxWaitStable(void);

#endif







