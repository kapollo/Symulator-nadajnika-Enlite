// ========================================================
/// @file       DK_RFM69H.c
/// @brief      RFM69H basic application
/// @version    V2.1
/// @date       2013/12/25
/// @company    HOPE MICROELECTRONICS Co., Ltd.
/// @website    http://www.hoperf.com
/// @author     Geman Deng
/// @mobile     +86-013244720618
/// @tel        0755-82973805 Ext:846
// ========================================================
#include "DK_RFM.h"

/************************Description************************
                      ________________
                     /                \
                    /      HOPERF      \
                   /____________________\
                  |      DK_RFM69H       |
    (MCU)DIO1 --- | DIO4             GND | --- GND
    (MCU)DIO0 --- | DIO3              A7 | --- 
  (MCU)RFData --- | DIO2              A6 | ---  
   (MCU)nIRQ1 --- | DIO1              A5 | --- 
   (MCU)nIRQ0 --- | DIO0              A4 | --- 
    (MCU)MISO --- | MISO              A3 | --- 
    (MCU)MOSI --- | MOSI              A2 | --- 
     (MCU)SCK --- | SCK               A1 | --- 
     (MCU)nCS --- | NSS               A0 | --- 
  (MCU)PORChk --- | RESET            VCC | --- VCC             
                  |______________________|
                  
                  

//  RF module:           RFM69H
//  Carry Frequency:     315MHz/434MHz/868MHz/915MHz
//  Bit Rate:            1.2Kbps/2.4Kbps/4.8Kbps/9.6Kbps
//  Tx Power Output:     20dbm/17dbm/14dbm/11dbm
//  Frequency Deviation: +/-35KHz
//  Receive Bandwidth:   83KHz
//  Coding:              NRZ
//  Packet Format:       0x5555555555+0xAA2DD4+"HopeRF RFM COBRFM69HS" (total: 29 Bytes)
//  Tx Current:          about 130mA  (RFOP=+20dBm,typ.)
//  Rx Current:          about 16mA  (typ.)                 
**********************************************************/


/**********************************************************
**Parameter table define
**********************************************************/
const u16 RFM69HFreqTbl[4][3] = 
{ 
  {0x074e, 0x08c0, 0x0900}, //315MHz
  {0x076c, 0x0880, 0x0900}, //434MHz
  {0x07d9, 0x0816, 0x0966}, //868MHz
  {0x07e4, 0x08c0, 0x0900}, //915MHz
};

const u16 RFM69HRateTbl[5][2] = 
{
  {0x0368, 0x042B},         //BR=1.2K BW=83.333K
  {0x0334, 0x0415},         //BR=2.4K BW=83.333K  
  {0x031A, 0x040B},         //BR=4.8K BW=83.333K
  {0x030D, 0x0405},         //BR=9.6K BW=83.333K
	{0x0307, 0x04A1}					//BR = 16384 b/s
};

const u16 RFM69HPowerTbl[] = 
{
  0x117F,                   //20dbm  PA1 and PA2 combined on pin PA_BOOST
  0x117C,                   //17dbm	PA1 and PA2 combined on pin PA_BOOST
  0x1179,                   //14dbm	PA1 and PA2 combined on pin PA_BOOST
  0x1176,                   //11dbm 	PA1 and PA2 combined on pin PA_BOOST
	0x115F										//13dbm output PA1 
};

const u16 RFM69HConfigTblTx[] = 
{ 
  0x0208,                   //RegDataModul, OOK Packet Mode, no shaping
  0x0502,                   //RegFdevMsb, 0x241*61Hz = 35KHz  
  0x0641,                   //RegFdevLsb (na razie zostawiam 35kHz frequency deviation)
  //0x1952,      nie u¿ywam receivera             //RegRxBw , RxBW, 83KHz
  
  0x2C00,                   //RegPreambleMsb  
  0x2D10,                   //RegPreambleLsb, 16Byte Preamble
	0x2E98,                   //enable Sync.Word, 3+1=4bytes
  0x2FFF,                   //0xFF, SyncWord = FF00FF00
  0x3000,                   //0x00
  0x31FF,                   //0xFF
	0x3200,										//0x00

  0x3700,                   //RegPacketConfig1, Disable CRC-NRZ encode, fixed length packet format
  0x3834,                   //RegPayloadLength, 52bytes for length & Fixed length 
  0x3C33,                   /*RegFiFoThresh (TXstartCondition - the number of bytes in the FIFO exceeds FifoThreshold; 
															start TX po wpisaniu 51 bajtów do FIFO, powinno wyst¹piæ przerwanie FIFO level na DIO1) */
  //0x1888,      nie u¿ywam receivera             //RegLNA, 200R  
  //0x581B,      nie u¿ywam receivera             //RegTestLna, Normal sensitivity
  //0x582D,                   //RegTestLna, increase sensitivity with LNA (Note: consumption also increase!)
  0x6F30,                   //RegTestDAGC, Improved DAGC
  //0x6F00,                   //RegTestDAGC, Normal DAGC
  0x0104                   //Enter standby mode    
};


