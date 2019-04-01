   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  14                     .const:	section	.text
  15  0000               _marker:
  16  0000 ab            	dc.b	171
  17                     	bsct
  18  0000               _flag:
  19  0000 0f            	dc.b	15
  20  0001               _sensor_ID:
  21  0001 26            	dc.b	38
  22  0002 6b            	dc.b	107
  23  0003 2c            	dc.b	44
  24  0004               _firmware:
  25  0004 0d            	dc.b	13
  26  0005               _any_data:
  27  0005 0e            	dc.b	14
  28  0006 1e            	dc.b	30
  29  0007               _sequence:
  30  0007 00            	dc.b	0
  31  0008               _raw_data:
  32  0008 0b            	dc.b	11
  33  0009 b6            	dc.b	182
  34  000a               _inp_seq:
  35  000a 0d            	dc.b	13
  36  000b 4d            	dc.b	77
  37  000c 00            	dc.b	0
  38  000d 5c            	dc.b	92
  39  000e 5c            	dc.b	92
  40  000f ce            	dc.b	206
  41  0010 0d            	dc.b	13
  42  0011 4d            	dc.b	77
  43  0012 0d            	dc.b	13
  44  0013 4d            	dc.b	77
  45  0014 0d            	dc.b	13
  46  0015 4d            	dc.b	77
  47  0016 0d            	dc.b	13
  48  0017 4d            	dc.b	77
  49  0018 0d            	dc.b	13
  50  0019 4d            	dc.b	77
  51  001a 0d            	dc.b	13
  52  001b 4d            	dc.b	77
  53  001c 0d            	dc.b	13
  54  001d 4d            	dc.b	77
  55  001e 00            	dc.b	0
  56  001f               _inp_data_to_encode:
  57  001f 00            	dc.b	0
  58  0020 000000000000  	ds.b	31
  59  003f               _seq_to_send:
  60  003f 0000          	dc.w	0
  61                     	switch	.const
  62  0001               L3_const_table:
  63  0001 ff            	dc.b	255
  64  0002 ff            	dc.b	255
  65  0003               L5_crc16_table:
  66  0003 0000          	dc.w	0
  67  0005 1021          	dc.w	4129
  68  0007 2042          	dc.w	8258
  69  0009 3063          	dc.w	12387
  70  000b 4084          	dc.w	16516
  71  000d 50a5          	dc.w	20645
  72  000f 60c6          	dc.w	24774
  73  0011 70e7          	dc.w	28903
  74  0013 8108          	dc.w	-32504
  75  0015 9129          	dc.w	-28375
  76  0017 a14a          	dc.w	-24246
  77  0019 b16b          	dc.w	-20117
  78  001b c18c          	dc.w	-15988
  79  001d d1ad          	dc.w	-11859
  80  001f e1ce          	dc.w	-7730
  81  0021 f1ef          	dc.w	-3601
  82  0023 1231          	dc.w	4657
  83  0025 0210          	dc.w	528
  84  0027 3273          	dc.w	12915
  85  0029 2252          	dc.w	8786
  86  002b 52b5          	dc.w	21173
  87  002d 4294          	dc.w	17044
  88  002f 72f7          	dc.w	29431
  89  0031 62d6          	dc.w	25302
  90  0033 9339          	dc.w	-27847
  91  0035 8318          	dc.w	-31976
  92  0037 b37b          	dc.w	-19589
  93  0039 a35a          	dc.w	-23718
  94  003b d3bd          	dc.w	-11331
  95  003d c39c          	dc.w	-15460
  96  003f f3ff          	dc.w	-3073
  97  0041 e3de          	dc.w	-7202
  98  0043 2462          	dc.w	9314
  99  0045 3443          	dc.w	13379
 100  0047 0420          	dc.w	1056
 101  0049 1401          	dc.w	5121
 102  004b 64e6          	dc.w	25830
 103  004d 74c7          	dc.w	29895
 104  004f 44a4          	dc.w	17572
 105  0051 5485          	dc.w	21637
 106  0053 a56a          	dc.w	-23190
 107  0055 b54b          	dc.w	-19125
 108  0057 8528          	dc.w	-31448
 109  0059 9509          	dc.w	-27383
 110  005b e5ee          	dc.w	-6674
 111  005d f5cf          	dc.w	-2609
 112  005f c5ac          	dc.w	-14932
 113  0061 d58d          	dc.w	-10867
 114  0063 3653          	dc.w	13907
 115  0065 2672          	dc.w	9842
 116  0067 1611          	dc.w	5649
 117  0069 0630          	dc.w	1584
 118  006b 76d7          	dc.w	30423
 119  006d 66f6          	dc.w	26358
 120  006f 5695          	dc.w	22165
 121  0071 46b4          	dc.w	18100
 122  0073 b75b          	dc.w	-18597
 123  0075 a77a          	dc.w	-22662
 124  0077 9719          	dc.w	-26855
 125  0079 8738          	dc.w	-30920
 126  007b f7df          	dc.w	-2081
 127  007d e7fe          	dc.w	-6146
 128  007f d79d          	dc.w	-10339
 129  0081 c7bc          	dc.w	-14404
 130  0083 48c4          	dc.w	18628
 131  0085 58e5          	dc.w	22757
 132  0087 6886          	dc.w	26758
 133  0089 78a7          	dc.w	30887
 134  008b 0840          	dc.w	2112
 135  008d 1861          	dc.w	6241
 136  008f 2802          	dc.w	10242
 137  0091 3823          	dc.w	14371
 138  0093 c9cc          	dc.w	-13876
 139  0095 d9ed          	dc.w	-9747
 140  0097 e98e          	dc.w	-5746
 141  0099 f9af          	dc.w	-1617
 142  009b 8948          	dc.w	-30392
 143  009d 9969          	dc.w	-26263
 144  009f a90a          	dc.w	-22262
 145  00a1 b92b          	dc.w	-18133
 146  00a3 5af5          	dc.w	23285
 147  00a5 4ad4          	dc.w	19156
 148  00a7 7ab7          	dc.w	31415
 149  00a9 6a96          	dc.w	27286
 150  00ab 1a71          	dc.w	6769
 151  00ad 0a50          	dc.w	2640
 152  00af 3a33          	dc.w	14899
 153  00b1 2a12          	dc.w	10770
 154  00b3 dbfd          	dc.w	-9219
 155  00b5 cbdc          	dc.w	-13348
 156  00b7 fbbf          	dc.w	-1089
 157  00b9 eb9e          	dc.w	-5218
 158  00bb 9b79          	dc.w	-25735
 159  00bd 8b58          	dc.w	-29864
 160  00bf bb3b          	dc.w	-17605
 161  00c1 ab1a          	dc.w	-21734
 162  00c3 6ca6          	dc.w	27814
 163  00c5 7c87          	dc.w	31879
 164  00c7 4ce4          	dc.w	19684
 165  00c9 5cc5          	dc.w	23749
 166  00cb 2c22          	dc.w	11298
 167  00cd 3c03          	dc.w	15363
 168  00cf 0c60          	dc.w	3168
 169  00d1 1c41          	dc.w	7233
 170  00d3 edae          	dc.w	-4690
 171  00d5 fd8f          	dc.w	-625
 172  00d7 cdec          	dc.w	-12820
 173  00d9 ddcd          	dc.w	-8755
 174  00db ad2a          	dc.w	-21206
 175  00dd bd0b          	dc.w	-17141
 176  00df 8d68          	dc.w	-29336
 177  00e1 9d49          	dc.w	-25271
 178  00e3 7e97          	dc.w	32407
 179  00e5 6eb6          	dc.w	28342
 180  00e7 5ed5          	dc.w	24277
 181  00e9 4ef4          	dc.w	20212
 182  00eb 3e13          	dc.w	15891
 183  00ed 2e32          	dc.w	11826
 184  00ef 1e51          	dc.w	7761
 185  00f1 0e70          	dc.w	3696
 186  00f3 ff9f          	dc.w	-97
 187  00f5 efbe          	dc.w	-4162
 188  00f7 dfdd          	dc.w	-8227
 189  00f9 cffc          	dc.w	-12292
 190  00fb bf1b          	dc.w	-16613
 191  00fd af3a          	dc.w	-20678
 192  00ff 9f59          	dc.w	-24743
 193  0101 8f78          	dc.w	-28808
 194  0103 9188          	dc.w	-28280
 195  0105 81a9          	dc.w	-32343
 196  0107 b1ca          	dc.w	-20022
 197  0109 a1eb          	dc.w	-24085
 198  010b d10c          	dc.w	-12020
 199  010d c12d          	dc.w	-16083
 200  010f f14e          	dc.w	-3762
 201  0111 e16f          	dc.w	-7825
 202  0113 1080          	dc.w	4224
 203  0115 00a1          	dc.w	161
 204  0117 30c2          	dc.w	12482
 205  0119 20e3          	dc.w	8419
 206  011b 5004          	dc.w	20484
 207  011d 4025          	dc.w	16421
 208  011f 7046          	dc.w	28742
 209  0121 6067          	dc.w	24679
 210  0123 83b9          	dc.w	-31815
 211  0125 9398          	dc.w	-27752
 212  0127 a3fb          	dc.w	-23557
 213  0129 b3da          	dc.w	-19494
 214  012b c33d          	dc.w	-15555
 215  012d d31c          	dc.w	-11492
 216  012f e37f          	dc.w	-7297
 217  0131 f35e          	dc.w	-3234
 218  0133 02b1          	dc.w	689
 219  0135 1290          	dc.w	4752
 220  0137 22f3          	dc.w	8947
 221  0139 32d2          	dc.w	13010
 222  013b 4235          	dc.w	16949
 223  013d 5214          	dc.w	21012
 224  013f 6277          	dc.w	25207
 225  0141 7256          	dc.w	29270
 226  0143 b5ea          	dc.w	-18966
 227  0145 a5cb          	dc.w	-23093
 228  0147 95a8          	dc.w	-27224
 229  0149 8589          	dc.w	-31351
 230  014b f56e          	dc.w	-2706
 231  014d e54f          	dc.w	-6833
 232  014f d52c          	dc.w	-10964
 233  0151 c50d          	dc.w	-15091
 234  0153 34e2          	dc.w	13538
 235  0155 24c3          	dc.w	9411
 236  0157 14a0          	dc.w	5280
 237  0159 0481          	dc.w	1153
 238  015b 7466          	dc.w	29798
 239  015d 6447          	dc.w	25671
 240  015f 5424          	dc.w	21540
 241  0161 4405          	dc.w	17413
 242  0163 a7db          	dc.w	-22565
 243  0165 b7fa          	dc.w	-18438
 244  0167 8799          	dc.w	-30823
 245  0169 97b8          	dc.w	-26696
 246  016b e75f          	dc.w	-6305
 247  016d f77e          	dc.w	-2178
 248  016f c71d          	dc.w	-14563
 249  0171 d73c          	dc.w	-10436
 250  0173 26d3          	dc.w	9939
 251  0175 36f2          	dc.w	14066
 252  0177 0691          	dc.w	1681
 253  0179 16b0          	dc.w	5808
 254  017b 6657          	dc.w	26199
 255  017d 7676          	dc.w	30326
 256  017f 4615          	dc.w	17941
 257  0181 5634          	dc.w	22068
 258  0183 d94c          	dc.w	-9908
 259  0185 c96d          	dc.w	-13971
 260  0187 f90e          	dc.w	-1778
 261  0189 e92f          	dc.w	-5841
 262  018b 99c8          	dc.w	-26168
 263  018d 89e9          	dc.w	-30231
 264  018f b98a          	dc.w	-18038
 265  0191 a9ab          	dc.w	-22101
 266  0193 5844          	dc.w	22596
 267  0195 4865          	dc.w	18533
 268  0197 7806          	dc.w	30726
 269  0199 6827          	dc.w	26663
 270  019b 18c0          	dc.w	6336
 271  019d 08e1          	dc.w	2273
 272  019f 3882          	dc.w	14466
 273  01a1 28a3          	dc.w	10403
 274  01a3 cb7d          	dc.w	-13443
 275  01a5 db5c          	dc.w	-9380
 276  01a7 eb3f          	dc.w	-5313
 277  01a9 fb1e          	dc.w	-1250
 278  01ab 8bf9          	dc.w	-29703
 279  01ad 9bd8          	dc.w	-25640
 280  01af abbb          	dc.w	-21573
 281  01b1 bb9a          	dc.w	-17510
 282  01b3 4a75          	dc.w	19061
 283  01b5 5a54          	dc.w	23124
 284  01b7 6a37          	dc.w	27191
 285  01b9 7a16          	dc.w	31254
 286  01bb 0af1          	dc.w	2801
 287  01bd 1ad0          	dc.w	6864
 288  01bf 2ab3          	dc.w	10931
 289  01c1 3a92          	dc.w	14994
 290  01c3 fd2e          	dc.w	-722
 291  01c5 ed0f          	dc.w	-4849
 292  01c7 dd6c          	dc.w	-8852
 293  01c9 cd4d          	dc.w	-12979
 294  01cb bdaa          	dc.w	-16982
 295  01cd ad8b          	dc.w	-21109
 296  01cf 9de8          	dc.w	-25112
 297  01d1 8dc9          	dc.w	-29239
 298  01d3 7c26          	dc.w	31782
 299  01d5 6c07          	dc.w	27655
 300  01d7 5c64          	dc.w	23652
 301  01d9 4c45          	dc.w	19525
 302  01db 3ca2          	dc.w	15522
 303  01dd 2c83          	dc.w	11395
 304  01df 1ce0          	dc.w	7392
 305  01e1 0cc1          	dc.w	3265
 306  01e3 ef1f          	dc.w	-4321
 307  01e5 ff3e          	dc.w	-194
 308  01e7 cf5d          	dc.w	-12451
 309  01e9 df7c          	dc.w	-8324
 310  01eb af9b          	dc.w	-20581
 311  01ed bfba          	dc.w	-16454
 312  01ef 8fd9          	dc.w	-28711
 313  01f1 9ff8          	dc.w	-24584
 314  01f3 6e17          	dc.w	28183
 315  01f5 7e36          	dc.w	32310
 316  01f7 4e55          	dc.w	20053
 317  01f9 5e74          	dc.w	24180
 318  01fb 2e93          	dc.w	11923
 319  01fd 3eb2          	dc.w	16050
 320  01ff 0ed1          	dc.w	3793
 321  0201 1ef0          	dc.w	7920
 322  0203               L7_table_4b6b_code:
 323  0203 15            	dc.b	21
 324  0204 31            	dc.b	49
 325  0205 32            	dc.b	50
 326  0206 23            	dc.b	35
 327  0207 34            	dc.b	52
 328  0208 25            	dc.b	37
 329  0209 26            	dc.b	38
 330  020a 16            	dc.b	22
 331  020b 1a            	dc.b	26
 332  020c 19            	dc.b	25
 333  020d 2a            	dc.b	42
 334  020e 0b            	dc.b	11
 335  020f 2c            	dc.b	44
 336  0210 0d            	dc.b	13
 337  0211 0e            	dc.b	14
 338  0212 1c            	dc.b	28
 418                     ; 91 uint16_t crc16(const void *data, uint8_t size)
 418                     ; 92 {
 420                     	switch	.text
 421  0000               _crc16:
 423  0000 89            	pushw	x
 424  0001 5206          	subw	sp,#6
 425       00000006      OFST:	set	6
 428                     ; 93 	uint16_t val = 0xFFFF;
 430  0003 aeffff        	ldw	x,#65535
 431  0006 1f03          	ldw	(OFST-3,sp),x
 433                     ; 94 	uint8_t *pos = (uint8_t *) data;
 435  0008 1e07          	ldw	x,(OFST+1,sp)
 436  000a 1f05          	ldw	(OFST-1,sp),x
 438                     ; 95 	uint8_t *end = pos + size;
 440  000c 7b05          	ld	a,(OFST-1,sp)
 441  000e 97            	ld	xl,a
 442  000f 7b06          	ld	a,(OFST+0,sp)
 443  0011 1b0b          	add	a,(OFST+5,sp)
 444  0013 2401          	jrnc	L6
 445  0015 5c            	incw	x
 446  0016               L6:
 447  0016 02            	rlwa	x,a
 448  0017 1f01          	ldw	(OFST-5,sp),x
 449  0019 01            	rrwa	x,a
 452  001a 2026          	jra	L16
 453  001c               L55:
 454                     ; 98 	  val = (val << 8) ^ crc16_table[((val >> 8) ^ (*pos)) & 0xFF];
 456  001c 1e03          	ldw	x,(OFST-3,sp)
 457  001e 4f            	clr	a
 458  001f 02            	rlwa	x,a
 459  0020 1605          	ldw	y,(OFST-1,sp)
 460  0022 90f6          	ld	a,(y)
 461  0024 1803          	xor	a,(OFST-3,sp)
 462  0026 a4ff          	and	a,#255
 463  0028 905f          	clrw	y
 464  002a 9097          	ld	yl,a
 465  002c 9058          	sllw	y
 466  002e 01            	rrwa	x,a
 467  002f 90d80004      	xor	a,(L5_crc16_table+1,y)
 468  0033 01            	rrwa	x,a
 469  0034 90d80003      	xor	a,(L5_crc16_table,y)
 470  0038 01            	rrwa	x,a
 471  0039 1f03          	ldw	(OFST-3,sp),x
 473                     ; 99 		pos++;
 475  003b 1e05          	ldw	x,(OFST-1,sp)
 476  003d 1c0001        	addw	x,#1
 477  0040 1f05          	ldw	(OFST-1,sp),x
 479  0042               L16:
 480                     ; 96 	while (pos < end) 
 482  0042 1e05          	ldw	x,(OFST-1,sp)
 483  0044 1301          	cpw	x,(OFST-5,sp)
 484  0046 25d4          	jrult	L55
 485                     ; 101 	return val;
 487  0048 1e03          	ldw	x,(OFST-3,sp)
 490  004a 5b08          	addw	sp,#8
 491  004c 81            	ret
 685                     ; 116 uint8_t *modified_encode_4b6b_command_params_for_Tx(uint8_t *inp_data_to_encodePtr,
 685                     ; 117  																									  uint8_t sizeof_inp_data_to_encode,
 685                     ; 118 																									  uint8_t *seq_tablePtr)
 685                     ; 119 {
 686                     	switch	.text
 687  004d               _modified_encode_4b6b_command_params_for_Tx:
 689  004d 89            	pushw	x
 690  004e 5244          	subw	sp,#68
 691       00000044      OFST:	set	68
 694                     ; 120 	uint32_t code_4b6b = 0; //3 najm³odsze bajty bêd¹ przechowywaæ wynik konwersji danych na kod 4b6b, teraz init pocz¹tkow¹ wartoœci¹
 696  0050 ae0000        	ldw	x,#0
 697  0053 1f41          	ldw	(OFST-3,sp),x
 698  0055 ae0000        	ldw	x,#0
 699  0058 1f3f          	ldw	(OFST-5,sp),x
 701                     ; 125 					next_triple = 0;	//init tej zmiennej
 703  005a 0f39          	clr	(OFST-11,sp)
 705                     ; 127 	uint16_t CRC16 = 0; //init tej zmiennej
 707  005c 5f            	clrw	x
 708  005d 1f3a          	ldw	(OFST-10,sp),x
 710                     ; 128 	uint8_t *input_data = NULL;
 712                     ; 129 	memset(table_for_CRC, 0, sizeof(table_for_CRC));
 714  005f 96            	ldw	x,sp
 715  0060 1c0005        	addw	x,#OFST-63
 716  0063 bf00          	ldw	c_x,x
 717  0065 ae0033        	ldw	x,#51
 718  0068               L21:
 719  0068 5a            	decw	x
 720  0069 926f00        	clr	([c_x.w],x)
 721  006c 5d            	tnzw	x
 722  006d 26f9          	jrne	L21
 723                     ; 131 	sizeof_input_data = sizeof_inp_data_to_encode + sizeof(CRC16); 
 725  006f 7b49          	ld	a,(OFST+5,sp)
 726  0071 ab02          	add	a,#2
 727  0073 6b01          	ld	(OFST-67,sp),a
 729                     ; 132 	padding = 36; //plus powy¿ej wyliczone sizeof_input_data bêdzie rozmiarem tablicy wskazywanej przez seq_tablePtr 
 731  0075 a624          	ld	a,#36
 732  0077 6b04          	ld	(OFST-64,sp),a
 734                     ; 134 	i = 0; //wyzerowanie licznika poni¿szej pêtli
 736  0079 0f3e          	clr	(OFST-6,sp)
 739  007b 201d          	jra	L702
 740  007d               L302:
 741                     ; 138 		table_for_CRC[i] = inp_data_to_encodePtr[i]; //to przepisywanie parametrów do tablicy table_for_CRC
 743  007d 96            	ldw	x,sp
 744  007e 1c0005        	addw	x,#OFST-63
 745  0081 9f            	ld	a,xl
 746  0082 5e            	swapw	x
 747  0083 1b3e          	add	a,(OFST-6,sp)
 748  0085 2401          	jrnc	L41
 749  0087 5c            	incw	x
 750  0088               L41:
 751  0088 02            	rlwa	x,a
 752  0089 89            	pushw	x
 753  008a 7b47          	ld	a,(OFST+3,sp)
 754  008c 97            	ld	xl,a
 755  008d 7b48          	ld	a,(OFST+4,sp)
 756  008f 1b40          	add	a,(OFST-4,sp)
 757  0091 2401          	jrnc	L61
 758  0093 5c            	incw	x
 759  0094               L61:
 760  0094 02            	rlwa	x,a
 761  0095 f6            	ld	a,(x)
 762  0096 85            	popw	x
 763  0097 f7            	ld	(x),a
 764                     ; 139 		i++; //zwiêkszenie licznika pêtli
 766  0098 0c3e          	inc	(OFST-6,sp)
 768  009a               L702:
 769                     ; 135 	while ((sizeof_inp_data_to_encode> 0) && //gdy liczba dodatkowych parametrów > 0
 769                     ; 136 				 (i < sizeof_inp_data_to_encode)) //i jeszcze nie wszystkie parametry zosta³y przepisane do tablicy table_for_CRC
 769                     ; 137 	{
 769                     ; 138 		table_for_CRC[i] = inp_data_to_encodePtr[i]; //to przepisywanie parametrów do tablicy table_for_CRC
 769                     ; 139 		i++; //zwiêkszenie licznika pêtli
 771  009a 0d49          	tnz	(OFST+5,sp)
 772  009c 2706          	jreq	L312
 774  009e 7b3e          	ld	a,(OFST-6,sp)
 775  00a0 1149          	cp	a,(OFST+5,sp)
 776  00a2 25d9          	jrult	L302
 777  00a4               L312:
 778                     ; 141 	table_for_CRC[i] = 0xFF; 
 780  00a4 96            	ldw	x,sp
 781  00a5 1c0005        	addw	x,#OFST-63
 782  00a8 9f            	ld	a,xl
 783  00a9 5e            	swapw	x
 784  00aa 1b3e          	add	a,(OFST-6,sp)
 785  00ac 2401          	jrnc	L02
 786  00ae 5c            	incw	x
 787  00af               L02:
 788  00af 02            	rlwa	x,a
 789  00b0 a6ff          	ld	a,#255
 790  00b2 f7            	ld	(x),a
 791                     ; 142 	table_for_CRC[i + 1] = 0xFF; //znacznik 0xFFFF koñca wype³nionej tablicy table_for_CRC
 793  00b3 96            	ldw	x,sp
 794  00b4 1c0006        	addw	x,#OFST-62
 795  00b7 9f            	ld	a,xl
 796  00b8 5e            	swapw	x
 797  00b9 1b3e          	add	a,(OFST-6,sp)
 798  00bb 2401          	jrnc	L22
 799  00bd 5c            	incw	x
 800  00be               L22:
 801  00be 02            	rlwa	x,a
 802  00bf a6ff          	ld	a,#255
 803  00c1 f7            	ld	(x),a
 804                     ; 143 	idx = 0;
 806  00c2 0f43          	clr	(OFST-1,sp)
 808                     ; 144 	if (seq_tablePtr == NULL)
 810  00c4 1e4a          	ldw	x,(OFST+6,sp)
 811  00c6 2614          	jrne	L512
 812                     ; 145 		seq_tablePtr = calloc(sizeof_input_data + padding, sizeof(uint8_t));
 814  00c8 ae0001        	ldw	x,#1
 815  00cb 89            	pushw	x
 816  00cc 7b03          	ld	a,(OFST-65,sp)
 817  00ce 5f            	clrw	x
 818  00cf 1b06          	add	a,(OFST-62,sp)
 819  00d1 2401          	jrnc	L42
 820  00d3 5c            	incw	x
 821  00d4               L42:
 822  00d4 02            	rlwa	x,a
 823  00d5 cd0000        	call	_calloc
 825  00d8 5b02          	addw	sp,#2
 826  00da 1f4a          	ldw	(OFST+6,sp),x
 827  00dc               L512:
 828                     ; 146 	if (seq_tablePtr == NULL)
 830  00dc 1e4a          	ldw	x,(OFST+6,sp)
 831  00de 260e          	jrne	L712
 832                     ; 147 		GPIO_WriteLow(Red_LED_GPIO_Port, Red_LED_Pin); //czerwona LED bêdzie stale œwieciæ - problem z przydzieleniem pamiêci
 834  00e0 4b04          	push	#4
 835  00e2 ae500f        	ldw	x,#20495
 836  00e5 cd0000        	call	_GPIO_WriteLow
 838  00e8 84            	pop	a
 840  00e9               L122:
 841                     ; 198 	return seq_tablePtr;
 843  00e9 1e4a          	ldw	x,(OFST+6,sp)
 846  00eb 5b46          	addw	sp,#70
 847  00ed 81            	ret
 848  00ee               L712:
 849                     ; 150 		seq_tablePtr[sizeof_input_data + padding - 1] = 0xFF; //wstawienie znacznika na koñcu tablicy seq_tablePtr
 851  00ee 7b01          	ld	a,(OFST-67,sp)
 852  00f0 5f            	clrw	x
 853  00f1 1b04          	add	a,(OFST-64,sp)
 854  00f3 2401          	jrnc	L62
 855  00f5 5c            	incw	x
 856  00f6               L62:
 857  00f6 02            	rlwa	x,a
 858  00f7 5a            	decw	x
 859  00f8 72fb4a        	addw	x,(OFST+6,sp)
 860  00fb a6ff          	ld	a,#255
 861  00fd f7            	ld	(x),a
 862                     ; 151 		input_data = inp_data_to_encodePtr; //teraz bêdzie kodowana do postaci 4b6b zawartoœæ tablicy inp_data_to_encodePtr
 864  00fe 1e45          	ldw	x,(OFST+1,sp)
 865  0100 1f3c          	ldw	(OFST-8,sp),x
 867                     ; 152 		for(i = 0; i < sizeof_input_data; i++) //pêtla koduj¹ca dane do postaci 4b6b i wpisuj¹ca te dane
 869  0102 0f3e          	clr	(OFST-6,sp)
 872  0104 ac380238      	jpf	L722
 873  0108               L322:
 874                     ; 154 			loop_cnt = 2; //bêd¹ kodowane dwa pó³bajty input_data, najpierw starszy, póŸniej m³odszy
 876  0108 a602          	ld	a,#2
 877  010a 6b04          	ld	(OFST-64,sp),a
 879                     ; 155 			for (j = 0; j < loop_cnt; j++)
 881  010c 0f44          	clr	(OFST+0,sp)
 884  010e 204a          	jra	L732
 885  0110               L332:
 886                     ; 157 				if (j == 0)
 888  0110 0d44          	tnz	(OFST+0,sp)
 889  0112 2613          	jrne	L342
 890                     ; 158 					coded_nibble = (input_data[idx] & 0xF0) >> 4; //najpierw starszy pó³bajt input_data
 892  0114 7b3c          	ld	a,(OFST-8,sp)
 893  0116 97            	ld	xl,a
 894  0117 7b3d          	ld	a,(OFST-7,sp)
 895  0119 1b43          	add	a,(OFST-1,sp)
 896  011b 2401          	jrnc	L03
 897  011d 5c            	incw	x
 898  011e               L03:
 899  011e 02            	rlwa	x,a
 900  011f f6            	ld	a,(x)
 901  0120 4e            	swap	a
 902  0121 a40f          	and	a,#15
 903  0123 6b38          	ld	(OFST-12,sp),a
 906  0125 2010          	jra	L542
 907  0127               L342:
 908                     ; 160 					coded_nibble = input_data[idx] & 0x0F; //potem m³odszy pó³bajt input_data
 910  0127 7b3c          	ld	a,(OFST-8,sp)
 911  0129 97            	ld	xl,a
 912  012a 7b3d          	ld	a,(OFST-7,sp)
 913  012c 1b43          	add	a,(OFST-1,sp)
 914  012e 2401          	jrnc	L23
 915  0130 5c            	incw	x
 916  0131               L23:
 917  0131 02            	rlwa	x,a
 918  0132 f6            	ld	a,(x)
 919  0133 a40f          	and	a,#15
 920  0135 6b38          	ld	(OFST-12,sp),a
 922  0137               L542:
 923                     ; 162 				code_4b6b = code_4b6b << 6; //ka¿dorazowe jednokrotne przesuniêcie o 6 bitów w lewo
 925  0137 96            	ldw	x,sp
 926  0138 1c003f        	addw	x,#OFST-5
 927  013b a606          	ld	a,#6
 928  013d cd0000        	call	c_lglsh
 931                     ; 163 				code_4b6b = code_4b6b | (table_4b6b_code[coded_nibble] & 0x3F); //uwzglêdniane 6 najm³odszych bitów table_4b6b_code
 933  0140 7b38          	ld	a,(OFST-12,sp)
 934  0142 5f            	clrw	x
 935  0143 97            	ld	xl,a
 936  0144 d60203        	ld	a,(L7_table_4b6b_code,x)
 937  0147 a43f          	and	a,#63
 938  0149 b703          	ld	c_lreg+3,a
 939  014b 3f02          	clr	c_lreg+2
 940  014d 3f01          	clr	c_lreg+1
 941  014f 3f00          	clr	c_lreg
 942  0151 96            	ldw	x,sp
 943  0152 1c003f        	addw	x,#OFST-5
 944  0155 cd0000        	call	c_lgor
 947                     ; 155 			for (j = 0; j < loop_cnt; j++)
 949  0158 0c44          	inc	(OFST+0,sp)
 951  015a               L732:
 954  015a 7b44          	ld	a,(OFST+0,sp)
 955  015c 1104          	cp	a,(OFST-64,sp)
 956  015e 25b0          	jrult	L332
 957                     ; 165 			idx++;
 959  0160 0c43          	inc	(OFST-1,sp)
 961                     ; 166 			if (code_4b6b & 0xFC0000) //gdy powy¿sze pêtle wykona³y przesuniêcie zawartoœci code_4b6b 4 razy w lewo (czyli wype³ni³y juz 6 najstarszych bitów 3 bajtu tej zmiennej)
 963  0162 7b40          	ld	a,(OFST-4,sp)
 964  0164 a5fc          	bcp	a,#252
 965  0166 2760          	jreq	L742
 966                     ; 168 				for (j = 0; j < 3; j++) //w tej pêtli wpisanie zakodowanej wartoœci do odpowiednich trzech kolejno nastêpuj¹cych po sobie elementów
 968  0168 0f44          	clr	(OFST+0,sp)
 970  016a               L152:
 971                     ; 170 					seq_tablePtr[next_triple + j] = (code_4b6b >> (16 - (j * 8))) & 0xFF; //tablicy wskazywanej przez seq_tablePtr
 973  016a 96            	ldw	x,sp
 974  016b 1c003f        	addw	x,#OFST-5
 975  016e cd0000        	call	c_ltor
 977  0171 7b44          	ld	a,(OFST+0,sp)
 978  0173 48            	sll	a
 979  0174 48            	sll	a
 980  0175 48            	sll	a
 981  0176 a010          	sub	a,#16
 982  0178 40            	neg	a
 983  0179 cd0000        	call	c_lursh
 985  017c 3f02          	clr	c_lreg+2
 986  017e 3f01          	clr	c_lreg+1
 987  0180 3f00          	clr	c_lreg
 988  0182 7b39          	ld	a,(OFST-11,sp)
 989  0184 5f            	clrw	x
 990  0185 1b44          	add	a,(OFST+0,sp)
 991  0187 2401          	jrnc	L43
 992  0189 5c            	incw	x
 993  018a               L43:
 994  018a 02            	rlwa	x,a
 995  018b 72fb4a        	addw	x,(OFST+6,sp)
 996  018e b603          	ld	a,c_lreg+3
 997  0190 f7            	ld	(x),a
 998                     ; 171 					if ((input_data == &idx) && //gdy kodowany jest ju¿ bajt indeksu (wtedy wartoœæ idx jest paddindiem
 998                     ; 172 							(j == 2)) //i wype³niony jest ostatni bajt w tablicy seq_tablePtr
1000  0191 96            	ldw	x,sp
1001  0192 1c0043        	addw	x,#OFST-1
1002  0195 bf00          	ldw	c_x,x
1003  0197 1e3c          	ldw	x,(OFST-8,sp)
1004  0199 b300          	cpw	x,c_x
1005  019b 2613          	jrne	L752
1007  019d 7b44          	ld	a,(OFST+0,sp)
1008  019f a102          	cp	a,#2
1009  01a1 260d          	jrne	L752
1010                     ; 173 						seq_tablePtr[next_triple + j] = 0; //to wyzerowanie tego bajtu
1012  01a3 7b39          	ld	a,(OFST-11,sp)
1013  01a5 5f            	clrw	x
1014  01a6 1b44          	add	a,(OFST+0,sp)
1015  01a8 2401          	jrnc	L63
1016  01aa 5c            	incw	x
1017  01ab               L63:
1018  01ab 02            	rlwa	x,a
1019  01ac 72fb4a        	addw	x,(OFST+6,sp)
1020  01af 7f            	clr	(x)
1021  01b0               L752:
1022                     ; 168 				for (j = 0; j < 3; j++) //w tej pêtli wpisanie zakodowanej wartoœci do odpowiednich trzech kolejno nastêpuj¹cych po sobie elementów
1024  01b0 0c44          	inc	(OFST+0,sp)
1028  01b2 7b44          	ld	a,(OFST+0,sp)
1029  01b4 a103          	cp	a,#3
1030  01b6 25b2          	jrult	L152
1031                     ; 175 				next_triple = next_triple + j; //po zakoñczeniu wype³niania trzech elementów, bêdzie wype³niana nastêpna trójka elementów
1033  01b8 7b39          	ld	a,(OFST-11,sp)
1034  01ba 1b44          	add	a,(OFST+0,sp)
1035  01bc 6b39          	ld	(OFST-11,sp),a
1037                     ; 176 				code_4b6b = 0; //init zmiennej przechowuj¹cej wynik konwersji danych
1039  01be ae0000        	ldw	x,#0
1040  01c1 1f41          	ldw	(OFST-3,sp),x
1041  01c3 ae0000        	ldw	x,#0
1042  01c6 1f3f          	ldw	(OFST-5,sp),x
1044  01c8               L742:
1045                     ; 178 			if ((CRC16 == 0) || //gdy jeszcze nie obliczone CRC16
1045                     ; 179 					(idx < 2)) //lub jeszcze pozosta³ m³odszy bajt obliczonego CRC16
1047  01c8 1e3a          	ldw	x,(OFST-10,sp)
1048  01ca 2706          	jreq	L362
1050  01cc 7b43          	ld	a,(OFST-1,sp)
1051  01ce a102          	cp	a,#2
1052  01d0 2464          	jruge	L162
1053  01d2               L362:
1054                     ; 181 				if ((i + 1) == sizeof_inp_data_to_encode)
1056  01d2 7b49          	ld	a,(OFST+5,sp)
1057  01d4 5f            	clrw	x
1058  01d5 97            	ld	xl,a
1059  01d6 7b3e          	ld	a,(OFST-6,sp)
1060  01d8 905f          	clrw	y
1061  01da 9097          	ld	yl,a
1062  01dc 905c          	incw	y
1063  01de bf00          	ldw	c_x,x
1064  01e0 90b300        	cpw	y,c_x
1065  01e3 2645          	jrne	L562
1066                     ; 183 					for (idx = 0; (memcmp(&table_for_CRC[idx], const_table, 2)); idx++); //obliczenie rozmiaru tablicy table_for_CRC
1068  01e5 0f43          	clr	(OFST-1,sp)
1071  01e7 2002          	jra	L372
1072  01e9               L762:
1076  01e9 0c43          	inc	(OFST-1,sp)
1078  01eb               L372:
1081  01eb ae0002        	ldw	x,#2
1082  01ee 89            	pushw	x
1083  01ef ae0001        	ldw	x,#L3_const_table
1084  01f2 89            	pushw	x
1085  01f3 96            	ldw	x,sp
1086  01f4 1c0009        	addw	x,#OFST-59
1087  01f7 9f            	ld	a,xl
1088  01f8 5e            	swapw	x
1089  01f9 1b47          	add	a,(OFST+3,sp)
1090  01fb 2401          	jrnc	L04
1091  01fd 5c            	incw	x
1092  01fe               L04:
1093  01fe 02            	rlwa	x,a
1094  01ff cd0000        	call	_memcmp
1096  0202 5b04          	addw	sp,#4
1097  0204 a30000        	cpw	x,#0
1098  0207 26e0          	jrne	L762
1099                     ; 184 					CRC16 = crc16(table_for_CRC, idx); 
1101  0209 7b43          	ld	a,(OFST-1,sp)
1102  020b 88            	push	a
1103  020c 96            	ldw	x,sp
1104  020d 1c0006        	addw	x,#OFST-62
1105  0210 cd0000        	call	_crc16
1107  0213 84            	pop	a
1108  0214 1f3a          	ldw	(OFST-10,sp),x
1110                     ; 185 					hi_byte = CRC16 >> 8;
1112  0216 7b3a          	ld	a,(OFST-10,sp)
1113  0218 6b02          	ld	(OFST-66,sp),a
1115                     ; 186 					lo_byte = CRC16 & 0xFF;
1117  021a 7b3b          	ld	a,(OFST-9,sp)
1118  021c a4ff          	and	a,#255
1119  021e 6b03          	ld	(OFST-65,sp),a
1121                     ; 187 					input_data = &hi_byte;
1123  0220 96            	ldw	x,sp
1124  0221 1c0002        	addw	x,#OFST-66
1125  0224 1f3c          	ldw	(OFST-8,sp),x
1127                     ; 188 					idx = 0;
1129  0226 0f43          	clr	(OFST-1,sp)
1132  0228 200c          	jra	L162
1133  022a               L562:
1134                     ; 190 				else if (CRC16 != 0)
1136  022a 1e3a          	ldw	x,(OFST-10,sp)
1137  022c 2708          	jreq	L162
1138                     ; 192 								input_data = &lo_byte;
1140  022e 96            	ldw	x,sp
1141  022f 1c0003        	addw	x,#OFST-65
1142  0232 1f3c          	ldw	(OFST-8,sp),x
1144                     ; 193 								idx = 0;
1146  0234 0f43          	clr	(OFST-1,sp)
1148  0236               L162:
1149                     ; 152 		for(i = 0; i < sizeof_input_data; i++) //pêtla koduj¹ca dane do postaci 4b6b i wpisuj¹ca te dane
1151  0236 0c3e          	inc	(OFST-6,sp)
1153  0238               L722:
1156  0238 7b3e          	ld	a,(OFST-6,sp)
1157  023a 1101          	cp	a,(OFST-67,sp)
1158  023c 2403          	jruge	L24
1159  023e cc0108        	jp	L322
1160  0241               L24:
1161  0241 ace900e9      	jpf	L122
1373                     ; 223 uint8_t *encode_4b6b_command_params_for_Tx(uint8_t command, 
1373                     ; 224 																					 uint8_t page_nbr,
1373                     ; 225 																					 uint8_t *paramsPtr,
1373                     ; 226 																					 uint8_t sizeof_params,
1373                     ; 227 																					 uint8_t *seq_tablePtr)
1373                     ; 228 {
1374                     	switch	.text
1375  0245               _encode_4b6b_command_params_for_Tx:
1377  0245 89            	pushw	x
1378  0246 5248          	subw	sp,#72
1379       00000048      OFST:	set	72
1382                     ; 229 	uint32_t code_4b6b = 0; //3 najm³odsze bajty bêd¹ przechowywaæ wynik konwersji danych na kod 4b6b, teraz init pocz¹tkow¹ wartoœci¹
1384  0248 ae0000        	ldw	x,#0
1385  024b 1f0f          	ldw	(OFST-57,sp),x
1386  024d ae0000        	ldw	x,#0
1387  0250 1f0d          	ldw	(OFST-59,sp),x
1389                     ; 234 					next_triple = 0;	//init tej zmiennej
1391  0252 0f08          	clr	(OFST-64,sp)
1393                     ; 236 	uint16_t CRC16 = 0; //init tej zmiennej
1395  0254 5f            	clrw	x
1396  0255 1f09          	ldw	(OFST-63,sp),x
1398                     ; 237 	uint8_t *input_data = NULL;
1400                     ; 238 	memset(table_for_CRC, 0, sizeof(table_for_CRC));
1402  0257 96            	ldw	x,sp
1403  0258 1c0011        	addw	x,#OFST-55
1404  025b bf00          	ldw	c_x,x
1405  025d ae0033        	ldw	x,#51
1406  0260               L64:
1407  0260 5a            	decw	x
1408  0261 926f00        	clr	([c_x.w],x)
1409  0264 5d            	tnzw	x
1410  0265 26f9          	jrne	L64
1411                     ; 239 	if (sizeof_params > 0) //wyliczenie iloœci danych do zakodowania 4b6b, gdy s¹ dodatkowe parametry
1413  0267 0d4f          	tnz	(OFST+7,sp)
1414  0269 270c          	jreq	L534
1415                     ; 241 		sizeof_input_data = sizeof(marker) + sizeof(flag) + sizeof(sensor_ID) + sizeof(command) + sizeof(sizeof_params) + sizeof_params + sizeof(CRC16); 
1417  026b 7b4f          	ld	a,(OFST+7,sp)
1418  026d ab09          	add	a,#9
1419  026f 6b07          	ld	(OFST-65,sp),a
1421                     ; 242 		padding = 36; //plus powy¿ej wyliczone sizeof_input_data bêdzie rozmiarem tablicy wskazywanej przez seq_tablePtr 
1423  0271 a624          	ld	a,#36
1424  0273 6b0b          	ld	(OFST-61,sp),a
1427  0275 2008          	jra	L734
1428  0277               L534:
1429                     ; 246 		sizeof_input_data = 1 + sizeof(sensor_ID) + sizeof(command) + sizeof(sizeof_params) + sizeof(CRC16); 
1431  0277 a608          	ld	a,#8
1432  0279 6b07          	ld	(OFST-65,sp),a
1434                     ; 247 		padding = 4; //plus powy¿ej wyliczone sizeof_input_data bêdzie rozmiarem tablicy wskazywanej przez seq_tablePtr 
1436  027b a604          	ld	a,#4
1437  027d 6b0b          	ld	(OFST-61,sp),a
1439  027f               L734:
1440                     ; 249 	table_for_CRC[0] = marker[0]; //zerowy element tej tablicy przechowuje wartoœæ device type (teraz czujnika glikemii)
1442  027f a6ab          	ld	a,#171
1443  0281 6b11          	ld	(OFST-55,sp),a
1445                     ; 250 	for (i = 0; i < sizeof(sensor_ID); i++) // w tej pêtli przepisanie do trzech kolejnych elementów tablicy table_for_CRC
1447  0283 0f47          	clr	(OFST-1,sp)
1449  0285               L144:
1450                     ; 252 		if ((i % 2) == 0)
1452  0285 7b47          	ld	a,(OFST-1,sp)
1453  0287 a501          	bcp	a,#1
1454  0289 261a          	jrne	L744
1455                     ; 253 			table_for_CRC[(i / 2) + 1] = sensor_ID[i];
1457  028b 96            	ldw	x,sp
1458  028c 1c0012        	addw	x,#OFST-54
1459  028f 1f03          	ldw	(OFST-69,sp),x
1461  0291 7b47          	ld	a,(OFST-1,sp)
1462  0293 5f            	clrw	x
1463  0294 97            	ld	xl,a
1464  0295 57            	sraw	x
1465  0296 72fb03        	addw	x,(OFST-69,sp)
1466  0299 7b47          	ld	a,(OFST-1,sp)
1467  029b 905f          	clrw	y
1468  029d 9097          	ld	yl,a
1469  029f 90e601        	ld	a,(_sensor_ID,y)
1470  02a2 f7            	ld	(x),a
1472  02a3 2034          	jra	L154
1473  02a5               L744:
1474                     ; 255 			table_for_CRC[(i / 2) + 1] = (table_for_CRC[(i / 2) + 1] << 4) | sensor_ID[i];
1476  02a5 96            	ldw	x,sp
1477  02a6 1c0012        	addw	x,#OFST-54
1478  02a9 1f03          	ldw	(OFST-69,sp),x
1480  02ab 7b47          	ld	a,(OFST-1,sp)
1481  02ad 5f            	clrw	x
1482  02ae 97            	ld	xl,a
1483  02af 57            	sraw	x
1484  02b0 72fb03        	addw	x,(OFST-69,sp)
1485  02b3 7b47          	ld	a,(OFST-1,sp)
1486  02b5 905f          	clrw	y
1487  02b7 9097          	ld	yl,a
1488  02b9 9089          	pushw	y
1489  02bb 9096          	ldw	y,sp
1490  02bd 72a90014      	addw	y,#OFST-52
1491  02c1 1703          	ldw	(OFST-69,sp),y
1493  02c3 7b49          	ld	a,(OFST+1,sp)
1494  02c5 905f          	clrw	y
1495  02c7 9097          	ld	yl,a
1496  02c9 9057          	sraw	y
1497  02cb 72f903        	addw	y,(OFST-69,sp)
1498  02ce 90f6          	ld	a,(y)
1499  02d0 4e            	swap	a
1500  02d1 a4f0          	and	a,#240
1501  02d3 9085          	popw	y
1502  02d5 90ea01        	or	a,(_sensor_ID,y)
1503  02d8 f7            	ld	(x),a
1504  02d9               L154:
1505                     ; 250 	for (i = 0; i < sizeof(sensor_ID); i++) // w tej pêtli przepisanie do trzech kolejnych elementów tablicy table_for_CRC
1507  02d9 0c47          	inc	(OFST-1,sp)
1511  02db 7b47          	ld	a,(OFST-1,sp)
1512  02dd a103          	cp	a,#3
1513  02df 25a4          	jrult	L144
1514                     ; 257 	table_for_CRC[(i / 2) + 1] = command; //do nastêpnego elementu tej tablicy wpisywany jest bajt komendy
1516  02e1 96            	ldw	x,sp
1517  02e2 1c0012        	addw	x,#OFST-54
1518  02e5 1f03          	ldw	(OFST-69,sp),x
1520  02e7 7b47          	ld	a,(OFST-1,sp)
1521  02e9 5f            	clrw	x
1522  02ea 97            	ld	xl,a
1523  02eb 57            	sraw	x
1524  02ec 72fb03        	addw	x,(OFST-69,sp)
1525  02ef 7b49          	ld	a,(OFST+1,sp)
1526  02f1 f7            	ld	(x),a
1527                     ; 258   table_for_CRC[(i / 2) + 2] = page_nbr;
1529  02f2 96            	ldw	x,sp
1530  02f3 1c0013        	addw	x,#OFST-53
1531  02f6 1f03          	ldw	(OFST-69,sp),x
1533  02f8 7b47          	ld	a,(OFST-1,sp)
1534  02fa 5f            	clrw	x
1535  02fb 97            	ld	xl,a
1536  02fc 57            	sraw	x
1537  02fd 72fb03        	addw	x,(OFST-69,sp)
1538  0300 7b4a          	ld	a,(OFST+2,sp)
1539  0302 f7            	ld	(x),a
1540                     ; 259 	idx = (i / 2) + 3; //pocz¹tkowy indeks kolejnego wolnego elementu tablicy table_for_CRC
1542  0303 7b47          	ld	a,(OFST-1,sp)
1543  0305 5f            	clrw	x
1544  0306 97            	ld	xl,a
1545  0307 57            	sraw	x
1546  0308 1c0003        	addw	x,#3
1547  030b 01            	rrwa	x,a
1548  030c 6b48          	ld	(OFST+0,sp),a
1549  030e 02            	rlwa	x,a
1551                     ; 260 	i = 0; //wyzerowanie licznika poni¿szej pêtli
1553  030f 0f47          	clr	(OFST-1,sp)
1556  0311 2029          	jra	L754
1557  0313               L354:
1558                     ; 264 		table_for_CRC[idx + i] = paramsPtr[(idx - 6) + i]; //to przepisywanie parametrów do tablicy table_for_CRC
1560  0313 96            	ldw	x,sp
1561  0314 1c0011        	addw	x,#OFST-55
1562  0317 1f03          	ldw	(OFST-69,sp),x
1564  0319 7b48          	ld	a,(OFST+0,sp)
1565  031b 5f            	clrw	x
1566  031c 1b47          	add	a,(OFST-1,sp)
1567  031e 2401          	jrnc	L05
1568  0320 5c            	incw	x
1569  0321               L05:
1570  0321 02            	rlwa	x,a
1571  0322 72fb03        	addw	x,(OFST-69,sp)
1572  0325 89            	pushw	x
1573  0326 7b4a          	ld	a,(OFST+2,sp)
1574  0328 5f            	clrw	x
1575  0329 97            	ld	xl,a
1576  032a 1d0006        	subw	x,#6
1577  032d 01            	rrwa	x,a
1578  032e 1b49          	add	a,(OFST+1,sp)
1579  0330 2401          	jrnc	L25
1580  0332 5c            	incw	x
1581  0333               L25:
1582  0333 02            	rlwa	x,a
1583  0334 72fb4f        	addw	x,(OFST+7,sp)
1584  0337 f6            	ld	a,(x)
1585  0338 85            	popw	x
1586  0339 f7            	ld	(x),a
1587                     ; 265 		i++; //zwiêkszenie licznika pêtli
1589  033a 0c47          	inc	(OFST-1,sp)
1591  033c               L754:
1592                     ; 261 	while ((sizeof_params > 0) && //gdy liczba dodatkowych parametrów > 0
1592                     ; 262 				 ((i + idx) < (sizeof_params + 6))) //i jeszcze nie wszystkie parametry zosta³y przepisane do tablicy table_for_CRC
1592                     ; 263 	{
1592                     ; 264 		table_for_CRC[idx + i] = paramsPtr[(idx - 6) + i]; //to przepisywanie parametrów do tablicy table_for_CRC
1592                     ; 265 		i++; //zwiêkszenie licznika pêtli
1594  033c 0d4f          	tnz	(OFST+7,sp)
1595  033e 271c          	jreq	L364
1597  0340 9c            	rvf
1598  0341 a600          	ld	a,#0
1599  0343 97            	ld	xl,a
1600  0344 a606          	ld	a,#6
1601  0346 1b4f          	add	a,(OFST+7,sp)
1602  0348 2401          	jrnc	L45
1603  034a 5c            	incw	x
1604  034b               L45:
1605  034b 02            	rlwa	x,a
1606  034c 1f03          	ldw	(OFST-69,sp),x
1607  034e 01            	rrwa	x,a
1609  034f 7b47          	ld	a,(OFST-1,sp)
1610  0351 5f            	clrw	x
1611  0352 1b48          	add	a,(OFST+0,sp)
1612  0354 2401          	jrnc	L65
1613  0356 5c            	incw	x
1614  0357               L65:
1615  0357 02            	rlwa	x,a
1616  0358 1303          	cpw	x,(OFST-69,sp)
1617  035a 2fb7          	jrslt	L354
1618  035c               L364:
1619                     ; 267 	table_for_CRC[idx + i] = 0xFF; 
1621  035c 96            	ldw	x,sp
1622  035d 1c0011        	addw	x,#OFST-55
1623  0360 1f03          	ldw	(OFST-69,sp),x
1625  0362 7b48          	ld	a,(OFST+0,sp)
1626  0364 5f            	clrw	x
1627  0365 1b47          	add	a,(OFST-1,sp)
1628  0367 2401          	jrnc	L06
1629  0369 5c            	incw	x
1630  036a               L06:
1631  036a 02            	rlwa	x,a
1632  036b 72fb03        	addw	x,(OFST-69,sp)
1633  036e a6ff          	ld	a,#255
1634  0370 f7            	ld	(x),a
1635                     ; 268 	table_for_CRC[idx + i + 1] = 0xFF; //znacznik 0xFFFF koñca wype³nionej tablicy table_for_CRC
1637  0371 96            	ldw	x,sp
1638  0372 1c0012        	addw	x,#OFST-54
1639  0375 1f03          	ldw	(OFST-69,sp),x
1641  0377 7b48          	ld	a,(OFST+0,sp)
1642  0379 5f            	clrw	x
1643  037a 1b47          	add	a,(OFST-1,sp)
1644  037c 2401          	jrnc	L26
1645  037e 5c            	incw	x
1646  037f               L26:
1647  037f 02            	rlwa	x,a
1648  0380 72fb03        	addw	x,(OFST-69,sp)
1649  0383 a6ff          	ld	a,#255
1650  0385 f7            	ld	(x),a
1651                     ; 269 	idx = 0;
1653  0386 0f48          	clr	(OFST+0,sp)
1655                     ; 270 	if (seq_tablePtr == NULL)
1657  0388 1e50          	ldw	x,(OFST+8,sp)
1658  038a 2614          	jrne	L564
1659                     ; 271 		seq_tablePtr = calloc(sizeof_input_data + padding, sizeof(uint8_t));
1661  038c ae0001        	ldw	x,#1
1662  038f 89            	pushw	x
1663  0390 7b09          	ld	a,(OFST-63,sp)
1664  0392 5f            	clrw	x
1665  0393 1b0d          	add	a,(OFST-59,sp)
1666  0395 2401          	jrnc	L46
1667  0397 5c            	incw	x
1668  0398               L46:
1669  0398 02            	rlwa	x,a
1670  0399 cd0000        	call	_calloc
1672  039c 5b02          	addw	sp,#2
1673  039e 1f50          	ldw	(OFST+8,sp),x
1674  03a0               L564:
1675                     ; 272 	if (seq_tablePtr == NULL)
1677  03a0 1e50          	ldw	x,(OFST+8,sp)
1678  03a2 2609          	jrne	L764
1679                     ; 273 		GPIO_WriteLow(Red_LED_GPIO_Port, Red_LED_Pin); //czerwona LED bêdzie stale œwieciæ - problem z przydzieleniem pamiêci
1681  03a4 4b04          	push	#4
1682  03a6 ae500f        	ldw	x,#20495
1683  03a9 cd0000        	call	_GPIO_WriteLow
1685  03ac 84            	pop	a
1686  03ad               L764:
1687                     ; 274 	seq_tablePtr[sizeof_input_data + padding - 1] = 0xFF; //wstawienie znacznika na koñcu tablicy seq_tablePtr
1689  03ad 7b07          	ld	a,(OFST-65,sp)
1690  03af 5f            	clrw	x
1691  03b0 1b0b          	add	a,(OFST-61,sp)
1692  03b2 2401          	jrnc	L66
1693  03b4 5c            	incw	x
1694  03b5               L66:
1695  03b5 02            	rlwa	x,a
1696  03b6 5a            	decw	x
1697  03b7 72fb50        	addw	x,(OFST+8,sp)
1698  03ba a6ff          	ld	a,#255
1699  03bc f7            	ld	(x),a
1700                     ; 275 	input_data = &table_for_CRC[0]; //teraz bêdzie kodowana do postaci 4b6b wartoœæ device type
1702  03bd 96            	ldw	x,sp
1703  03be 1c0011        	addw	x,#OFST-55
1704  03c1 1f44          	ldw	(OFST-4,sp),x
1706                     ; 276 	for(i = 0; i < sizeof_input_data; i++) //pêtla koduj¹ca dane do postaci 4b6b i wpisuj¹ca te dane
1708  03c3 0f47          	clr	(OFST-1,sp)
1711  03c5 ac8d058d      	jpf	L574
1712  03c9               L174:
1713                     ; 278 		if (input_data == sensor_ID)   //gdy kodowane s¹ cyfry numeru ID sensora
1715  03c9 1e44          	ldw	x,(OFST-4,sp)
1716  03cb a30001        	cpw	x,#_sensor_ID
1717  03ce 2606          	jrne	L105
1718                     ; 279 			loop_cnt = 1; //bedzie kodowany tylko m³odszy pó³bajt input_data
1720  03d0 a601          	ld	a,#1
1721  03d2 6b0b          	ld	(OFST-61,sp),a
1724  03d4 2004          	jra	L305
1725  03d6               L105:
1726                     ; 281 			loop_cnt = 2; //bêd¹ kodowane dwa pó³bajty input_data, najpierw starszy, póŸniej m³odszy
1728  03d6 a602          	ld	a,#2
1729  03d8 6b0b          	ld	(OFST-61,sp),a
1731  03da               L305:
1732                     ; 282 		for (j = 0; j < loop_cnt; j++)
1734  03da 0f46          	clr	(OFST-2,sp)
1737  03dc 2066          	jra	L115
1738  03de               L505:
1739                     ; 284 			switch (loop_cnt)
1741  03de 7b0b          	ld	a,(OFST-61,sp)
1743                     ; 294 								break;
1744  03e0 4a            	dec	a
1745  03e1 2705          	jreq	L303
1746  03e3 4a            	dec	a
1747  03e4 2714          	jreq	L503
1748  03e6 2039          	jra	L715
1749  03e8               L303:
1750                     ; 286 				case 1:
1750                     ; 287 								coded_nibble = input_data[idx] & 0x0F; //m³odszy pó³bajt input_data
1752  03e8 7b44          	ld	a,(OFST-4,sp)
1753  03ea 97            	ld	xl,a
1754  03eb 7b45          	ld	a,(OFST-3,sp)
1755  03ed 1b48          	add	a,(OFST+0,sp)
1756  03ef 2401          	jrnc	L07
1757  03f1 5c            	incw	x
1758  03f2               L07:
1759  03f2 02            	rlwa	x,a
1760  03f3 f6            	ld	a,(x)
1761  03f4 a40f          	and	a,#15
1762  03f6 6b0c          	ld	(OFST-60,sp),a
1764                     ; 288 								break;
1766  03f8 2027          	jra	L715
1767  03fa               L503:
1768                     ; 289 				case 2:
1768                     ; 290 								if (j == 0)
1770  03fa 0d46          	tnz	(OFST-2,sp)
1771  03fc 2613          	jrne	L125
1772                     ; 291 									coded_nibble = (input_data[idx] & 0xF0) >> 4; //najpierw starszy pó³bajt input_data
1774  03fe 7b44          	ld	a,(OFST-4,sp)
1775  0400 97            	ld	xl,a
1776  0401 7b45          	ld	a,(OFST-3,sp)
1777  0403 1b48          	add	a,(OFST+0,sp)
1778  0405 2401          	jrnc	L27
1779  0407 5c            	incw	x
1780  0408               L27:
1781  0408 02            	rlwa	x,a
1782  0409 f6            	ld	a,(x)
1783  040a 4e            	swap	a
1784  040b a40f          	and	a,#15
1785  040d 6b0c          	ld	(OFST-60,sp),a
1788  040f 2010          	jra	L715
1789  0411               L125:
1790                     ; 293 									coded_nibble = input_data[idx] & 0x0F; //potem m³odszy pó³bajt input_data
1792  0411 7b44          	ld	a,(OFST-4,sp)
1793  0413 97            	ld	xl,a
1794  0414 7b45          	ld	a,(OFST-3,sp)
1795  0416 1b48          	add	a,(OFST+0,sp)
1796  0418 2401          	jrnc	L47
1797  041a 5c            	incw	x
1798  041b               L47:
1799  041b 02            	rlwa	x,a
1800  041c f6            	ld	a,(x)
1801  041d a40f          	and	a,#15
1802  041f 6b0c          	ld	(OFST-60,sp),a
1804  0421               L715:
1805                     ; 296  			code_4b6b = code_4b6b << 6; //ka¿dorazowe jednokrotne przesuniêcie o 6 bitów w lewo
1807  0421 96            	ldw	x,sp
1808  0422 1c000d        	addw	x,#OFST-59
1809  0425 a606          	ld	a,#6
1810  0427 cd0000        	call	c_lglsh
1813                     ; 297 			code_4b6b = code_4b6b | (table_4b6b_code[coded_nibble] & 0x3F); //uwzglêdniane 6 najm³odszych bitów table_4b6b_code
1815  042a 7b0c          	ld	a,(OFST-60,sp)
1816  042c 5f            	clrw	x
1817  042d 97            	ld	xl,a
1818  042e d60203        	ld	a,(L7_table_4b6b_code,x)
1819  0431 a43f          	and	a,#63
1820  0433 b703          	ld	c_lreg+3,a
1821  0435 3f02          	clr	c_lreg+2
1822  0437 3f01          	clr	c_lreg+1
1823  0439 3f00          	clr	c_lreg
1824  043b 96            	ldw	x,sp
1825  043c 1c000d        	addw	x,#OFST-59
1826  043f cd0000        	call	c_lgor
1829                     ; 282 		for (j = 0; j < loop_cnt; j++)
1831  0442 0c46          	inc	(OFST-2,sp)
1833  0444               L115:
1836  0444 7b46          	ld	a,(OFST-2,sp)
1837  0446 110b          	cp	a,(OFST-61,sp)
1838  0448 2594          	jrult	L505
1839                     ; 299 		idx++;
1841  044a 0c48          	inc	(OFST+0,sp)
1843                     ; 300 		if (code_4b6b & 0xFC0000) //gdy powy¿sze pêtle wykona³y przesuniêcie zawartoœci code_4b6b 4 razy w lewo (czyli wype³ni³y juz 6 najstarszych bitów 3 bajtu tej zmiennej)
1845  044c 7b0e          	ld	a,(OFST-58,sp)
1846  044e a5fc          	bcp	a,#252
1847  0450 2760          	jreq	L525
1848                     ; 302 			for (j = 0; j < 3; j++) //w tej pêtli wpisanie zakodowanej wartoœci do odpowiednich trzech kolejno nastêpuj¹cych po sobie elementów
1850  0452 0f46          	clr	(OFST-2,sp)
1852  0454               L725:
1853                     ; 304 				seq_tablePtr[next_triple + j] = (code_4b6b >> (16 - (j * 8))) & 0xFF; //tablicy wskazywanej przez seq_tablePtr
1855  0454 96            	ldw	x,sp
1856  0455 1c000d        	addw	x,#OFST-59
1857  0458 cd0000        	call	c_ltor
1859  045b 7b46          	ld	a,(OFST-2,sp)
1860  045d 48            	sll	a
1861  045e 48            	sll	a
1862  045f 48            	sll	a
1863  0460 a010          	sub	a,#16
1864  0462 40            	neg	a
1865  0463 cd0000        	call	c_lursh
1867  0466 3f02          	clr	c_lreg+2
1868  0468 3f01          	clr	c_lreg+1
1869  046a 3f00          	clr	c_lreg
1870  046c 7b08          	ld	a,(OFST-64,sp)
1871  046e 5f            	clrw	x
1872  046f 1b46          	add	a,(OFST-2,sp)
1873  0471 2401          	jrnc	L67
1874  0473 5c            	incw	x
1875  0474               L67:
1876  0474 02            	rlwa	x,a
1877  0475 72fb50        	addw	x,(OFST+8,sp)
1878  0478 b603          	ld	a,c_lreg+3
1879  047a f7            	ld	(x),a
1880                     ; 305 				if ((input_data == &idx) && //gdy kodowany jest ju¿ bajt indeksu (wtedy wartoœæ idx jest paddindiem
1880                     ; 306 						(j == 2)) //i wype³niony jest ostatni bajt w tablicy seq_tablePtr
1882  047b 96            	ldw	x,sp
1883  047c 1c0048        	addw	x,#OFST+0
1884  047f bf00          	ldw	c_x,x
1885  0481 1e44          	ldw	x,(OFST-4,sp)
1886  0483 b300          	cpw	x,c_x
1887  0485 2613          	jrne	L535
1889  0487 7b46          	ld	a,(OFST-2,sp)
1890  0489 a102          	cp	a,#2
1891  048b 260d          	jrne	L535
1892                     ; 307 					seq_tablePtr[next_triple + j] = 0; //to wyzerowanie tego bajtu
1894  048d 7b08          	ld	a,(OFST-64,sp)
1895  048f 5f            	clrw	x
1896  0490 1b46          	add	a,(OFST-2,sp)
1897  0492 2401          	jrnc	L001
1898  0494 5c            	incw	x
1899  0495               L001:
1900  0495 02            	rlwa	x,a
1901  0496 72fb50        	addw	x,(OFST+8,sp)
1902  0499 7f            	clr	(x)
1903  049a               L535:
1904                     ; 302 			for (j = 0; j < 3; j++) //w tej pêtli wpisanie zakodowanej wartoœci do odpowiednich trzech kolejno nastêpuj¹cych po sobie elementów
1906  049a 0c46          	inc	(OFST-2,sp)
1910  049c 7b46          	ld	a,(OFST-2,sp)
1911  049e a103          	cp	a,#3
1912  04a0 25b2          	jrult	L725
1913                     ; 309 			next_triple = next_triple + j; //po zakoñczeniu wype³niania trzech elementów, bêdzie wype³niana nastêpna trójka elementów
1915  04a2 7b08          	ld	a,(OFST-64,sp)
1916  04a4 1b46          	add	a,(OFST-2,sp)
1917  04a6 6b08          	ld	(OFST-64,sp),a
1919                     ; 310 			code_4b6b = 0; //init zmiennej przechowuj¹cej wynik konwersji danych
1921  04a8 ae0000        	ldw	x,#0
1922  04ab 1f0f          	ldw	(OFST-57,sp),x
1923  04ad ae0000        	ldw	x,#0
1924  04b0 1f0d          	ldw	(OFST-59,sp),x
1926  04b2               L525:
1927                     ; 312 		if ((i + 1) == sizeof(table_for_CRC[0])) //gdy ju¿ zakodowana wartoœæ device type 
1929  04b2 a600          	ld	a,#0
1930  04b4 97            	ld	xl,a
1931  04b5 a601          	ld	a,#1
1932  04b7 1b47          	add	a,(OFST-1,sp)
1933  04b9 2401          	jrnc	L201
1934  04bb 5c            	incw	x
1935  04bc               L201:
1936  04bc 02            	rlwa	x,a
1937  04bd a30001        	cpw	x,#1
1938  04c0 2607          	jrne	L735
1939                     ; 314 			input_data = sensor_ID; //bêdzie kodowana tablica z numerem ID sensora
1941  04c2 ae0001        	ldw	x,#_sensor_ID
1942  04c5 1f44          	ldw	(OFST-4,sp),x
1944                     ; 315 			idx = 0;
1946  04c7 0f48          	clr	(OFST+0,sp)
1948  04c9               L735:
1949                     ; 317 		if ((i + 1) == (sizeof(table_for_CRC[0]) + sizeof(sensor_ID))) 
1951  04c9 a600          	ld	a,#0
1952  04cb 97            	ld	xl,a
1953  04cc a601          	ld	a,#1
1954  04ce 1b47          	add	a,(OFST-1,sp)
1955  04d0 2401          	jrnc	L401
1956  04d2 5c            	incw	x
1957  04d3               L401:
1958  04d3 02            	rlwa	x,a
1959  04d4 a30004        	cpw	x,#4
1960  04d7 2608          	jrne	L145
1961                     ; 319 			input_data = &command;
1963  04d9 96            	ldw	x,sp
1964  04da 1c0049        	addw	x,#OFST+1
1965  04dd 1f44          	ldw	(OFST-4,sp),x
1967                     ; 320 			idx = 0;
1969  04df 0f48          	clr	(OFST+0,sp)
1971  04e1               L145:
1972                     ; 322 		if ((i + 1) == (sizeof(table_for_CRC[0]) + sizeof(sensor_ID) + sizeof(command))) 
1974  04e1 a600          	ld	a,#0
1975  04e3 97            	ld	xl,a
1976  04e4 a601          	ld	a,#1
1977  04e6 1b47          	add	a,(OFST-1,sp)
1978  04e8 2401          	jrnc	L601
1979  04ea 5c            	incw	x
1980  04eb               L601:
1981  04eb 02            	rlwa	x,a
1982  04ec a30005        	cpw	x,#5
1983  04ef 2608          	jrne	L345
1984                     ; 325 			input_data = &page_nbr;
1986  04f1 96            	ldw	x,sp
1987  04f2 1c004a        	addw	x,#OFST+2
1988  04f5 1f44          	ldw	(OFST-4,sp),x
1990                     ; 326 			idx = 0;
1992  04f7 0f48          	clr	(OFST+0,sp)
1994  04f9               L345:
1995                     ; 328 		if ((sizeof_params > 0) && //gdy istniej¹ parametry komendy
1995                     ; 329 				((i + 1) == (sizeof(table_for_CRC[0]) + sizeof(sensor_ID) + sizeof(command) + sizeof(sizeof_params)))) 
1997  04f9 0d4f          	tnz	(OFST+7,sp)
1998  04fb 2716          	jreq	L545
2000  04fd a600          	ld	a,#0
2001  04ff 97            	ld	xl,a
2002  0500 a601          	ld	a,#1
2003  0502 1b47          	add	a,(OFST-1,sp)
2004  0504 2401          	jrnc	L011
2005  0506 5c            	incw	x
2006  0507               L011:
2007  0507 02            	rlwa	x,a
2008  0508 a30006        	cpw	x,#6
2009  050b 2606          	jrne	L545
2010                     ; 331 			input_data = paramsPtr;
2012  050d 1e4d          	ldw	x,(OFST+5,sp)
2013  050f 1f44          	ldw	(OFST-4,sp),x
2015                     ; 332 			idx = 0;
2017  0511 0f48          	clr	(OFST+0,sp)
2019  0513               L545:
2020                     ; 334 		if ((CRC16 == 0) || //gdy jeszcze nie obliczone CRC16
2020                     ; 335 				(idx < 2)) //lub jeszcze pozosta³ m³odszy bajt obliczonego CRC16
2022  0513 1e09          	ldw	x,(OFST-63,sp)
2023  0515 2706          	jreq	L155
2025  0517 7b48          	ld	a,(OFST+0,sp)
2026  0519 a102          	cp	a,#2
2027  051b 246e          	jruge	L745
2028  051d               L155:
2029                     ; 337 			if ((i + 1) == (sizeof(table_for_CRC[0]) + sizeof(sensor_ID) + sizeof(command) + sizeof(sizeof_params) + sizeof_params)) //byæ mo¿e zamiast zmiennej sizeof_params wstawiæ licbê 64
2031  051d a600          	ld	a,#0
2032  051f 97            	ld	xl,a
2033  0520 a606          	ld	a,#6
2034  0522 1b4f          	add	a,(OFST+7,sp)
2035  0524 2401          	jrnc	L211
2036  0526 5c            	incw	x
2037  0527               L211:
2038  0527 02            	rlwa	x,a
2039  0528 1f03          	ldw	(OFST-69,sp),x
2040  052a 01            	rrwa	x,a
2042  052b a600          	ld	a,#0
2043  052d 97            	ld	xl,a
2044  052e a601          	ld	a,#1
2045  0530 1b47          	add	a,(OFST-1,sp)
2046  0532 2401          	jrnc	L411
2047  0534 5c            	incw	x
2048  0535               L411:
2049  0535 02            	rlwa	x,a
2050  0536 1303          	cpw	x,(OFST-69,sp)
2051  0538 2645          	jrne	L355
2052                     ; 339 				for (idx = 0; (memcmp(&table_for_CRC[idx], const_table, 2)); idx++); //obliczenie rozmiaru tablicy table_for_CRC
2054  053a 0f48          	clr	(OFST+0,sp)
2057  053c 2002          	jra	L165
2058  053e               L555:
2062  053e 0c48          	inc	(OFST+0,sp)
2064  0540               L165:
2067  0540 ae0002        	ldw	x,#2
2068  0543 89            	pushw	x
2069  0544 ae0001        	ldw	x,#L3_const_table
2070  0547 89            	pushw	x
2071  0548 96            	ldw	x,sp
2072  0549 1c0015        	addw	x,#OFST-51
2073  054c 9f            	ld	a,xl
2074  054d 5e            	swapw	x
2075  054e 1b4c          	add	a,(OFST+4,sp)
2076  0550 2401          	jrnc	L611
2077  0552 5c            	incw	x
2078  0553               L611:
2079  0553 02            	rlwa	x,a
2080  0554 cd0000        	call	_memcmp
2082  0557 5b04          	addw	sp,#4
2083  0559 a30000        	cpw	x,#0
2084  055c 26e0          	jrne	L555
2085                     ; 340 				CRC16 = crc16(table_for_CRC, idx); 
2087  055e 7b48          	ld	a,(OFST+0,sp)
2088  0560 88            	push	a
2089  0561 96            	ldw	x,sp
2090  0562 1c0012        	addw	x,#OFST-54
2091  0565 cd0000        	call	_crc16
2093  0568 84            	pop	a
2094  0569 1f09          	ldw	(OFST-63,sp),x
2096                     ; 341 				hi_byte = CRC16 >> 8;
2098  056b 7b09          	ld	a,(OFST-63,sp)
2099  056d 6b05          	ld	(OFST-67,sp),a
2101                     ; 342 				lo_byte = CRC16 & 0xFF;
2103  056f 7b0a          	ld	a,(OFST-62,sp)
2104  0571 a4ff          	and	a,#255
2105  0573 6b06          	ld	(OFST-66,sp),a
2107                     ; 343 				input_data = &hi_byte;
2109  0575 96            	ldw	x,sp
2110  0576 1c0005        	addw	x,#OFST-67
2111  0579 1f44          	ldw	(OFST-4,sp),x
2113                     ; 344 				idx = 0;
2115  057b 0f48          	clr	(OFST+0,sp)
2118  057d 200c          	jra	L745
2119  057f               L355:
2120                     ; 346 			else if (CRC16 != 0)
2122  057f 1e09          	ldw	x,(OFST-63,sp)
2123  0581 2708          	jreq	L745
2124                     ; 348 							input_data = &lo_byte;
2126  0583 96            	ldw	x,sp
2127  0584 1c0006        	addw	x,#OFST-66
2128  0587 1f44          	ldw	(OFST-4,sp),x
2130                     ; 349 							idx = 0;
2132  0589 0f48          	clr	(OFST+0,sp)
2134  058b               L745:
2135                     ; 276 	for(i = 0; i < sizeof_input_data; i++) //pêtla koduj¹ca dane do postaci 4b6b i wpisuj¹ca te dane
2137  058b 0c47          	inc	(OFST-1,sp)
2139  058d               L574:
2142  058d 7b47          	ld	a,(OFST-1,sp)
2143  058f 1107          	cp	a,(OFST-65,sp)
2144  0591 2403          	jruge	L021
2145  0593 cc03c9        	jp	L174
2146  0596               L021:
2147                     ; 353 	return seq_tablePtr;
2149  0596 1e50          	ldw	x,(OFST+8,sp)
2152  0598 5b4a          	addw	sp,#74
2153  059a 81            	ret
2199                     ; 364 uint8_t RFM69H_SPI_read(uint8_t address)
2199                     ; 365 {
2200                     	switch	.text
2201  059b               _RFM69H_SPI_read:
2203  059b 88            	push	a
2204  059c 88            	push	a
2205       00000001      OFST:	set	1
2208                     ; 367 	GPIO_WriteLow(CS_RFM_Port, CS_RFM_Pin); //NSS modu³u RFM69H = Low - select module
2210  059d 4b10          	push	#16
2211  059f ae500a        	ldw	x,#20490
2212  05a2 cd0000        	call	_GPIO_WriteLow
2214  05a5 84            	pop	a
2215                     ; 368 	SPI_send_receive(address & 0x7F); //wys³anie MSB == Low (bêdzie odczyt) i 7-bit adresu do modu³u
2217  05a6 7b02          	ld	a,(OFST+1,sp)
2218  05a8 a47f          	and	a,#127
2219  05aa cd0000        	call	_SPI_send_receive
2221                     ; 369 	data = SPI_send_receive(0); //niby zapis w celu odczytu danej
2223  05ad 4f            	clr	a
2224  05ae cd0000        	call	_SPI_send_receive
2226  05b1 6b01          	ld	(OFST+0,sp),a
2228                     ; 370 	GPIO_WriteHigh(CS_RFM_Port, CS_RFM_Pin); //NSS modu³u RFM69H = High - deselect module
2230  05b3 4b10          	push	#16
2231  05b5 ae500a        	ldw	x,#20490
2232  05b8 cd0000        	call	_GPIO_WriteHigh
2234  05bb 84            	pop	a
2235                     ; 371 	return data;
2237  05bc 7b01          	ld	a,(OFST+0,sp)
2240  05be 85            	popw	x
2241  05bf 81            	ret
2278                     ; 381 void RFM69H_SPI_write(uint16_t address_data)
2278                     ; 382 {
2279                     	switch	.text
2280  05c0               _RFM69H_SPI_write:
2282  05c0 89            	pushw	x
2283       00000000      OFST:	set	0
2286                     ; 383 	GPIO_WriteLow(CS_RFM_Port, CS_RFM_Pin); //NSS modu³u RFM69H = Low - select module
2288  05c1 4b10          	push	#16
2289  05c3 ae500a        	ldw	x,#20490
2290  05c6 cd0000        	call	_GPIO_WriteLow
2292  05c9 84            	pop	a
2293                     ; 384 	SPI_send_receive((address_data >> 8) | 0x80); //wys³anie MSB == High (bêdzie zapis) i 7-bit adresu do modu³u
2295  05ca 7b01          	ld	a,(OFST+1,sp)
2296  05cc aa80          	or	a,#128
2297  05ce cd0000        	call	_SPI_send_receive
2299                     ; 385 	SPI_send_receive(address_data & 0xFF); //wys³anie danej do modu³u
2301  05d1 7b02          	ld	a,(OFST+2,sp)
2302  05d3 a4ff          	and	a,#255
2303  05d5 cd0000        	call	_SPI_send_receive
2305                     ; 386 	GPIO_WriteHigh(CS_RFM_Port, CS_RFM_Pin); //NSS modu³u RFM69H = High - deselect module
2307  05d8 4b10          	push	#16
2308  05da ae500a        	ldw	x,#20490
2309  05dd cd0000        	call	_GPIO_WriteHigh
2311  05e0 84            	pop	a
2312                     ; 387 }
2315  05e1 85            	popw	x
2316  05e2 81            	ret
2381                     ; 400 void BurstWrite(uint8_t adr, uint8_t *ptr, uint8_t length)
2381                     ; 401 { 
2382                     	switch	.text
2383  05e3               _BurstWrite:
2385  05e3 88            	push	a
2386  05e4 88            	push	a
2387       00000001      OFST:	set	1
2390                     ; 404   if(length <= 1)                             //length must more than one
2392  05e5 7b07          	ld	a,(OFST+6,sp)
2393  05e7 a102          	cp	a,#2
2394  05e9 2534          	jrult	L231
2395                     ; 405     return;
2397                     ; 408     GPIO_WriteLow(CS_RFM_Port, CS_RFM_Pin); //NSS modu³u RFM69H = Low - select module   
2399  05eb 4b10          	push	#16
2400  05ed ae500a        	ldw	x,#20490
2401  05f0 cd0000        	call	_GPIO_WriteLow
2403  05f3 84            	pop	a
2404                     ; 409     SPI_send_receive(adr | 0x80); //wys³anie MSB == High (bêdzie zapis) i 7-bit adresu do modu³u
2406  05f4 7b02          	ld	a,(OFST+1,sp)
2407  05f6 aa80          	or	a,#128
2408  05f8 cd0000        	call	_SPI_send_receive
2410                     ; 410     for (i = 0; i < length; i++)
2412  05fb 0f01          	clr	(OFST+0,sp)
2415  05fd 2011          	jra	L376
2416  05ff               L766:
2417                     ; 411 			SPI_send_receive(ptr[i]);
2419  05ff 7b05          	ld	a,(OFST+4,sp)
2420  0601 97            	ld	xl,a
2421  0602 7b06          	ld	a,(OFST+5,sp)
2422  0604 1b01          	add	a,(OFST+0,sp)
2423  0606 2401          	jrnc	L031
2424  0608 5c            	incw	x
2425  0609               L031:
2426  0609 02            	rlwa	x,a
2427  060a f6            	ld	a,(x)
2428  060b cd0000        	call	_SPI_send_receive
2430                     ; 410     for (i = 0; i < length; i++)
2432  060e 0c01          	inc	(OFST+0,sp)
2434  0610               L376:
2437  0610 7b01          	ld	a,(OFST+0,sp)
2438  0612 1107          	cp	a,(OFST+6,sp)
2439  0614 25e9          	jrult	L766
2440                     ; 412     GPIO_WriteHigh(CS_RFM_Port, CS_RFM_Pin); //NSS modu³u RFM69H = High - deselect module
2442  0616 4b10          	push	#16
2443  0618 ae500a        	ldw	x,#20490
2444  061b cd0000        	call	_GPIO_WriteHigh
2446  061e 84            	pop	a
2447                     ; 414 }
2448  061f               L231:
2451  061f 85            	popw	x
2452  0620 81            	ret
2526                     ; 428 u8 BurstRead(u8 adr, u8 *ptr, u8 length, u8 Break)
2526                     ; 429 {
2527                     	switch	.text
2528  0621               _BurstRead:
2530  0621 88            	push	a
2531  0622 88            	push	a
2532       00000001      OFST:	set	1
2535                     ; 431   if(length <= 1)                                            //length must more than one
2537  0623 7b07          	ld	a,(OFST+6,sp)
2538  0625 a102          	cp	a,#2
2539  0627 2403          	jruge	L537
2540                     ; 432     return 0;
2542  0629 4f            	clr	a
2544  062a 2037          	jra	L041
2545  062c               L537:
2546                     ; 435     GPIO_WriteLow(CS_RFM_Port, CS_RFM_Pin); //NSS modu³u RFM69H = Low - select module   
2548  062c 4b10          	push	#16
2549  062e ae500a        	ldw	x,#20490
2550  0631 cd0000        	call	_GPIO_WriteLow
2552  0634 84            	pop	a
2553                     ; 436     SPI_send_receive(adr & 0x7F); //wys³anie MSB == Low (bêdzie odczyt) i 7-bit adresu do modu³u
2555  0635 7b02          	ld	a,(OFST+1,sp)
2556  0637 a47f          	and	a,#127
2557  0639 cd0000        	call	_SPI_send_receive
2559                     ; 437     for(i = 0; i < length; i++)
2561  063c 0f01          	clr	(OFST+0,sp)
2564  063e 2027          	jra	L547
2565  0640               L147:
2566                     ; 439 			ptr[i] = SPI_send_receive(0);
2568  0640 7b05          	ld	a,(OFST+4,sp)
2569  0642 97            	ld	xl,a
2570  0643 7b06          	ld	a,(OFST+5,sp)
2571  0645 1b01          	add	a,(OFST+0,sp)
2572  0647 2401          	jrnc	L631
2573  0649 5c            	incw	x
2574  064a               L631:
2575  064a 02            	rlwa	x,a
2576  064b 89            	pushw	x
2577  064c 4f            	clr	a
2578  064d cd0000        	call	_SPI_send_receive
2580  0650 85            	popw	x
2581  0651 f7            	ld	(x),a
2582                     ; 440 			if (Break)
2584  0652 0d08          	tnz	(OFST+7,sp)
2585  0654 270f          	jreq	L157
2586                     ; 442 				i++; //by funkcja zwróci³a rzeczywist¹ iloœæ odczytanych bajtów 
2588  0656 0c01          	inc	(OFST+0,sp)
2590                     ; 443 				break;
2591  0658               L747:
2592                     ; 446     GPIO_WriteHigh(CS_RFM_Port, CS_RFM_Pin); //NSS modu³u RFM69H = High - deselect module
2594  0658 4b10          	push	#16
2595  065a ae500a        	ldw	x,#20490
2596  065d cd0000        	call	_GPIO_WriteHigh
2598  0660 84            	pop	a
2599                     ; 448 	return i;
2601  0661 7b01          	ld	a,(OFST+0,sp)
2603  0663               L041:
2605  0663 85            	popw	x
2606  0664 81            	ret
2607  0665               L157:
2608                     ; 437     for(i = 0; i < length; i++)
2610  0665 0c01          	inc	(OFST+0,sp)
2612  0667               L547:
2615  0667 7b01          	ld	a,(OFST+0,sp)
2616  0669 1107          	cp	a,(OFST+6,sp)
2617  066b 25d3          	jrult	L147
2618  066d 20e9          	jra	L747
2660                     ; 458 uint8_t config_RFM69H_for_TX(uint8_t RFM69_mode)
2660                     ; 459 {
2661                     	switch	.text
2662  066f               _config_RFM69H_for_TX:
2664  066f 88            	push	a
2665  0670 89            	pushw	x
2666       00000002      OFST:	set	2
2669                     ; 461 	GPIO_WriteHigh(RESET_RFM_Port, RESET_RFM_Pin); //== High - reset modu³u
2671  0671 4b08          	push	#8
2672  0673 ae500a        	ldw	x,#20490
2673  0676 cd0000        	call	_GPIO_WriteHigh
2675  0679 84            	pop	a
2676                     ; 462 	for(system_tick = 0; system_tick < 1;); //zaczekanie 1 ms
2678  067a 5f            	clrw	x
2679  067b bf0d          	ldw	_system_tick,x
2681  067d               L577:
2684  067d be0d          	ldw	x,_system_tick
2685  067f 27fc          	jreq	L577
2686                     ; 463 	GPIO_WriteLow(RESET_RFM_Port, RESET_RFM_Pin); //== Low - koniec resetu modu³u
2688  0681 4b08          	push	#8
2689  0683 ae500a        	ldw	x,#20490
2690  0686 cd0000        	call	_GPIO_WriteLow
2692  0689 84            	pop	a
2693                     ; 464 	for(system_tick = 0; system_tick < 6;); //zaczekanie 5 ms
2695  068a 5f            	clrw	x
2696  068b bf0d          	ldw	_system_tick,x
2698  068d               L5001:
2701  068d be0d          	ldw	x,_system_tick
2702  068f a30006        	cpw	x,#6
2703  0692 25f9          	jrult	L5001
2704                     ; 465 	RFM69H_EntryTx(RFM69_mode);
2706  0694 7b03          	ld	a,(OFST+1,sp)
2707  0696 cd0000        	call	_RFM69H_EntryTx
2709                     ; 466 	system_tick = 0;
2711  0699 5f            	clrw	x
2712  069a bf0d          	ldw	_system_tick,x
2714  069c 2021          	jra	L5101
2715  069e               L1101:
2716                     ; 469 		gb_SysTimer_1S = gb_SysTimer_1S - (system_tick / 1000);
2718  069e be0d          	ldw	x,_system_tick
2719  06a0 90ae03e8      	ldw	y,#1000
2720  06a4 65            	divw	x,y
2721  06a5 1f01          	ldw	(OFST-1,sp),x
2723  06a7 b600          	ld	a,_gb_SysTimer_1S
2724  06a9 5f            	clrw	x
2725  06aa 97            	ld	xl,a
2726  06ab 72f001        	subw	x,(OFST-1,sp)
2727  06ae 01            	rrwa	x,a
2728  06af b700          	ld	_gb_SysTimer_1S,a
2729  06b1 02            	rlwa	x,a
2730                     ; 470 		if (system_tick == 1000)
2732  06b2 be0d          	ldw	x,_system_tick
2733  06b4 a303e8        	cpw	x,#1000
2734  06b7 2603          	jrne	L1201
2735                     ; 471 		  system_tick = 0;
2737  06b9 5f            	clrw	x
2738  06ba bf0d          	ldw	_system_tick,x
2739  06bc               L1201:
2740                     ; 472 		RFM69H_TxWaitStable();
2742  06bc cd0000        	call	_RFM69H_TxWaitStable
2744  06bf               L5101:
2745                     ; 467 	while (gb_WaitStableFlag == 0x0F) //w tej pêtli oczekiwanie na gotowoœæ modu³u RFM69H do nadawania
2747  06bf b600          	ld	a,_gb_WaitStableFlag
2748  06c1 a10f          	cp	a,#15
2749  06c3 27d9          	jreq	L1101
2750                     ; 477 	return gb_WaitStableFlag;
2752  06c5 b600          	ld	a,_gb_WaitStableFlag
2755  06c7 5b03          	addw	sp,#3
2756  06c9 81            	ret
2759                     	switch	.ubsct
2760  0000               L3201_LED_old_state:
2761  0000 00            	ds.b	1
2804                     ; 493 void greenLEDblink_func(uint16_t LED_on_off)
2804                     ; 494 {
2805                     	switch	.text
2806  06ca               _greenLEDblink_func:
2808  06ca 89            	pushw	x
2809  06cb 89            	pushw	x
2810       00000002      OFST:	set	2
2813                     ; 496 	if (LED_old_state != (LED_on_off & 0x02)) //gdy zapamiêtany stan LED != od nowego, zadanego 
2815  06cc b600          	ld	a,L3201_LED_old_state
2816  06ce 5f            	clrw	x
2817  06cf 97            	ld	xl,a
2818  06d0 1f01          	ldw	(OFST-1,sp),x
2820  06d2 7b03          	ld	a,(OFST+1,sp)
2821  06d4 97            	ld	xl,a
2822  06d5 7b04          	ld	a,(OFST+2,sp)
2823  06d7 a402          	and	a,#2
2824  06d9 5f            	clrw	x
2825  06da 02            	rlwa	x,a
2826  06db 1301          	cpw	x,(OFST-1,sp)
2827  06dd 271a          	jreq	L7401
2828                     ; 498 		if (LED_on_off & 0x02)
2830  06df 7b04          	ld	a,(OFST+2,sp)
2831  06e1 a502          	bcp	a,#2
2832  06e3 270b          	jreq	L1501
2833                     ; 499 			GPIO_WriteLow(Green_LED_GPIO_Port, Green_LED_Pin);
2835  06e5 4b01          	push	#1
2836  06e7 ae500f        	ldw	x,#20495
2837  06ea cd0000        	call	_GPIO_WriteLow
2839  06ed 84            	pop	a
2841  06ee 2009          	jra	L7401
2842  06f0               L1501:
2843                     ; 501 			GPIO_WriteHigh(Green_LED_GPIO_Port, Green_LED_Pin);
2845  06f0 4b01          	push	#1
2846  06f2 ae500f        	ldw	x,#20495
2847  06f5 cd0000        	call	_GPIO_WriteHigh
2849  06f8 84            	pop	a
2850  06f9               L7401:
2851                     ; 503 	LED_old_state = (LED_on_off & 0x02); //i zapamiêtanie nowego stanu LED
2853  06f9 7b04          	ld	a,(OFST+2,sp)
2854  06fb a402          	and	a,#2
2855  06fd b700          	ld	L3201_LED_old_state,a
2856                     ; 504 }
2859  06ff 5b04          	addw	sp,#4
2860  0701 81            	ret
2863                     	switch	.ubsct
2864  0001               L7501_sent_sequence:
2865  0001 00            	ds.b	1
2866  0002               L3601_send_seq_cnt:
2867  0002 00            	ds.b	1
2868  0003               L5501_seq_to_send:
2869  0003 0000          	ds.b	2
2870  0005               L1601_setup_for_Tx:
2871  0005 00            	ds.b	1
2872  0006               L1701_dec:
2873  0006 00            	ds.b	1
2874  0007               L7601_inc:
2875  0007 00            	ds.b	1
2876  0008               L5601_nbr_seq:
2877  0008 00            	ds.b	1
3014                     ; 512 uint16_t send_sequence_func(uint8_t *seq_sent_successPtr)
3014                     ; 513 {
3015                     	switch	.text
3016  0702               _send_sequence_func:
3018  0702 89            	pushw	x
3019  0703 5203          	subw	sp,#3
3020       00000003      OFST:	set	3
3023                     ; 514 	int8_t	idx = 0;
3025  0705 0f03          	clr	(OFST+0,sp)
3027                     ; 523 	if ((pb4sem) && 
3027                     ; 524 			(!(sent_sequence))) //gdy jeszcze nie wys³ana sekwencja glikemii
3029  0707 3d0f          	tnz	_pb4sem
3030  0709 2603          	jrne	L202
3031  070b cc086b        	jp	L5511
3032  070e               L202:
3034  070e 3d01          	tnz	L7501_sent_sequence
3035  0710 2703          	jreq	L402
3036  0712 cc086b        	jp	L5511
3037  0715               L402:
3038                     ; 526 		GPIO_WriteLow(Red_LED_GPIO_Port, Red_LED_Pin); //zaœwiecenie czerwonej LED - pocz¹tek wysy³ania sekwecji
3040  0715 4b04          	push	#4
3041  0717 ae500f        	ldw	x,#20495
3042  071a cd0000        	call	_GPIO_WriteLow
3044  071d 84            	pop	a
3045                     ; 527 		if (!(setup_for_Tx)) //gdy setup do nadawania jeszcze nie zrobiony
3047  071e 3d05          	tnz	L1601_setup_for_Tx
3048  0720 2703          	jreq	L602
3049  0722 cc0839        	jp	L1711
3050  0725               L602:
3051                     ; 529 			memcpy(&inp_data_to_encode[idx], marker, sizeof(marker));
3053  0725 7b03          	ld	a,(OFST+0,sp)
3054  0727 ab1f          	add	a,#_inp_data_to_encode
3055  0729 5f            	clrw	x
3056  072a 97            	ld	xl,a
3057  072b bf00          	ldw	c_x,x
3058  072d ae0001        	ldw	x,#1
3059  0730               L051:
3060  0730 5a            	decw	x
3061  0731 d60000        	ld	a,(_marker,x)
3062  0734 92d700        	ld	([c_x],x),a
3063  0737 5d            	tnzw	x
3064  0738 26f6          	jrne	L051
3065                     ; 530 			idx = idx + sizeof(marker);
3067  073a 0c03          	inc	(OFST+0,sp)
3069                     ; 531 			memcpy(&inp_data_to_encode[idx], flag, sizeof(flag));
3071  073c 7b03          	ld	a,(OFST+0,sp)
3072  073e ab1f          	add	a,#_inp_data_to_encode
3073  0740 5f            	clrw	x
3074  0741 97            	ld	xl,a
3075  0742 bf00          	ldw	c_x,x
3076  0744 ae0001        	ldw	x,#1
3077  0747               L251:
3078  0747 5a            	decw	x
3079  0748 e600          	ld	a,(_flag,x)
3080  074a 92d700        	ld	([c_x],x),a
3081  074d 5d            	tnzw	x
3082  074e 26f7          	jrne	L251
3083                     ; 532 			idx = idx + sizeof(flag);
3085  0750 0c03          	inc	(OFST+0,sp)
3087                     ; 533 			memcpy(&inp_data_to_encode[idx], sensor_ID, sizeof(sensor_ID));
3089  0752 7b03          	ld	a,(OFST+0,sp)
3090  0754 ab1f          	add	a,#_inp_data_to_encode
3091  0756 5f            	clrw	x
3092  0757 97            	ld	xl,a
3093  0758 bf00          	ldw	c_x,x
3094  075a ae0003        	ldw	x,#3
3095  075d               L451:
3096  075d 5a            	decw	x
3097  075e e601          	ld	a,(_sensor_ID,x)
3098  0760 92d700        	ld	([c_x],x),a
3099  0763 5d            	tnzw	x
3100  0764 26f7          	jrne	L451
3101                     ; 534 			idx = idx + sizeof(sensor_ID);
3103  0766 7b03          	ld	a,(OFST+0,sp)
3104  0768 ab03          	add	a,#3
3105  076a 6b03          	ld	(OFST+0,sp),a
3107                     ; 535 			memcpy(&inp_data_to_encode[idx], firmware, sizeof(firmware));
3109  076c 7b03          	ld	a,(OFST+0,sp)
3110  076e ab1f          	add	a,#_inp_data_to_encode
3111  0770 5f            	clrw	x
3112  0771 97            	ld	xl,a
3113  0772 bf00          	ldw	c_x,x
3114  0774 ae0001        	ldw	x,#1
3115  0777               L651:
3116  0777 5a            	decw	x
3117  0778 e604          	ld	a,(_firmware,x)
3118  077a 92d700        	ld	([c_x],x),a
3119  077d 5d            	tnzw	x
3120  077e 26f7          	jrne	L651
3121                     ; 536 			idx = idx + sizeof(firmware);
3123  0780 0c03          	inc	(OFST+0,sp)
3125                     ; 537 			memcpy(&inp_data_to_encode[idx], any_data, sizeof(any_data));
3127  0782 7b03          	ld	a,(OFST+0,sp)
3128  0784 ab1f          	add	a,#_inp_data_to_encode
3129  0786 5f            	clrw	x
3130  0787 97            	ld	xl,a
3131  0788 bf00          	ldw	c_x,x
3132  078a ae0002        	ldw	x,#2
3133  078d               L061:
3134  078d 5a            	decw	x
3135  078e e605          	ld	a,(_any_data,x)
3136  0790 92d700        	ld	([c_x],x),a
3137  0793 5d            	tnzw	x
3138  0794 26f7          	jrne	L061
3139                     ; 538 			idx = idx + sizeof(any_data);
3141  0796 0c03          	inc	(OFST+0,sp)
3142  0798 0c03          	inc	(OFST+0,sp)
3144                     ; 539 			memcpy(&inp_data_to_encode[idx], sequence, sizeof(sequence));
3146  079a 7b03          	ld	a,(OFST+0,sp)
3147  079c ab1f          	add	a,#_inp_data_to_encode
3148  079e 5f            	clrw	x
3149  079f 97            	ld	xl,a
3150  07a0 bf00          	ldw	c_x,x
3151  07a2 ae0001        	ldw	x,#1
3152  07a5               L261:
3153  07a5 5a            	decw	x
3154  07a6 e607          	ld	a,(_sequence,x)
3155  07a8 92d700        	ld	([c_x],x),a
3156  07ab 5d            	tnzw	x
3157  07ac 26f7          	jrne	L261
3158                     ; 540 			idx = idx + sizeof(sequence);
3160  07ae 0c03          	inc	(OFST+0,sp)
3162                     ; 541 			memcpy(&inp_data_to_encode[idx], raw_data, sizeof(raw_data));
3164  07b0 7b03          	ld	a,(OFST+0,sp)
3165  07b2 ab1f          	add	a,#_inp_data_to_encode
3166  07b4 5f            	clrw	x
3167  07b5 97            	ld	xl,a
3168  07b6 bf00          	ldw	c_x,x
3169  07b8 ae0002        	ldw	x,#2
3170  07bb               L461:
3171  07bb 5a            	decw	x
3172  07bc e608          	ld	a,(_raw_data,x)
3173  07be 92d700        	ld	([c_x],x),a
3174  07c1 5d            	tnzw	x
3175  07c2 26f7          	jrne	L461
3176                     ; 542 			idx = idx + sizeof(raw_data);
3178  07c4 0c03          	inc	(OFST+0,sp)
3179  07c6 0c03          	inc	(OFST+0,sp)
3181                     ; 543 			memcpy(&inp_data_to_encode[idx], inp_seq, sizeof(inp_seq));
3183  07c8 7b03          	ld	a,(OFST+0,sp)
3184  07ca ab1f          	add	a,#_inp_data_to_encode
3185  07cc 5f            	clrw	x
3186  07cd 97            	ld	xl,a
3187  07ce bf00          	ldw	c_x,x
3188  07d0 ae0015        	ldw	x,#21
3189  07d3               L661:
3190  07d3 5a            	decw	x
3191  07d4 e60a          	ld	a,(_inp_seq,x)
3192  07d6 92d700        	ld	([c_x],x),a
3193  07d9 5d            	tnzw	x
3194  07da 26f7          	jrne	L661
3195                     ; 544 			idx = idx + sizeof(inp_seq);
3197  07dc 7b03          	ld	a,(OFST+0,sp)
3198  07de ab15          	add	a,#21
3199  07e0 6b03          	ld	(OFST+0,sp),a
3201                     ; 545 			seq_to_send = modified_encode_4b6b_command_params_for_Tx(inp_data_to_encode, idx, seq_to_send); //wpisanie enkodowanych wartoœci do tablicy seq_to_send
3203  07e2 be03          	ldw	x,L5501_seq_to_send
3204  07e4 89            	pushw	x
3205  07e5 7b05          	ld	a,(OFST+2,sp)
3206  07e7 88            	push	a
3207  07e8 ae001f        	ldw	x,#_inp_data_to_encode
3208  07eb cd004d        	call	_modified_encode_4b6b_command_params_for_Tx
3210  07ee 5b03          	addw	sp,#3
3211  07f0 bf03          	ldw	L5501_seq_to_send,x
3212                     ; 547 			if (config_RFM69H_for_TX(PACKET)) //modu³ jest gotowy do wys³ania komendy po konfigu
3214  07f2 a601          	ld	a,#1
3215  07f4 cd066f        	call	_config_RFM69H_for_TX
3217  07f7 4d            	tnz	a
3218  07f8 2727          	jreq	L1611
3219                     ; 549 				GPIO_WriteHigh(Red_LED_GPIO_Port, Red_LED_Pin); //zgaszenie czerwonej LED
3221  07fa 4b04          	push	#4
3222  07fc ae500f        	ldw	x,#20495
3223  07ff cd0000        	call	_GPIO_WriteHigh
3225  0802 84            	pop	a
3226                     ; 550 				setup_for_Tx = true; //by ju¿ nie powtarzaæ konfigu modu³u RFM69H
3228  0803 35010005      	mov	L1601_setup_for_Tx,#1
3229                     ; 551 				send_seq_cnt = 0; //wyzerowanie licznika wys³añ komendy
3231  0807 3f02          	clr	L3601_send_seq_cnt
3232                     ; 552 				GPIO_Init(DIO_RFM_Port, DIO1_RFM_Pin, GPIO_MODE_IN_PU_IT); /*PC1 bêdzie wyzwalaæ przerwanie zboczem narastaj¹cym
3234  0809 4b60          	push	#96
3235  080b 4b02          	push	#2
3236  080d ae500a        	ldw	x,#20490
3237  0810 cd0000        	call	_GPIO_Init
3239  0813 85            	popw	x
3240                     ; 554 				GPIO_Init(DIO_RFM_Port, DIO0_RFM_Pin, GPIO_MODE_IN_PU_IT); /*PC2 bêdzie wyzwalaæ przerwanie zboczem narastaj¹cym
3242  0814 4b60          	push	#96
3243  0816 4b04          	push	#4
3244  0818 ae500a        	ldw	x,#20490
3245  081b cd0000        	call	_GPIO_Init
3247  081e 85            	popw	x
3249  081f 204a          	jra	L5511
3250  0821               L1611:
3251                     ; 559 				setup_for_Tx = false;  
3253  0821 3f05          	clr	L1601_setup_for_Tx
3254                     ; 560 				GPIO_WriteLow(Red_LED_GPIO_Port, Red_LED_Pin); //czerwona LED bêdzie stale œwieciæ - problem z konfigiem modu³u RFM69H
3256  0823 4b04          	push	#4
3257  0825 ae500f        	ldw	x,#20495
3258  0828 cd0000        	call	_GPIO_WriteLow
3260  082b 84            	pop	a
3261                     ; 561 				free(seq_to_send);
3263  082c be03          	ldw	x,L5501_seq_to_send
3264  082e cd0000        	call	_free
3266                     ; 562 				seq_to_send = NULL;
3268  0831 5f            	clrw	x
3269  0832 bf03          	ldw	L5501_seq_to_send,x
3270                     ; 563 				*seq_sent_successPtr = false; //nie uda³o siê wys³aæ komendy budz¹cej pompê
3272  0834 1e04          	ldw	x,(OFST+1,sp)
3273  0836 7f            	clr	(x)
3274  0837 2032          	jra	L5511
3275  0839               L1711:
3276                     ; 568 			while(start_TX_RX_seq_sem); //zaczekanie na gotowoœæ przyjêcia nowych danych przez FIFO
3278  0839 3d0a          	tnz	_start_TX_RX_seq_sem
3279  083b 26fc          	jrne	L1711
3280                     ; 569 			BurstWrite(0x00, seq_to_send, 52); //wys³anie sekwencji komendy do FIFO
3282  083d 4b34          	push	#52
3283  083f be03          	ldw	x,L5501_seq_to_send
3284  0841 89            	pushw	x
3285  0842 4f            	clr	a
3286  0843 cd05e3        	call	_BurstWrite
3288  0846 5b03          	addw	sp,#3
3290  0848               L7711:
3291                     ; 570 			while(!(end_TX_RX_seq_sem)); //zaczekanie na koniec transmisji danych z FIFO przez modu³ RFM69H
3293  0848 3d09          	tnz	_end_TX_RX_seq_sem
3294  084a 27fc          	jreq	L7711
3295                     ; 571 			send_seq_cnt++;
3297  084c 3c02          	inc	L3601_send_seq_cnt
3298                     ; 572 			if (send_seq_cnt > 0x80)
3300  084e b602          	ld	a,L3601_send_seq_cnt
3301  0850 a181          	cp	a,#129
3302  0852 2506          	jrult	L3021
3303                     ; 573 				sent_sequence = true;  //koniec wysy³ania sekwencji
3305  0854 35010001      	mov	L7501_sent_sequence,#1
3307  0858 2002          	jra	L5021
3308  085a               L3021:
3309                     ; 575 				sent_sequence = false;  //by przygotowaæ do powtórki wysy³ania sekwencji glikemii
3311  085a 3f01          	clr	L7501_sent_sequence
3312  085c               L5021:
3313                     ; 576 			end_TX_RX_seq_sem = 0; //wyczyszczenie znacznika koñca transmisji danych z FIFO
3315  085c 3f09          	clr	_end_TX_RX_seq_sem
3316                     ; 577 			start_TX_RX_seq_sem = 0; //wyczyszczenie znacznika pocz¹tku zapisu danych do FIFO
3318  085e 3f0a          	clr	_start_TX_RX_seq_sem
3319                     ; 578 			if (sent_sequence) //gdy ju¿ wys³ana sekwencja glikemii
3321  0860 3d01          	tnz	L7501_sent_sequence
3322  0862 2707          	jreq	L5511
3323                     ; 580 				setup_for_Tx = false; //by przygotowaæ do ponownego setupu modu³u RFM69H do nadawania
3325  0864 3f05          	clr	L1601_setup_for_Tx
3326                     ; 581 				send_seq_cnt = 0;
3328  0866 3f02          	clr	L3601_send_seq_cnt
3329                     ; 582 				RFM69H_Sleep(); //prze³¹czenie RFM69H w tryb Sleep
3331  0868 cd0000        	call	_RFM69H_Sleep
3333  086b               L5511:
3334                     ; 586 	if ((pb4sem) && //gdy ma byæ wys³ana kolejna sekwencja
3334                     ; 587 			(sent_sequence))
3336  086b 3d0f          	tnz	_pb4sem
3337  086d 2603          	jrne	L012
3338  086f cc0924        	jp	L1121
3339  0872               L012:
3341  0872 3d01          	tnz	L7501_sent_sequence
3342  0874 2603          	jrne	L212
3343  0876 cc0924        	jp	L1121
3344  0879               L212:
3345                     ; 589 		idx = sizeof(inp_seq) - 3; //indeks ostatniej dwójki bajtów przed koñcz¹cym zerem w inp_seq
3347  0879 a612          	ld	a,#18
3348  087b 6b03          	ld	(OFST+0,sp),a
3351  087d 2026          	jra	L7121
3352  087f               L3121:
3353                     ; 592 			memcpy(&inp_seq[idx], &inp_seq[idx - 2], 2);
3355  087f ae0002        	ldw	x,#2
3356  0882 89            	pushw	x
3357  0883 7b05          	ld	a,(OFST+2,sp)
3358  0885 5f            	clrw	x
3359  0886 4d            	tnz	a
3360  0887 2a01          	jrpl	L071
3361  0889 53            	cplw	x
3362  088a               L071:
3363  088a 97            	ld	xl,a
3364  088b 5a            	decw	x
3365  088c 5a            	decw	x
3366  088d 01            	rrwa	x,a
3367  088e ab0a          	add	a,#_inp_seq
3368  0890 2401          	jrnc	L271
3369  0892 5c            	incw	x
3370  0893               L271:
3371  0893 5f            	clrw	x
3372  0894 97            	ld	xl,a
3373  0895 89            	pushw	x
3374  0896 7b07          	ld	a,(OFST+4,sp)
3375  0898 ab0a          	add	a,#_inp_seq
3376  089a 5f            	clrw	x
3377  089b 97            	ld	xl,a
3378  089c cd0000        	call	_memcpy
3380  089f 5b04          	addw	sp,#4
3381                     ; 593 			idx = idx - 2;
3383  08a1 0a03          	dec	(OFST+0,sp)
3384  08a3 0a03          	dec	(OFST+0,sp)
3386  08a5               L7121:
3387                     ; 590 		while ((idx - 2) >= 6) //pêtla przesuwaj¹ca dwójki bajtów w tablicy inp_seq z pozycji (idx - 2) na pozycjê idx
3387                     ; 591 		{  //wykonuje siê tak d³ugo, a¿ (idx - 2) < 6
3387                     ; 592 			memcpy(&inp_seq[idx], &inp_seq[idx - 2], 2);
3387                     ; 593 			idx = idx - 2;
3389  08a5 9c            	rvf
3390  08a6 7b03          	ld	a,(OFST+0,sp)
3391  08a8 5f            	clrw	x
3392  08a9 4d            	tnz	a
3393  08aa 2a01          	jrpl	L471
3394  08ac 53            	cplw	x
3395  08ad               L471:
3396  08ad 97            	ld	xl,a
3397  08ae 5a            	decw	x
3398  08af 5a            	decw	x
3399  08b0 a30006        	cpw	x,#6
3400  08b3 2eca          	jrsge	L3121
3401                     ; 595 		memcpy(&inp_seq[idx], inp_seq, 2); //przesuniêcie dwójki bajtów z pocz¹tku tablicy inp_seq na pozycjê wskazywan¹ przez idx(pominiêcie nastêpnych 4 bajtów za pocz¹tkow¹ dwójk¹)
3403  08b5 7b03          	ld	a,(OFST+0,sp)
3404  08b7 ab0a          	add	a,#_inp_seq
3405  08b9 5f            	clrw	x
3406  08ba 97            	ld	xl,a
3407  08bb bf00          	ldw	c_x,x
3408  08bd ae0002        	ldw	x,#2
3409  08c0               L671:
3410  08c0 5a            	decw	x
3411  08c1 e60a          	ld	a,(_inp_seq,x)
3412  08c3 92d700        	ld	([c_x],x),a
3413  08c6 5d            	tnzw	x
3414  08c7 26f7          	jrne	L671
3415                     ; 596 		memcpy(inp_seq, raw_data, 2); //i skopiowanie na pocz¹tek tablicy inp_seq dwójki bajtów z tablicy raw_data
3417  08c9 ae0002        	ldw	x,#2
3418  08cc               L002:
3419  08cc e607          	ld	a,(_raw_data-1,x)
3420  08ce e709          	ld	(_inp_seq-1,x),a
3421  08d0 5a            	decw	x
3422  08d1 26f9          	jrne	L002
3423                     ; 597 		nbr_seq = (nbr_seq + 0x10) & 0x70; //zwiêkszenie numeru sekwencji (starsze 3 bity) i wyzerowanie znacznika powtórki tej samej sekwencji (4 m³odsze bity)
3425  08d3 b608          	ld	a,L5601_nbr_seq
3426  08d5 ab10          	add	a,#16
3427  08d7 a470          	and	a,#112
3428  08d9 b708          	ld	L5601_nbr_seq,a
3429                     ; 598 		sequence[0] = nbr_seq & 0x70;
3431  08db b608          	ld	a,L5601_nbr_seq
3432  08dd a470          	and	a,#112
3433  08df b707          	ld	_sequence,a
3434                     ; 599 		word = (raw_data[0] << 8) | raw_data[1];
3436  08e1 b608          	ld	a,_raw_data
3437  08e3 5f            	clrw	x
3438  08e4 97            	ld	xl,a
3439  08e5 b609          	ld	a,_raw_data+1
3440  08e7 02            	rlwa	x,a
3441  08e8 1f01          	ldw	(OFST-2,sp),x
3443                     ; 600 		if (word >= 6000)
3445  08ea 1e01          	ldw	x,(OFST-2,sp)
3446  08ec a31770        	cpw	x,#6000
3447  08ef 2506          	jrult	L3221
3448                     ; 602 			dec = true;
3450  08f1 35010006      	mov	L1701_dec,#1
3451                     ; 603 			inc = false;
3453  08f5 3f07          	clr	L7601_inc
3454  08f7               L3221:
3455                     ; 605 		if (word <= 3000)
3457  08f7 1e01          	ldw	x,(OFST-2,sp)
3458  08f9 a30bb9        	cpw	x,#3001
3459  08fc 2406          	jruge	L5221
3460                     ; 607 			dec = false;
3462  08fe 3f06          	clr	L1701_dec
3463                     ; 608 			inc = true;
3465  0900 35010007      	mov	L7601_inc,#1
3466  0904               L5221:
3467                     ; 610 		if (inc)
3469  0904 3d07          	tnz	L7601_inc
3470  0906 2707          	jreq	L7221
3471                     ; 611 			word = word + 375;
3473  0908 1e01          	ldw	x,(OFST-2,sp)
3474  090a 1c0177        	addw	x,#375
3475  090d 1f01          	ldw	(OFST-2,sp),x
3477  090f               L7221:
3478                     ; 612 		if (dec)
3480  090f 3d06          	tnz	L1701_dec
3481  0911 2707          	jreq	L1321
3482                     ; 613 			word = word - 375;
3484  0913 1e01          	ldw	x,(OFST-2,sp)
3485  0915 1d0177        	subw	x,#375
3486  0918 1f01          	ldw	(OFST-2,sp),x
3488  091a               L1321:
3489                     ; 614 		raw_data[0] = word >> 8;
3491  091a 7b01          	ld	a,(OFST-2,sp)
3492  091c b708          	ld	_raw_data,a
3493                     ; 615 		raw_data[1] = word & 0xFF;
3495  091e 7b02          	ld	a,(OFST-1,sp)
3496  0920 a4ff          	and	a,#255
3497  0922 b709          	ld	_raw_data+1,a
3498  0924               L1121:
3499                     ; 617 	if ((pb4sem) && //przygotowanie do wys³ania nastêpnej sekwencji po naciœniêciu przycisku
3499                     ; 618 			(sent_sequence))
3501  0924 3d0f          	tnz	_pb4sem
3502  0926 2711          	jreq	L3321
3504  0928 3d01          	tnz	L7501_sent_sequence
3505  092a 270d          	jreq	L3321
3506                     ; 620 		GPIO_WriteHigh(Red_LED_GPIO_Port, Red_LED_Pin); //zgaszenie czerwonej LED
3508  092c 4b04          	push	#4
3509  092e ae500f        	ldw	x,#20495
3510  0931 cd0000        	call	_GPIO_WriteHigh
3512  0934 84            	pop	a
3513                     ; 621 		sent_sequence = false;
3515  0935 3f01          	clr	L7501_sent_sequence
3516                     ; 622 		pb4sem = false;
3518  0937 3f0f          	clr	_pb4sem
3519  0939               L3321:
3520                     ; 624 	return send_seq_cnt;
3522  0939 b602          	ld	a,L3601_send_seq_cnt
3523  093b 5f            	clrw	x
3524  093c 97            	ld	xl,a
3527  093d 5b05          	addw	sp,#5
3528  093f 81            	ret
3719                     	xdef	_config_RFM69H_for_TX
3720                     	xdef	_BurstRead
3721                     	xdef	_BurstWrite
3722                     	xdef	_encode_4b6b_command_params_for_Tx
3723                     	xdef	_modified_encode_4b6b_command_params_for_Tx
3724                     	xdef	_crc16
3725                     	xdef	_seq_to_send
3726                     	xdef	_inp_data_to_encode
3727                     	xdef	_inp_seq
3728                     	xdef	_raw_data
3729                     	xdef	_sequence
3730                     	xdef	_any_data
3731                     	xdef	_firmware
3732                     	xdef	_sensor_ID
3733                     	xdef	_flag
3734                     	xdef	_marker
3735                     	xref	_RFM69H_TxWaitStable
3736                     	xref	_RFM69H_Sleep
3737                     	xref	_RFM69H_EntryTx
3738                     	xref.b	_gb_SysTimer_1S
3739                     	xref.b	_gb_WaitStableFlag
3740                     	xref	_free
3741                     	xref	_calloc
3742                     	xref	_memcpy
3743                     	xref	_memcmp
3744                     	xref	_SPI_send_receive
3745                     	xdef	_send_sequence_func
3746                     	xdef	_greenLEDblink_func
3747                     	xdef	_RFM69H_SPI_read
3748                     	xdef	_RFM69H_SPI_write
3749                     	switch	.ubsct
3750  0009               _end_TX_RX_seq_sem:
3751  0009 00            	ds.b	1
3752                     	xdef	_end_TX_RX_seq_sem
3753  000a               _start_TX_RX_seq_sem:
3754  000a 00            	ds.b	1
3755                     	xdef	_start_TX_RX_seq_sem
3756  000b               _tick_500ms:
3757  000b 0000          	ds.b	2
3758                     	xdef	_tick_500ms
3759  000d               _system_tick:
3760  000d 0000          	ds.b	2
3761                     	xdef	_system_tick
3762  000f               _pb4sem:
3763  000f 00            	ds.b	1
3764                     	xdef	_pb4sem
3765                     	xref	_GPIO_WriteLow
3766                     	xref	_GPIO_WriteHigh
3767                     	xref	_GPIO_Init
3768                     	xref.b	c_lreg
3769                     	xref.b	c_x
3789                     	xref	c_lursh
3790                     	xref	c_ltor
3791                     	xref	c_lgor
3792                     	xref	c_lglsh
3793                     	end
