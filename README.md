# Machine

A norns sequencer/computer with 255 instructions.

<img src='https://github.com/neauoire/punchcard/blob/master/PREVIEW.jpg?raw=true' width='600'/>

## Commands

```
00000001  SETNOTEC
00000010  SENDCHAN1
00000011  IFNOTEC
00000100  DODECR1
00000101  SETOCT1
00000110  SENDOSC1
00000111  IFOCT1
00001000  DOINCR1
00001001  SETVEL1
00001010  SENDSYS1
00001011  IFSTEP1
00001100  DOCLAMP1
00001101  SETRATE1
00001110  SENDBANG1
00001111  IFBANG1
00010000  DOLIMIT2
00010001  SETNOTEc
00010010  SENDCHAN2
00010011  IFNOTEc
00010100  DODECR2
00010101  SETOCT2
00010110  SENDOSC2
00010111  IFOCT2
00011000  DOINCR2
00011001  SETVEL2
00011010  SENDSYS2
00011011  IFSTEP2
00011100  DOCLAMP2
00011101  SETRATE2
00011110  SENDBANG2
00011111  IFBANG2
00100000  DOLIMIT3
00100001  SETNOTED
00100010  SENDCHAN3
00100011  IFNOTED
00100100  DODECR3
00100101  SETOCT3
00100110  SENDOSC3
00100111  IFOCT3
00101000  DOINCR3
00101001  SETVEL3
00101010  SENDSYS3
00101011  IFSTEP3
00101100  DOCLAMP3
00101101  SETRATE3
00101110  SENDBANG3
00101111  IFBANG3
00110000  DOLIMIT4
00110001  SETNOTEd
00110010  SENDCHAN4
00110011  IFNOTEd
00110100  DODECR4
00110101  SETOCT4
00110110  SENDOSC4
00110111  IFOCT4
00111000  DOINCR4
00111001  SETVEL4
00111010  SENDSYS4
00111011  IFSTEP4
00111100  DOCLAMP4
00111101  SETRATE4
00111110  SENDBANG4
00111111  IFBANG4
01000000  DOLIMIT5
01000001  SETNOTEE
01000010  SENDCHAN5
01000011  IFNOTEE
01000100  DODECR5
01000101  SETOCT5
01000110  SENDOSC5
01000111  IFOCT5
01001000  DOINCR5
01001001  SETVEL5
01001010  SENDSYS5
01001011  IFSTEP5
01001100  DOCLAMP5
01001101  SETRATE5
01001110  SENDBANG5
01001111  IFBANG5
01010000  DOLIMIT6
01010001  SETNOTEF
01010010  SENDCHAN6
01010011  IFNOTEF
01010100  DODECR6
01010101  SETOCT6
01010110  SENDOSC6
01010111  IFOCT6
01011000  DOINCR6
01011001  SETVEL6
01011010  SENDSYS6
01011011  IFSTEP6
01011100  DOCLAMP6
01011101  SETRATE6
01011110  SENDBANG6
01011111  IFBANG6
01100000  DOLIMIT7
01100001  SETNOTEf
01100010  SENDCHAN7
01100011  IFNOTEf
01100100  DODECR7
01100101  SETOCT7
01100110  SENDOSC7
01100111  IFOCT7
01101000  DOINCR7
01101001  SETVEL7
01101010  SENDSYS7
01101011  IFSTEP7
01101100  DOCLAMP7
01101101  SETRATE7
01101110  SENDBANG7
01101111  IFBANG7
01110000  DOLIMIT8
01110001  SETNOTEG
01110010  SENDCHAN8
01110011  IFNOTEG
01110100  DODECR8
01110101  SETOCT8
01110110  SENDOSC8
01110111  IFOCT8
01111000  DOINCR8
01111001  SETVEL8
01111010  SENDSYS8
01111011  IFSTEP8
01111100  DOCLAMP8
01111101  SETRATE8
01111110  SENDBANG8
01111111  IFBANG8
10000000  DOLIMIT9
10000001  SETNOTEg
10000010  SENDCHAN9
10000011  IFNOTEg
10000100  DODECR9
10000101  SETOCT1
10000110  SENDOSC9
10000111  IFOCT9
10001000  DOINCR9
10001001  SETVEL9
10001010  SENDSYS9
10001011  IFSTEP9
10001100  DOCLAMP9
10001101  SETRATE9
10001110  SENDBANG9
10001111  IFBANG9
10010000  DOLIMIT10
10010001  SETNOTEA
10010010  SENDCHAN10
10010011  IFNOTEA
10010100  DODECR10
10010101  SETOCT2
10010110  SENDOSC10
10010111  IFOCT10
10011000  DOINCR10
10011001  SETVEL10
10011010  SENDSYS10
10011011  IFSTEP10
10011100  DOCLAMP10
10011101  SETRATE10
10011110  SENDBANG10
10011111  IFBANG10
10100000  DOLIMIT11
10100001  SETNOTEa
10100010  SENDCHAN11
10100011  IFNOTEa
10100100  DODECR11
10100101  SETOCT3
10100110  SENDOSC11
10100111  IFOCT11
10101000  DOINCR11
10101001  SETVEL11
10101010  SENDSYS11
10101011  IFSTEP11
10101100  DOCLAMP11
10101101  SETRATE11
10101110  SENDBANG11
10101111  IFBANG11
10110000  DOLIMIT12
10110001  SETNOTEB
10110010  SENDCHAN12
10110011  IFNOTEB
10110100  DODECR12
10110101  SETOCT4
10110110  SENDOSC12
10110111  IFOCT12
10111000  DOINCR12
10111001  SETVEL12
10111010  SENDSYS12
10111011  IFSTEP12
10111100  DOCLAMP12
10111101  SETRATE12
10111110  SENDBANG12
10111111  IFBANG12
11000000  DOLIMIT13
11000001  SETNOTEC
11000010  SENDCHAN13
11000011  IFNOTEC
11000100  DODECR13
11000101  SETOCT5
11000110  SENDOSC13
11000111  IFOCT13
11001000  DOINCR13
11001001  SETVEL13
11001010  SENDSYS13
11001011  IFSTEP13
11001100  DOCLAMP13
11001101  SETRATE13
11001110  SENDBANG13
11001111  IFBANG13
11010000  DOLIMIT14
11010001  SETNOTEc
11010010  SENDCHAN14
11010011  IFNOTEc
11010100  DODECR14
11010101  SETOCT6
11010110  SENDOSC14
11010111  IFOCT14
11011000  DOINCR14
11011001  SETVEL14
11011010  SENDSYS14
11011011  IFSTEP14
11011100  DOCLAMP14
11011101  SETRATE14
11011110  SENDBANG14
11011111  IFBANG14
11100000  DOLIMIT15
11100001  SETNOTED
11100010  SENDCHAN15
11100011  IFNOTED
11100100  DODECR15
11100101  SETOCT7
11100110  SENDOSC15
11100111  IFOCT15
11101000  DOINCR15
11101001  SETVEL15
11101010  SENDSYS15
11101011  IFSTEP15
11101100  DOCLAMP15
11101101  SETRATE15
11101110  SENDBANG15
11101111  IFBANG15
11110000  DOLIMIT16
11110001  SETNOTEd
11110010  SENDCHAN16
11110011  IFNOTEd
11110100  DODECR16
11110101  SETOCT8
11110110  SENDOSC16
11110111  IFOCT16
11111000  DOINCR16
11111001  SETVEL16
11111010  SENDSYS16
11111011  IFSTEP16
11111100  DOCLAMP16
11111101  SETRATE16
11111110  SENDBANG16
11111111  IFBANG16
```