const u16 RFM69HConfigTblTx_ContMode[] = 
{ 
  0x0248,                   //RegDataModul, OOK Continuous Mode with bit synchronizer, no shaping
  0x0502,                   //RegFdevMsb, 241*61Hz = 35KHz  
  0x0641,                   //RegFdevLsb (na razie zostawiam 35kHz frequency deviation)
  0x2E00,                   //disable Sync.Word,
  0x3700,                   //RegPacketConfig1, Disable CRC-NRZ encode
  0x6F30,                   //RegTestDAGC, Improved DAGC
  0x0104                   //Enter standby mode    
};


const u16 RFM69HConfigTblRx[] = 
{ 
  0x0208,                   //RegDataModul, OOK Packet Mode, no shaping
  0x0502,                   //RegFdevMsb, 0x241*61Hz = 35KHz  
  0x0641,                   //RegFdevLsb (na razie zostawiam 35kHz frequency deviation)
  0x1949,                   //RegRxBw , RxBW, 100KHz

	0x2C00,                   //RegPreambleMsb  
  0x2D10,                   //RegPreambleLsb, 16Byte Preamble
	0x2E98,                   //enable Sync.Word, 3+1=4bytes
  0x2FFF,                   //0xFF, SyncWord = FF00FF00
  0x3000,                   //0x00
  0x31FF,                   //0xFF
	0x3200,										//0x00

	0x3700,										//RegPacketConfig1, Disable CRC-NRZ encode, fixed length packet format
//  0x3780,                   //RegPacketConfig1, Disable CRC-NRZ encode, variable length packet format
	0x3800,											//unlimited packet length
//  0x38FF,                   //RegPayloadLength, 255bytes for length & Variable length 
  0x3C40,                   /*RegFiFoThresh (TXstartCondition - the number of bytes in the FIFO exceeds FifoThreshold; 
															powinno wyst¹piæ przerwanie FIFO level na DIO1 po wype³nieniu 64 bajtów FIFO ) */
  0x1888,                   //RegLNA, 200R  
  0x581B,                   //RegTestLna, Normal sensitivity
  //0x582D,                   //RegTestLna, increase sensitivity with LNA (Note: consumption also increase!)
  //0x6F30,                   //RegTestDAGC, Improved DAGC
  0x6F00,                   //RegTestDAGC, Normal DAGC
  0x0104                   //Enter standby mode    
};



const u16 RFM69HRxTbl[6] = 
{   
  0x119F,                   //default value for Power Amplifier (??????)
  0x2540,                   //DIO Mapping for Rx, DIO1 - Fifo_Level; DIO0 - Payload_Ready; DIO2 - FIFO_Not_Empty
  0x1310,                   //OCP enabled
  0x5A55,                   //Normal and Rx
  0x5C70,                   //Normal and Rx   
  0x0110                    //Enter Rx mode
};         
    
const u16 RFM69HTxTbl[5] = 
{
  0x2500,                   //DIOxMMapping for Tx, DIO1 - Fifo_Level; DIO0 - Packet_Sent
  0x130F,                   //Disable OCP
  0x5A55,                   //Normal power mode at PA0
  0x5C70,                   //Normal power mode at PA0
  0x010C                   //Enter Tx mode
};

const u8  RFM69HData[] = {"HopeRF RFM COBRFM69HS"};
const u8 gb_RateBuf_Addr = 4; //wybór bitrate 16384 b/s
const u8 gb_FreqBuf_Addr = 2; //wybór f_noœnej 868MHz
const u8 gb_PowerBuf_Addr = 4; //moc nadajnika 13dbm z PA1


/**********************************************************
**Variable define
**********************************************************/
u8 gb_WaitStableFlag = 0;                                    //State stable flag
u8 gb_ErrorFlag = 0; //dopisa³em
u8 gb_SysTimer_1S = 0; //dopisa³em
u8 gb_StatusRx = 0; //dopisa³em
u8 nIRQ0 = 0; //dopisa³em
u8 gb_StatusTx = 0; //dopisa³em
u8 gw_RF_SentInterval = 0; //dopisa³em
u8 gw_TxTimer = 0; //dopisa³em
u8 RFData = 0; //dopisa³em




/**********************************************************
**Name:     RFM69H_Config
**Function: Initialize RFM69H & set it entry to standby mode
**Input:    transceiver mode selector (can be TX or RX)
						RFM69H mode selector (can be PACKET or CONTINUOUS)
**Output:   none
**********************************************************/
void RFM69H_Config(u8 transceiver_mode, u8 RFM69H_mode)
{
  u8 i;
  
	for(i = 0; i < 3; i++)
	{
    RFM69H_SPI_write(RFM69HFreqTbl[gb_FreqBuf_Addr][i]);           //setting frequency parameter
		for (system_tick = 0; system_tick < 1;); //zaczekanie 1 ms
	}
  for(i = 0; i < 2; i++)
	{
    RFM69H_SPI_write(RFM69HRateTbl[gb_RateBuf_Addr][i]);           //setting rf rate parameter
		for (system_tick = 0; system_tick < 1;); //zaczekanie 1 ms
	}
  switch (transceiver_mode)
	{
		case TX:switch (RFM69H_mode)
						{
							case CONTINUOUS:
													for(i = 0; i < (sizeof(RFM69HConfigTblTx_ContMode) / sizeof(&RFM69HConfigTblTx_ContMode[0])); i++)
													{
														RFM69H_SPI_write(RFM69HConfigTblTx_ContMode[i]);                          //setting base parameter
														for (system_tick = 0; system_tick < 1;); //zaczekanie 1 ms
													}
													break;
							case PACKET:
													for(i = 0; i < (sizeof(RFM69HConfigTblTx) / sizeof(&RFM69HConfigTblTx[0])); i++)
													{
														RFM69H_SPI_write(RFM69HConfigTblTx[i]);                          //setting base parameter
														for (system_tick = 0; system_tick < 1;); //zaczekanie 1 ms
													}
													break;
						}
						break;
		case RX:
						for(i = 0; i < (sizeof(RFM69HConfigTblRx) / sizeof(&RFM69HConfigTblRx[0])); i++)
						{
							RFM69H_SPI_write(RFM69HConfigTblRx[i]);                          //setting base parameter
							for (system_tick = 0; system_tick < 1;); //zaczekanie 1 ms
						}
						break;
	}
}
/**********************************************************
**Name:     RFM69H_EntryRx
**Function: Set RFM69H entry Rx_mode
**Input:    None
**Output:   "0" for Error Status
**********************************************************/
void RFM69H_EntryRx(void)
{
  u8 i; 
  RFM69H_Config(RX, PACKET);                                         //Module parameter setting
  
  for(i = 0; i < (sizeof(RFM69HRxTbl) / sizeof(&RFM69HRxTbl[0])); i++)                         //Define to Rx mode  
	{
    RFM69H_SPI_write(RFM69HRxTbl[i]);
		for (system_tick = 0; system_tick < 1;); //zaczekanie 1 ms
	}
  
  gb_SysTimer_1S=3;                                        //System time = 3S
//  gb_StatusTx=0;                                           //Clear Tx status flag 
  gb_WaitStableFlag=0x0f;                                  //State stable flag initial
}

/**********************************************************
**Name:     RFM69H_EntryTx
**Function: Set RFM69H entry Tx_mode
**Input:	  RFM69H_mode - can be Continuous or Packet
**Output:   "0" for Error Status
**********************************************************/
void RFM69H_EntryTx(u8 RFM69H_mode)
{
  u8 i;
  RFM69H_Config(TX, RFM69H_mode);                                         //Module parameter setting  
  RFM69H_SPI_write(RFM69HPowerTbl[gb_PowerBuf_Addr]);              //Setting output power parameter
	for (system_tick = 0; system_tick < 1;); //zaczekanie 1 ms
	for(i = 0; i < (sizeof(RFM69HTxTbl) / sizeof(&RFM69HTxTbl[0])); i++)                         //Define to Tx mode  
	{
		RFM69H_SPI_write(RFM69HTxTbl[i]);
		for (system_tick = 0; system_tick < 1;); //zaczekanie 1 ms
	}
  gb_SysTimer_1S = 3;                                        //System time = 3S
//  gb_StatusRx=0;                                           //Clear Rx status flag 
  gb_WaitStableFlag = 0x0f;                                  //State stable flag initial
}

/**********************************************************
**Name:     RFM69H_TxWaitStable
**Function: Determine whether the state of stable Tx
**Input:    none
**Output:   none
**********************************************************/
void RFM69H_TxWaitStable(void)
{ 
  u8 temp = 0;
  if(gb_WaitStableFlag == 0x0f) 
  {
    if(gb_SysTimer_1S != 0)
    {
      temp = RFM69H_SPI_read(0x27);
      if (((temp & 0xA0) == 0xA0) && (temp != 0xff))
      {
        gb_WaitStableFlag = 1; 
      }
    }
    else
    {
      gb_ErrorFlag = 1;
      gb_WaitStableFlag = 0;
    }
  }
}

/**********************************************************
**Name:     RFM69H_RxWaitStable
**Function: Determine whether the state of stable Rx
**Input:    none
**Output:   none
**********************************************************/
void RFM69H_RxWaitStable(void)
{ 
  u8 temp=0;
  if(gb_WaitStableFlag == 0x0f) 
  {
    if(gb_SysTimer_1S != 0)
    {
      temp = RFM69H_SPI_read(0x27);
      if (((temp & 0xC0) == 0xC0) && (temp != 0xff))
      {
        gb_WaitStableFlag = 1;        
      }
    }
    else
    {
      gb_ErrorFlag = 1;
      gb_WaitStableFlag = 0;
    }
  }
}

/**********************************************************
**Name:     RFM69H_ClearFIFO
**Function: Change to RxMode from StandbyMode, can clear FIFO buffer
**Input:    None
**Output:   None
**********************************************************/
void RFM69H_ClearFIFO(void)
{
  RFM69H_SPI_write(0x0104);                                        //Standby
  RFM69H_SPI_write(0x0110);                                        //entry RxMode
}

/**********************************************************
**Name:     RFM69H_Sleep
**Function: Set RFM69H to sleep mode 
**Input:    none
**Output:   none
**********************************************************/
void RFM69H_Sleep(void)
{
  RFM69H_SPI_write(0x0100);                                        //Sleep
}

/**********************************************************
**Name:     RFM69H_Standby
**Function: Set RFM69H to Standby mode
**Input:    none
**Output:   none
**********************************************************/
void RFM69H_Standby(void)
{
  RFM69H_SPI_write(0x0104);                                        //Standby
}

/**********************************************************
**Name:     RFM69H_ReadRSSI
**Function: Read the RSSI value
**Input:    none
**Output:   temp, RSSI value
**********************************************************/
u8 RFM69H_ReadRSSI(void)
{
  u16 temp=0xff;
  if((RFM69H_SPI_read(0x24) & 0x02) == 0x02)
  {
    temp = RFM69H_SPI_read(0x24);
    temp = 0xff - temp;
    temp >>= 1;
    temp &= 0xff;
  }
  return (u8)temp;
}

/**********************************************************
**Name:     RFM69H_RxPacket
**Function: Check for receive one packet
**Input:    none
**Output:   "!0"-----Receive one packet
**          "0"------Nothing for receive
**********************************************************/
u8 RFM69H_RxPacket(void)
{
  u8 i; 
  u8 gb_RxData[21]; //dopisa³em
 
  RFM69H_RxWaitStable();
  if(gb_WaitStableFlag == 1)
  {
    gb_WaitStableFlag = 2;
    gb_StatusRx = 1;                                         //Rx state stable
  }       
 
  if((nIRQ0 == 1) && (gb_StatusRx == 1))
  {
    for(i = 0; i < 21; i++) 
      gb_RxData[i] = 0x00;   
    //SPIBurstRead(0x00, gb_RxData, 21);  mo¿e w pêtli zrobiæ odczyt
    RFM69H_ClearFIFO();    
    for(i = 0; i < 14; i++)
    {
      if(gb_RxData[i] != RFM69HData[i])
        break;  
    }
    if(i >= 14)   
      return(1);                                           //Rx success
    else
      return(0);
  }
  else
    return(0);
}

/**********************************************************
**Name:     RFM69H_TxPacket
**Function: Check RFM69H send over & send next packet
**Input:    none
**Output:   TxFlag=1, Send success
**********************************************************/
u8 RFM69H_TxPacket(void)
{
  u8 TxFlag=0;
  
  RFM69H_TxWaitStable();
  if(gb_WaitStableFlag == 1)
  {
    gb_WaitStableFlag = 2;
    if(gb_StatusTx == 0)                                     //First entry Tx mode
    {
      gb_StatusTx = 1;                                       //Rx state stable                        
      gw_TxTimer = gw_RF_SentInterval;                       //Send time interval
      //BurstWrite(0x00, (u8 *)RFM69HData, 21);  mo¿e zrobiæ w pêtli            //Send one packet data 
      TxFlag = 1;
      gb_WaitStableFlag = 3;
    }
  }
  if(gb_StatusTx == 1)
  {
    if(gb_WaitStableFlag == 3 && nIRQ0 == 1)                   //Packet send over
    {
      gb_WaitStableFlag = 0;
      RFM69H_Standby();                                    //Entry Standby mode
    }   
    if(gw_TxTimer == 0)                                      //It's time to Sending
    {
      gw_TxTimer = gw_RF_SentInterval;                       //Send time interval
      gb_SysTimer_1S = 3;
      gb_WaitStableFlag = 0x0f;                              //Promised to call mode stable decide
      RFM69H_SPI_write(0x010C);                              //Entry Tx mode
    }
    if(gb_WaitStableFlag == 2)                               //Mode stable
    {
      //BurstWrite(0x00, (u8 *)RFM69HData, 21); mo¿e zrobiæ w pêtli             //Send data
      TxFlag = 1;
      gb_WaitStableFlag = 3;
    }
  }
  return TxFlag;
}

/**********************************************************
**Parameter table define in test mode
**********************************************************/
const u16 RFM69HTestConfigTbl[12] = 
{ 
  0x0248,                   //RegDataModul, OOK
  0x0502,                   //RegFdevMsb, 241*61Hz = 35KHz  
  0x0641,                   //RegFdevLsb
  0x1952,                   //RegRxBw , RxBW, 83KHz
  0x1888,                   //RegLNA, 200R  
  0x2C00,                   //RegPreambleMsb  
  0x2D00,                   //RegPreambleLsb, 0Byte Preamble
  0x2E00,                   //Disable Sync
  0x3700,                   //RegPacketConfig1, Disable CRC£¬NRZ encode
  0x581B,                   //RegTestLna, Normal sensitivity
  0x6F30,                   //RegTestDAGC
  0x0104                    //Enter standby mode  
};

/**********************************************************
**Name:     RFM69H_TestConfig
**Function: Initialize RFM69H in test mode & set it entry to standby mode
**Input:    none
**Output:   none
**********************************************************/
void RFM69H_TestConfig(void)
{
  u8 i;
  for(i = 0; i < 3; i++)                      
    RFM69H_SPI_write(RFM69HFreqTbl[gb_FreqBuf_Addr][i]);           //setting frequency parameter
  for(i = 0; i < 2; i++)
    RFM69H_SPI_write(RFM69HRateTbl[gb_RateBuf_Addr][i]);           //setting rf rate parameter
  for(i = 0; i < 12; i++)
    RFM69H_SPI_write(RFM69HTestConfigTbl[i]);                      //setting base parameter
}

/**********************************************************
**Name:     RFM69H_EntryTestRx
**Function: Set RFM69H entry Rx test mode
**Input:    None
**Output:   None
**********************************************************/
void RFM69H_EntryTestRx(void)
{
  u8 i;
//  Input_RFData(); //sterowanie pinem DIO2 ??????????
  RFM69H_Config(RX, PACKET);                                         //Module parameter setting
  for(i = 0; i < 6;i++)                                         //Define to Rx mode  
    RFM69H_SPI_write(RFM69HRxTbl[i]);
  
  gb_SysTimer_1S = 3;                                        //System time = 3S
  gb_StatusTx = 0;                                           //Clear Tx status flag 
  gb_WaitStableFlag = 0x0f;                                  //State stable flag initial
}

/**********************************************************
**Name:     RFM69H_EntryTestTx
**Function: Set RFM69H entry Tx test mode
**Input:    None
**Output:   None
**********************************************************/
void RFM69H_EntryTestTx(void)
{
  u8 i;
  
//  Output_RFData();     sterowanie pinem DIO2 ??????????              //DIO2=0                                 
  RFData = 0;
  RFM69H_TestConfig();
  RFM69H_SPI_write(RFM69HPowerTbl[gb_PowerBuf_Addr]);              //Setting output power parameter
  for(i = 0; i < 5; i++)                                         //Define to Tx mode  
    RFM69H_SPI_write(RFM69HTxTbl[i]);
    
  gb_SysTimer_1S = 3;                                        //System time = 3S
  gb_StatusRx = 0;                                           //Clear Rx status flag 
  gb_WaitStableFlag = 0x0f;                                  //State stable flag initial
}

/**********************************************************
**Name:     RFM69H_TestRx
**Function: RFM69H Rx test mode
**Input:    None
**Output:   "0" for Error Status
**********************************************************/
void RFM69H_TestRx(void)
{
  RFM69H_RxWaitStable();
  if(gb_WaitStableFlag==1)
  {
    gb_WaitStableFlag=2;
    gb_StatusRx=1;    
  }
}

/**********************************************************
**Name:     RFM69H_TestTx
**Function: RFM69H Tx test mode
**Input:    None
**Output:   "0" for Error Status
**********************************************************/
void RFM69H_TestTx(void)
{ 
  RFM69H_TxWaitStable();
  if(gb_WaitStableFlag==1)
  {
    gb_WaitStableFlag=2;
    gb_StatusTx=1;  
                                        
    RFData=1;                                              //DIO2=1
  }
}


u8 gb_WorkmodeBackup=0;
/**********************************************************
**Name:     RFM69H_Running
**Function: RFM69H running function
**Input:    mode, work mode(FS-T,FS-R,T-T,T-R)
            WorkStatus, work status(normal,standby,sleep)
            ParaChangeFlag, Parameter changed when ParaChangeFlag=1
            *TxFlag, Tx success flag affect Tx count
            *RxFlag, Rx success flag affect Rx count
            *RSSI, RSSI value
**Output:   none
**********************************************************/
/*void RFM69H_Running(u8 mode,u8 WorkStatus,u8 ParaChangeFlag,u8 *TxFlag,u8 *RxFlag,u8 *RSSI)
{ 
  u8 temp;  
  if(WorkStatus==C_ModuleWorkMode_FSK)                  	 //Normal status
  {
    switch(mode)
    {
      case C_SysMode_FSKTx:                                //Normal send mode(Abbreviation:FS-T)
        if(ParaChangeFlag==1)                              //Parament changed
        {                   
          RFM69H_EntryTx();
        }         
        temp=RFM69H_TxPacket(); 
        if(temp==1){*TxFlag=1;}
        break;
      case C_SysMode_FSKRx:                                //Normal receive mode(Abbreviation:FS-R)      
        if(ParaChangeFlag==1)
        {           
          RFM69H_EntryRx();
        }
        temp=RFM69H_RxPacket(); 
        if(temp==1)
        {
          *RxFlag=1;
          BeepOn((u16*)MusicTab_RxSuccess);                //Buzzer on When received data success
        }
        
        *RSSI=RFM69H_ReadRSSI();                           //Read RSSI
        break;
      case C_SysMode_TestTx:                               //Test send mode(Abbreviation:T-T)   
        if(ParaChangeFlag==1)
        {           
          RFM69H_EntryTestTx();
        }
        RFM69H_TestTx();
        break;
      case C_SysMode_TestRx:                               //Test receive mode(Abbreviation:T-R)  
        if(ParaChangeFlag==1)
        {       
          RFM69H_EntryTestRx();
        }
        RFM69H_TestRx();
        
        *RSSI=RFM69H_ReadRSSI();                           //Read RSSI
        break;
    } 
  }
  else if(WorkStatus==C_ModuleWorkMode_Standby)            //Standby status
  {
    if(gb_WorkmodeBackup!=C_ModuleWorkMode_Standby)
    	RFM69H_Standby();
  }
  else if(WorkStatus==C_ModuleWorkMode_Sleep)              //Sleep status
  {
    if(gb_WorkmodeBackup!=C_ModuleWorkMode_Sleep)
    	RFM69H_Sleep();
  }
  gb_WorkmodeBackup=WorkStatus;
} */