; Source: rom_samples/si.a26
; Disassembled by 8080Emulator-Util

; 8080 Assembler		| Rom in hex
;---------------------------------------------
ADD L                         ; [0x0000]   85
DCX H                         ; [0x0001]   2B
ANA L                         ; [0x0002]   A5
ADD H                         ; [0x0003]   84
SIM                           ; [0x0004]   30
NOP                           ; [0x0005]   00
DAD H                         ; [0x0006]   29
RRC                           ; [0x0007]   0F
XRA D                         ; [0x0008]   AA
JZ #FD10h                     ; [0x0009]   CA 10 FD
ORA C                         ; [0x000C]   B1
RM                            ; [0x000D]   F8
XRA D                         ; [0x000E]   AA
ORA C                         ; [0x000F]   B1
XRI #85h                      ; [0x0010]   EE 85
DCX D                         ; [0x0012]   1B
ORA C                         ; [0x0013]   B1
RP                            ; [0x0014]   F0
ADD L                         ; [0x0015]   85
INR E                         ; [0x0016]   1C
ORA C                         ; [0x0017]   B1
JP #1B85h                     ; [0x0018]   F2 85 1B
ORA C                         ; [0x001B]   B1
CP #1C85h                     ; [0x001C]   F4 85 1C
ORA C                         ; [0x001F]   B1
ORI #85h                      ; [0x0020]   F6 85
DCX D                         ; [0x0022]   1B
ADC D                         ; [0x0023]   8A
ADD L                         ; [0x0024]   85
INR E                         ; [0x0025]   1C
ADD L                         ; [0x0026]   85
DCX D                         ; [0x0027]   1B
ADI #89h                      ; [0x0028]   C6 89
ADC B                         ; [0x002A]   88
MOV C, B                      ; [0x002B]   48
MOV L, B                      ; [0x002C]   68
MOV C, B                      ; [0x002D]   48
MOV L, B                      ; [0x002E]   68
ORA C                         ; [0x002F]   B1
RM                            ; [0x0030]   F8
XRA D                         ; [0x0031]   AA
ORA C                         ; [0x0032]   B1
XRI #85h                      ; [0x0033]   EE 85
DCX D                         ; [0x0035]   1B
ORA C                         ; [0x0036]   B1
RP                            ; [0x0037]   F0
ADD L                         ; [0x0038]   85
INR E                         ; [0x0039]   1C
ORA C                         ; [0x003A]   B1
JP #1B85h                     ; [0x003B]   F2 85 1B
ORA C                         ; [0x003E]   B1
CP #1C85h                     ; [0x003F]   F4 85 1C
ORA C                         ; [0x0042]   B1
ORI #85h                      ; [0x0043]   F6 85
DCX D                         ; [0x0045]   1B
ADC D                         ; [0x0046]   8A
ADD L                         ; [0x0047]   85
INR E                         ; [0x0048]   1C
ADD L                         ; [0x0049]   85
DCX D                         ; [0x004A]   1B
ANA L                         ; [0x004B]   A5
ADC C                         ; [0x004C]   89
RET                           ; [0x004D]   C9
INR B                         ; [0x004E]   04
SUB B                         ; [0x004F]   90
INR B                         ; [0x0050]   04
XRA C                         ; [0x0051]   A9
NOP                           ; [0x0052]   00
ORA B                         ; [0x0053]   B0
INX B                         ; [0x0054]   03
JPE #02A9h                    ; [0x0055]   EA A9 02
ADC L                         ; [0x0058]   8D
RAR                           ; [0x0059]   1F
NOP                           ; [0x005A]   00
ADC B                         ; [0x005B]   88
NOP                           ; [0x005C]   10
XRA M                         ; [0x005D]   AE
RZ                            ; [0x005E]   C8
ADD H                         ; [0x005F]   84
DCX D                         ; [0x0060]   1B
ADD H                         ; [0x0061]   84
INR E                         ; [0x0062]   1C
ADD H                         ; [0x0063]   84
DCX H                         ; [0x0064]   2B
ADD H                         ; [0x0065]   84
DCX D                         ; [0x0066]   1B
ADD H                         ; [0x0067]   84
INR E                         ; [0x0068]   1C
ADD L                         ; [0x0069]   85
STAX B                        ; [0x006A]   02
ADI #89h                      ; [0x006B]   C6 89
ANA L                         ; [0x006D]   A5
ADC C                         ; [0x006E]   89
RET                           ; [0x006F]   C9
INR B                         ; [0x0070]   04
SUB B                         ; [0x0071]   90
INR B                         ; [0x0072]   04
XRA C                         ; [0x0073]   A9
NOP                           ; [0x0074]   00
ORA B                         ; [0x0075]   B0
INX B                         ; [0x0076]   03
JPE #02A9h                    ; [0x0077]   EA A9 02
ADD L                         ; [0x007A]   85
RAR                           ; [0x007B]   1F
ANA H                         ; [0x007C]   A4
ADD B                         ; [0x007D]   80
ANA L                         ; [0x007E]   A5
STAX B                        ; [0x007F]   02
DCR B                         ; [0x0080]   05
INX B                         ; [0x0081]   03
LDAX B                        ; [0x0082]   0A
SIM                           ; [0x0083]   30
MVI B, #EAh                   ; [0x0084]   06 EA
JPE #EAEAh                    ; [0x0086]   EA EA EA
NOP                           ; [0x0089]   10
RLC                           ; [0x008A]   07
ANA L                         ; [0x008B]   A5
ADD D                         ; [0x008C]   82
DAD D                         ; [0x008D]   19
CC #85FCh                     ; [0x008E]   DC FC 85
ADD D                         ; [0x0091]   82
ADD L                         ; [0x0092]   85
INR L                         ; [0x0093]   2C
ADC B                         ; [0x0094]   88
ADI #8Ch                      ; [0x0095]   C6 8C
NOP                           ; [0x0097]   10
DAD B                         ; [0x0098]   09
XRA C                         ; [0x0099]   A9
NOP                           ; [0x009A]   00
ADD L                         ; [0x009B]   85
DCR H                         ; [0x009C]   25
ADD L                         ; [0x009D]   85
MVI H, #4Ch                   ; [0x009E]   26 4C
DAD B                         ; [0x00A0]   09
POP PSW                       ; [0x00A1]   F1
RIM                           ; [0x00A2]   20
PCHL                          ; [0x00A3]   E9
NOP                           ; [0x00A4]   FD
ADD H                         ; [0x00A5]   84
ADD B                         ; [0x00A6]   80
CMP C                         ; [0x00A7]   B9
SUB D                         ; [0x00A8]   92
NOP                           ; [0x00A9]   00
ADD L                         ; [0x00AA]   85
RM                            ; [0x00AB]   F8
ANA D                         ; [0x00AC]   A2
CP #F846h                     ; [0x00AD]   F4 46 F8
SUB B                         ; [0x00B0]   90
RLC                           ; [0x00B1]   07
CMP C                         ; [0x00B2]   B9
SUI #FCh                      ; [0x00B3]   D6 FC
MOV H, L                      ; [0x00B5]   65
ADC E                         ; [0x00B6]   8B
RNC                           ; [0x00B7]   D0
INR B                         ; [0x00B8]   04
MOV C, B                      ; [0x00B9]   48
MOV L, B                      ; [0x00BA]   68
XRA C                         ; [0x00BB]   A9
NOP                           ; [0x00BC]   00
SUB L                         ; [0x00BD]   95
JM #E8E8h                     ; [0x00BE]   FA E8 E8
SIM                           ; [0x00C1]   30
XCHG                          ; [0x00C2]   EB
ADI #89h                      ; [0x00C3]   C6 89
ANA L                         ; [0x00C5]   A5
ADC C                         ; [0x00C6]   89
RET                           ; [0x00C7]   C9
INR B                         ; [0x00C8]   04
SUB B                         ; [0x00C9]   90
INR B                         ; [0x00CA]   04
XRA C                         ; [0x00CB]   A9
NOP                           ; [0x00CC]   00
ORA B                         ; [0x00CD]   B0
INX B                         ; [0x00CE]   03
JPE #02A9h                    ; [0x00CF]   EA A9 02
ADD L                         ; [0x00D2]   85
RAR                           ; [0x00D3]   1F
ANA L                         ; [0x00D4]   A5
RZ                            ; [0x00D5]   C8
DAD H                         ; [0x00D6]   29
NOP                           ; [0x00D7]   38
MOV C, D                      ; [0x00D8]   4A
MOV C, D                      ; [0x00D9]   4A
MOV C, D                      ; [0x00DA]   4A
PUSH B                        ; [0x00DB]   C5
ADD B                         ; [0x00DC]   80
RNC                           ; [0x00DD]   D0
MVI D, #A5h                   ; [0x00DE]   16 A5
RZ                            ; [0x00E0]   C8
DAD H                         ; [0x00E1]   29
RLC                           ; [0x00E2]   07
LDAX B                        ; [0x00E3]   0A
XRA D                         ; [0x00E4]   AA
ANA L                         ; [0x00E5]   A5
RZ                            ; [0x00E6]   C8
LHLD #2A2Ah                   ; [0x00E7]   2A 2A 2A
DAD H                         ; [0x00EA]   29
INX B                         ; [0x00EB]   03
XRA B                         ; [0x00EC]   A8
CMP C                         ; [0x00ED]   B9
MVI E, #FDh                   ; [0x00EE]   1E FD
SUB L                         ; [0x00F0]   95
XRI #4Ch                      ; [0x00F1]   EE 4C
JM #A2F0h                     ; [0x00F3]   FA F0 A2
DCR B                         ; [0x00F6]   05
JZ #FD10h                     ; [0x00F7]   CA 10 FD
ADD L                         ; [0x00FA]   85
DCX H                         ; [0x00FB]   2B
RIM                           ; [0x00FC]   20
ORA D                         ; [0x00FD]   B2
NOP                           ; [0x00FE]   FD
ANA D                         ; [0x00FF]   A2
MVI B, #CAh                   ; [0x0100]   06 CA
NOP                           ; [0x0102]   10
NOP                           ; [0x0103]   FD
ANA B                         ; [0x0104]   A0
DAD B                         ; [0x0105]   09
MOV C, H                      ; [0x0106]   4C
NOP                           ; [0x0107]   00
RP                            ; [0x0108]   F0
ADI #8Eh                      ; [0x0109]   C6 8E
SIM                           ; [0x010B]   30
MVI B, #20h                   ; [0x010C]   06 20
ORA D                         ; [0x010E]   B2
NOP                           ; [0x010F]   FD
MOV C, H                      ; [0x0110]   4C
DAD B                         ; [0x0111]   09
POP PSW                       ; [0x0112]   F1
INR H                         ; [0x0113]   24
SBB B                         ; [0x0114]   98
MOV M, B                      ; [0x0115]   70
INX B                         ; [0x0116]   03
MOV C, H                      ; [0x0117]   4C
ORA D                         ; [0x0118]   B2
POP PSW                       ; [0x0119]   F1
ANA L                         ; [0x011A]   A5
NOP                           ; [0x011B]   DD
ADD L                         ; [0x011C]   85
MVI B, #A9h                   ; [0x011D]   06 A9
LXI B, #8E85h                 ; [0x011F]   01 85 8E
XRA C                         ; [0x0122]   A9
NOP                           ; [0x0123]   00
ADD L                         ; [0x0124]   85
RST 5                         ; [0x0125]   EF
ADD L                         ; [0x0126]   85
POP PSW                       ; [0x0127]   F1
ADD L                         ; [0x0128]   85
DI                            ; [0x0129]   F3
XRA C                         ; [0x012A]   A9
XRA E                         ; [0x012B]   AB
ADD L                         ; [0x012C]   85
XRI #A9h                      ; [0x012D]   EE A9
ORA H                         ; [0x012F]   B4
ADD L                         ; [0x0130]   85
RP                            ; [0x0131]   F0
XRA C                         ; [0x0132]   A9
CMP L                         ; [0x0133]   BD
ADD L                         ; [0x0134]   85
JP #11A9h                     ; [0x0135]   F2 A9 11
ADD L                         ; [0x0138]   85
STAX B                        ; [0x0139]   02
ADD L                         ; [0x013A]   85
DCX H                         ; [0x013B]   2B
ADD L                         ; [0x013C]   85
CP #85A5h                     ; [0x013D]   F4 A5 85
ADD L                         ; [0x0140]   85
RIM                           ; [0x0141]   20
DAD H                         ; [0x0142]   29
RRC                           ; [0x0143]   0F
XRA B                         ; [0x0144]   A8
ADC B                         ; [0x0145]   88
NOP                           ; [0x0146]   10
NOP                           ; [0x0147]   FD
ADD L                         ; [0x0148]   85
NOP                           ; [0x0149]   10
ADI #89h                      ; [0x014A]   C6 89
ANA L                         ; [0x014C]   A5
ADC C                         ; [0x014D]   89
RET                           ; [0x014E]   C9
INR B                         ; [0x014F]   04
XRA C                         ; [0x0150]   A9
STAX B                        ; [0x0151]   02
SUB B                         ; [0x0152]   90
LXI B, #854Ah                 ; [0x0153]   01 4A 85
RAR                           ; [0x0156]   1F
ADD L                         ; [0x0157]   85
STAX B                        ; [0x0158]   02
ADD L                         ; [0x0159]   85
LHLD #00A0h                   ; [0x015A]   2A A0 00
ANA L                         ; [0x015D]   A5
ADD L                         ; [0x015E]   85
NOP                           ; [0x015F]   10
STAX B                        ; [0x0160]   02
ANA L                         ; [0x0161]   A5
ADD L                         ; [0x0162]   85
DAD H                         ; [0x0163]   29
RRC                           ; [0x0164]   0F
XRA D                         ; [0x0165]   AA
JZ #CACAh                     ; [0x0166]   CA CA CA
NOP                           ; [0x0169]   10
NOP                           ; [0x016A]   FD
ORA C                         ; [0x016B]   B1
XRI #85h                      ; [0x016C]   EE 85
DCX D                         ; [0x016E]   1B
JPE #F0B1h                    ; [0x016F]   EA B1 F0
ADD L                         ; [0x0172]   85
DCX D                         ; [0x0173]   1B
ORA C                         ; [0x0174]   B1
JP #1B85h                     ; [0x0175]   F2 85 1B
ADI #F4h                      ; [0x0178]   C6 F4
SIM                           ; [0x017A]   30
STAX D                        ; [0x017B]   12
ANA L                         ; [0x017C]   A5
CP #904Ah                     ; [0x017D]   F4 4A 90
NOP                           ; [0x0180]   08
RZ                            ; [0x0181]   C8
XRA C                         ; [0x0182]   A9
RIM                           ; [0x0183]   20
MOV C, D                      ; [0x0184]   4A
RNC                           ; [0x0185]   D0
NOP                           ; [0x0186]   FD
RP                            ; [0x0187]   F0
JPO #E920h                    ; [0x0188]   E2 20 E9
NOP                           ; [0x018B]   FD
NOP                           ; [0x018C]   10
NOP                           ; [0x018D]   DD
XRA C                         ; [0x018E]   A9
NOP                           ; [0x018F]   00
ADD L                         ; [0x0190]   85
DCX D                         ; [0x0191]   1B
ADD L                         ; [0x0192]   85
STAX B                        ; [0x0193]   02
ANA L                         ; [0x0194]   A5
STAX B                        ; [0x0195]   02
LDAX B                        ; [0x0196]   0A
DAD H                         ; [0x0197]   29
ADD B                         ; [0x0198]   80
DCR B                         ; [0x0199]   05
ADD D                         ; [0x019A]   82
ADD L                         ; [0x019B]   85
ADD D                         ; [0x019C]   82
ADD L                         ; [0x019D]   85
INR L                         ; [0x019E]   2C
RIM                           ; [0x019F]   20
PCHL                          ; [0x01A0]   E9
NOP                           ; [0x01A1]   FD
ADD L                         ; [0x01A2]   85
DCX H                         ; [0x01A3]   2B
ADD L                         ; [0x01A4]   85
STAX B                        ; [0x01A5]   02
ADD L                         ; [0x01A6]   85
STAX B                        ; [0x01A7]   02
ADI #8Eh                      ; [0x01A8]   C6 8E
SIM                           ; [0x01AA]   30
MVI B, #20h                   ; [0x01AB]   06 20
ORA D                         ; [0x01AD]   B2
NOP                           ; [0x01AE]   FD
MOV C, H                      ; [0x01AF]   4C
XRA B                         ; [0x01B0]   A8
POP PSW                       ; [0x01B1]   F1
INR H                         ; [0x01B2]   24
SBB B                         ; [0x01B3]   98
NOP                           ; [0x01B4]   10
INX B                         ; [0x01B5]   03
MOV C, H                      ; [0x01B6]   4C
ADD D                         ; [0x01B7]   82
JP #E920h                     ; [0x01B8]   F2 20 E9
NOP                           ; [0x01BB]   FD
ADD L                         ; [0x01BC]   85
DCX H                         ; [0x01BD]   2B
ADD L                         ; [0x01BE]   85
STAX B                        ; [0x01BF]   02
ANA L                         ; [0x01C0]   A5
RST 3                         ; [0x01C1]   DF
ADD L                         ; [0x01C2]   85
MVI B, #A5h                   ; [0x01C3]   06 A5
ADD M                         ; [0x01C5]   86
ADD L                         ; [0x01C6]   85
RIM                           ; [0x01C7]   20
DAD H                         ; [0x01C8]   29
RRC                           ; [0x01C9]   0F
XRA B                         ; [0x01CA]   A8
ADC B                         ; [0x01CB]   88
NOP                           ; [0x01CC]   10
NOP                           ; [0x01CD]   FD
ADD L                         ; [0x01CE]   85
NOP                           ; [0x01CF]   10
ADD L                         ; [0x01D0]   85
STAX B                        ; [0x01D1]   02
ANA L                         ; [0x01D2]   A5
PRO                           ; [0x01D3]   E0
ADD L                         ; [0x01D4]   85
RLC                           ; [0x01D5]   07
ANA L                         ; [0x01D6]   A5
ADD A                         ; [0x01D7]   87
ADD L                         ; [0x01D8]   85
LXI H, #0F29h                 ; [0x01D9]   21 29 0F
XRA B                         ; [0x01DC]   A8
ADC B                         ; [0x01DD]   88
NOP                           ; [0x01DE]   10
NOP                           ; [0x01DF]   FD
ADD L                         ; [0x01E0]   85
LXI D, #0285h                 ; [0x01E1]   11 85 02
ADD L                         ; [0x01E4]   85
LHLD #E920h                   ; [0x01E5]   2A 20 E9
NOP                           ; [0x01E8]   FD
XRA C                         ; [0x01E9]   A9
NOP                           ; [0x01EA]   00
INR L                         ; [0x01EB]   2C
ADD D                         ; [0x01EC]   82
STAX B                        ; [0x01ED]   02
NOP                           ; [0x01EE]   10
STAX B                        ; [0x01EF]   02
XRA C                         ; [0x01F0]   A9
DCR B                         ; [0x01F1]   05
ADD L                         ; [0x01F2]   85
DCR B                         ; [0x01F3]   05
XRA C                         ; [0x01F4]   A9
NOP                           ; [0x01F5]   00
MOV D, B                      ; [0x01F6]   50
STAX B                        ; [0x01F7]   02
XRA C                         ; [0x01F8]   A9
DCR B                         ; [0x01F9]   05
ADD L                         ; [0x01FA]   85
INR B                         ; [0x01FB]   04
ANA L                         ; [0x01FC]   A5
SBB B                         ; [0x01FD]   98
DAD H                         ; [0x01FE]   29
NOP                           ; [0x01FF]   10
RP                            ; [0x0200]   F0
STAX B                        ; [0x0201]   02
XRA C                         ; [0x0202]   A9
LDAX B                        ; [0x0203]   0A
ADD L                         ; [0x0204]   85
CP #98A5h                     ; [0x0205]   F4 A5 98
DAD H                         ; [0x0208]   29
RIM                           ; [0x0209]   20
RP                            ; [0x020A]   F0
STAX B                        ; [0x020B]   02
XRA C                         ; [0x020C]   A9
LDAX B                        ; [0x020D]   0A
ADD L                         ; [0x020E]   85
ORI #A5h                      ; [0x020F]   F6 A5
XRA D                         ; [0x0211]   AA
MOV C, D                      ; [0x0212]   4A
ADD L                         ; [0x0213]   85
STAX B                        ; [0x0214]   02
SUB B                         ; [0x0215]   90
RAL                           ; [0x0216]   17
ANA M                         ; [0x0217]   A6
RET                           ; [0x0218]   C9
CMP L                         ; [0x0219]   BD
MVI D, #FDh                   ; [0x021A]   16 FD
ADD L                         ; [0x021C]   85
RM                            ; [0x021D]   F8
XRA C                         ; [0x021E]   A9
RST 7                         ; [0x021F]   FF
ADD L                         ; [0x0220]   85
SPHL                          ; [0x0221]   F9
ANA L                         ; [0x0222]   A5
JZ #0829h                     ; [0x0223]   CA 29 08
RNC                           ; [0x0226]   D0
INR B                         ; [0x0227]   04
ADD L                         ; [0x0228]   85
CP #F685h                     ; [0x0229]   F4 85 F6
NOP                           ; [0x022C]   10
DCR H                         ; [0x022D]   25
XRA C                         ; [0x022E]   A9
NOP                           ; [0x022F]   00
ADD L                         ; [0x0230]   85
RM                            ; [0x0231]   F8
ANA L                         ; [0x0232]   A5
JZ #4A4Ah                     ; [0x0233]   CA 4A 4A
MOV C, D                      ; [0x0236]   4A
ANA L                         ; [0x0237]   A5
XRA D                         ; [0x0238]   AA
DAD H                         ; [0x0239]   29
INR B                         ; [0x023A]   04
RP                            ; [0x023B]   F0
NOP                           ; [0x023C]   08
XRA C                         ; [0x023D]   A9
MVI E, #B0h                   ; [0x023E]   1E B0
STAX B                        ; [0x0240]   02
XRA C                         ; [0x0241]   A9
INR D                         ; [0x0242]   14
ADD L                         ; [0x0243]   85
CP #AAA5h                     ; [0x0244]   F4 A5 AA
DAD H                         ; [0x0247]   29
STAX B                        ; [0x0248]   02
RP                            ; [0x0249]   F0
NOP                           ; [0x024A]   08
XRA C                         ; [0x024B]   A9
INR D                         ; [0x024C]   14
ORA B                         ; [0x024D]   B0
STAX B                        ; [0x024E]   02
XRA C                         ; [0x024F]   A9
MVI E, #85h                   ; [0x0250]   1E 85
ORI #A2h                      ; [0x0252]   F6 A2
DAD B                         ; [0x0254]   09
ANA B                         ; [0x0255]   A0
DAD B                         ; [0x0256]   09
ADD L                         ; [0x0257]   85
STAX B                        ; [0x0258]   02
XRA C                         ; [0x0259]   A9
NOP                           ; [0x025A]   00
ADD L                         ; [0x025B]   85
DCR C                         ; [0x025C]   0D
ORA C                         ; [0x025D]   B1
CP #1B85h                     ; [0x025E]   F4 85 1B
ORA C                         ; [0x0261]   B1
ORI #85h                      ; [0x0262]   F6 85
INR E                         ; [0x0264]   1C
ADC D                         ; [0x0265]   8A
MOV C, D                      ; [0x0266]   4A
XRA B                         ; [0x0267]   A8
ORA C                         ; [0x0268]   B1
RM                            ; [0x0269]   F8
ADD L                         ; [0x026A]   85
DCR C                         ; [0x026B]   0D
ADC D                         ; [0x026C]   8A
MOV C, D                      ; [0x026D]   4A
SUB B                         ; [0x026E]   90
DCR C                         ; [0x026F]   0D
ADI #89h                      ; [0x0270]   C6 89
ANA L                         ; [0x0272]   A5
ADC C                         ; [0x0273]   89
RET                           ; [0x0274]   C9
INR B                         ; [0x0275]   04
XRA C                         ; [0x0276]   A9
STAX B                        ; [0x0277]   02
SUB B                         ; [0x0278]   90
LXI B, #854Ah                 ; [0x0279]   01 4A 85
RAR                           ; [0x027C]   1F
JZ #A88Ah                     ; [0x027D]   CA 8A A8
NOP                           ; [0x0280]   10
PUSH D                        ; [0x0281]   D5
ADD L                         ; [0x0282]   85
STAX B                        ; [0x0283]   02
XRA C                         ; [0x0284]   A9
NOP                           ; [0x0285]   00
ADD L                         ; [0x0286]   85
INR B                         ; [0x0287]   04
ADD L                         ; [0x0288]   85
DCR B                         ; [0x0289]   05
ADD L                         ; [0x028A]   85
DCR C                         ; [0x028B]   0D
ADD L                         ; [0x028C]   85
RAR                           ; [0x028D]   1F
ADD L                         ; [0x028E]   85
DCX D                         ; [0x028F]   1B
ADD L                         ; [0x0290]   85
INR E                         ; [0x0291]   1C
ANA L                         ; [0x0292]   A5
CPO #0985h                    ; [0x0293]   E4 85 09
ANA L                         ; [0x0296]   A5
ADD C                         ; [0x0297]   81
ADD L                         ; [0x0298]   85
NOP                           ; [0x0299]   10
ANA D                         ; [0x029A]   A2
INR B                         ; [0x029B]   04
JZ #FD10h                     ; [0x029C]   CA 10 FD
ADD L                         ; [0x029F]   85
LXI D, #2B85h                 ; [0x02A0]   11 85 2B
XRA C                         ; [0x02A3]   A9
PRO                           ; [0x02A4]   E0
ADD L                         ; [0x02A5]   85
LXI H, #0285h                 ; [0x02A6]   21 85 02
ADD L                         ; [0x02A9]   85
LHLD #C0A9h                   ; [0x02AA]   2A A9 C0
ADD L                         ; [0x02AD]   85
DCX D                         ; [0x02AE]   1B
ADD L                         ; [0x02AF]   85
INR E                         ; [0x02B0]   1C
ANA D                         ; [0x02B1]   A2
INR B                         ; [0x02B2]   04
XRA C                         ; [0x02B3]   A9
NOP                           ; [0x02B4]   00
SUB L                         ; [0x02B5]   95
DI                            ; [0x02B6]   F3
JZ #FBD0h                     ; [0x02B7]   CA D0 FB
RIM                           ; [0x02BA]   20
NOP                           ; [0x02BB]   08
CP #E8h                       ; [0x02BC]   FE E8
RIM                           ; [0x02BE]   20
NOP                           ; [0x02BF]   08
CP #A5h                       ; [0x02C0]   FE A5
XRA D                         ; [0x02C2]   AA
DAD H                         ; [0x02C3]   29
ADD C                         ; [0x02C4]   81
RNC                           ; [0x02C5]   D0
CMA                           ; [0x02C6]   2F
INR H                         ; [0x02C7]   24
STAX B                        ; [0x02C8]   02
MOV D, B                      ; [0x02C9]   50
MVI B, #A9h                   ; [0x02CA]   06 A9
INR B                         ; [0x02CC]   04
INR H                         ; [0x02CD]   24
XRA D                         ; [0x02CE]   AA
RP                            ; [0x02CF]   F0
DCX B                         ; [0x02D0]   0B
JZ #0324h                     ; [0x02D1]   CA 24 03
MOV D, B                      ; [0x02D4]   50
RIM                           ; [0x02D5]   20
XRA C                         ; [0x02D6]   A9
STAX B                        ; [0x02D7]   02
INR H                         ; [0x02D8]   24
XRA D                         ; [0x02D9]   AA
RNC                           ; [0x02DA]   D0
LDAX D                        ; [0x02DB]   1A
DCR B                         ; [0x02DC]   05
XRA D                         ; [0x02DD]   AA
ADD L                         ; [0x02DE]   85
XRA D                         ; [0x02DF]   AA
ADD L                         ; [0x02E0]   85
ADI #20h                      ; [0x02E1]   C6 20
MOV M, L                      ; [0x02E3]   75
CP #A9h                       ; [0x02E4]   FE A9
MVI B, #20h                   ; [0x02E6]   06 20
MOV A, M                      ; [0x02E8]   7E
CP #A5h                       ; [0x02E9]   FE A5
RST 0                         ; [0x02EB]   C7
RNC                           ; [0x02EC]   D0
NOP                           ; [0x02ED]   08
INR H                         ; [0x02EE]   24
IN #50h                       ; [0x02EF]   DB 50
INR B                         ; [0x02F1]   04
XRA C                         ; [0x02F2]   A9
STAX B                        ; [0x02F3]   02
SUB L                         ; [0x02F4]   95
CP #0285h                     ; [0x02F5]   F4 85 02
XRA L                         ; [0x02F8]   AD
ADD H                         ; [0x02F9]   84
STAX B                        ; [0x02FA]   02
RNC                           ; [0x02FB]   D0
EI                            ; [0x02FC]   FB
ADD L                         ; [0x02FD]   85
DCX D                         ; [0x02FE]   1B
ADD L                         ; [0x02FF]   85
INR E                         ; [0x0300]   1C
XRA C                         ; [0x0301]   A9
RZ                            ; [0x0302]   C8
ADC L                         ; [0x0303]   8D
SUB L                         ; [0x0304]   95
STAX B                        ; [0x0305]   02
XRA C                         ; [0x0306]   A9
NOP                           ; [0x0307]   00
ADD L                         ; [0x0308]   85
POP PSW                       ; [0x0309]   F1
XRA D                         ; [0x030A]   AA
ANA L                         ; [0x030B]   A5
ADD D                         ; [0x030C]   82
NOP                           ; [0x030D]   10
MOV E, A                      ; [0x030E]   5F
ANA L                         ; [0x030F]   A5
JZ #904Ah                     ; [0x0310]   CA 4A 90
STAX B                        ; [0x0313]   02
ANA D                         ; [0x0314]   A2
INR B                         ; [0x0315]   04
ORA L                         ; [0x0316]   B5
POP D                         ; [0x0317]   D1
RET                           ; [0x0318]   C9
MOV C, C                      ; [0x0319]   49
SUB B                         ; [0x031A]   90
INR B                         ; [0x031B]   04
RET                           ; [0x031C]   C9
MOV E, B                      ; [0x031D]   58
SUB B                         ; [0x031E]   90
LXI B, #E0E8h                 ; [0x031F]   01 E8 E0
INX B                         ; [0x0322]   03
SUB B                         ; [0x0323]   90
INC C                         ; [0x0324]   0C
XRA C                         ; [0x0325]   A9
DAD B                         ; [0x0326]   09
ADD L                         ; [0x0327]   85
RST 5                         ; [0x0328]   EF
XRA C                         ; [0x0329]   A9
RST 7                         ; [0x032A]   FF
ADD L                         ; [0x032B]   85
JP #7FA9h                     ; [0x032C]   F2 A9 7F
RNC                           ; [0x032F]   D0
LDAX B                        ; [0x0330]   0A
XRA C                         ; [0x0331]   A9
RST 7                         ; [0x0332]   FF
ADD L                         ; [0x0333]   85
RST 5                         ; [0x0334]   EF
XRA C                         ; [0x0335]   A9
LXI B, #F285h                 ; [0x0336]   01 85 F2
XRA C                         ; [0x0339]   A9
ORI #95h                      ; [0x033A]   F6 95
POP D                         ; [0x033C]   D1
ORA L                         ; [0x033D]   B5
OUT #A0h                      ; [0x033E]   D3 A0
INX B                         ; [0x0340]   03
NOP                           ; [0x0341]   18
PUSH H                        ; [0x0342]   E5
SBB E                         ; [0x0343]   9B
ADC B                         ; [0x0344]   88
NOP                           ; [0x0345]   18
MOV L, C                      ; [0x0346]   69
PRO                           ; [0x0347]   E0
NOP                           ; [0x0348]   10
JM #2069h                     ; [0x0349]   FA 69 20
XRA D                         ; [0x034C]   AA
CMP C                         ; [0x034D]   B9
INX D                         ; [0x034E]   13
NOP                           ; [0x034F]   FD
ADD L                         ; [0x0350]   85
RP                            ; [0x0351]   F0
ANA H                         ; [0x0352]   A4
RST 5                         ; [0x0353]   EF
SBB B                         ; [0x0354]   98
NOP                           ; [0x0355]   18
MOV H, L                      ; [0x0356]   65
JP #BDA8h                     ; [0x0357]   F2 A8 BD
MOV C, H                      ; [0x035A]   4C
RST 7                         ; [0x035B]   FF
MOV C, C                      ; [0x035C]   49
RST 7                         ; [0x035D]   FF
LXI SP, #F0F0h                ; [0x035E]   31 F0 F0
JP #8F20h                     ; [0x0361]   F2 20 8F
NOP                           ; [0x0364]   FD
ADC B                         ; [0x0365]   88
RIM                           ; [0x0366]   20
ADC E                         ; [0x0367]   8B
NOP                           ; [0x0368]   FD
RZ                            ; [0x0369]   C8
RZ                            ; [0x036A]   C8
RIM                           ; [0x036B]   20
ADC E                         ; [0x036C]   8B
NOP                           ; [0x036D]   FD
ANA L                         ; [0x036E]   A5
JZ #B04Ah                     ; [0x036F]   CA 4A B0
INX B                         ; [0x0372]   03
MOV C, H                      ; [0x0373]   4C
DAD H                         ; [0x0374]   29
CP #8224h                     ; [0x0375]   F4 24 82
MOV D, B                      ; [0x0378]   50
MVI H, #A5h                   ; [0x0379]   26 A5
RZ                            ; [0x037B]   C8
DAD H                         ; [0x037C]   29
DAD SP                        ; [0x037D]   39
RET                           ; [0x037E]   C9
DAD SP                        ; [0x037F]   39
RP                            ; [0x0380]   F0
MVI E, #A9h                   ; [0x0381]   1E A9
DAD SP                        ; [0x0383]   39
ADD L                         ; [0x0384]   85
RZ                            ; [0x0385]   C8
ANA D                         ; [0x0386]   A2
LXI B, #98A5h                 ; [0x0387]   01 A5 98
DAD H                         ; [0x038A]   29
INR B                         ; [0x038B]   04
RNC                           ; [0x038C]   D0
LXI B, #A9CAh                 ; [0x038D]   01 CA A9
INR B                         ; [0x0390]   04
ADD L                         ; [0x0391]   85
ADI #4Ah                      ; [0x0392]   C6 4A
INR H                         ; [0x0394]   24
IN #50h                       ; [0x0395]   DB 50
LXI B, #954Ah                 ; [0x0397]   01 4A 95
CP #05A9h                     ; [0x039A]   F4 A9 05
RIM                           ; [0x039D]   20
ADC E                         ; [0x039E]   8B
CP #A9h                       ; [0x039F]   FE A9
MVI B, #85h                   ; [0x03A1]   06 85
RP                            ; [0x03A3]   F0
ADI #F0h                      ; [0x03A4]   C6 F0
NOP                           ; [0x03A6]   10
INX B                         ; [0x03A7]   03
MOV C, H                      ; [0x03A8]   4C
RST 1                         ; [0x03A9]   CF
CP #F0A6h                     ; [0x03AA]   F4 A6 F0
ANA L                         ; [0x03AD]   A5
ADD D                         ; [0x03AE]   82
DCR A                         ; [0x03AF]   3D
CC #F0FCh                     ; [0x03B0]   DC FC F0
RP                            ; [0x03B3]   F0
ANA B                         ; [0x03B4]   A0
LXI B, #35A9h                 ; [0x03B5]   01 A9 35
NOP                           ; [0x03B8]   38
NOP                           ; [0x03B9]   FD
LXI SP, #18FDh                ; [0x03BA]   31 FD 18
MOV H, L                      ; [0x03BD]   65
SUB B                         ; [0x03BE]   90
RET                           ; [0x03BF]   C9
MOV D, D                      ; [0x03C0]   52
ORA B                         ; [0x03C1]   B0
MOV H, E                      ; [0x03C2]   63
PUSH B                        ; [0x03C3]   C5
PUSH D                        ; [0x03C4]   D5
ORA B                         ; [0x03C5]   B0
RLC                           ; [0x03C6]   07
MOV L, C                      ; [0x03C7]   69
DCR C                         ; [0x03C8]   0D
PUSH B                        ; [0x03C9]   C5
PUSH D                        ; [0x03CA]   D5
SUB B                         ; [0x03CB]   90
LXI B, #8488h                 ; [0x03CC]   01 88 84
XRI #A6h                      ; [0x03CF]   EE A6
XRI #A0h                      ; [0x03D1]   EE A0
RST 7                         ; [0x03D3]   FF
ANA L                         ; [0x03D4]   A5
SBB D                         ; [0x03D5]   9A
NOP                           ; [0x03D6]   18
MOV L, C                      ; [0x03D7]   69
NOP                           ; [0x03D8]   FD
RZ                            ; [0x03D9]   C8
MOV L, C                      ; [0x03DA]   69
NOP                           ; [0x03DB]   10
PUSH D                        ; [0x03DC]   D5
RST 2                         ; [0x03DD]   D7
SUB B                         ; [0x03DE]   90
SPHL                          ; [0x03DF]   F9
ADD H                         ; [0x03E0]   84
RST 5                         ; [0x03E1]   EF
ANA M                         ; [0x03E2]   A6
RP                            ; [0x03E3]   F0
CMP C                         ; [0x03E4]   B9
CC #35FCh                     ; [0x03E5]   DC FC 35
SUB D                         ; [0x03E8]   92
RP                            ; [0x03E9]   F0
DCS SP                        ; [0x03EA]   3B
MOV D, L                      ; [0x03EB]   55
SUB D                         ; [0x03EC]   92
SUB L                         ; [0x03ED]   95
SUB D                         ; [0x03EE]   92
ANA H                         ; [0x03EF]   A4
XRI #B9h                      ; [0x03F0]   EE B9
SBI #FCh                      ; [0x03F2]   DE FC
ANA B                         ; [0x03F4]   A0
LXI B, #9825h                 ; [0x03F5]   01 25 98
RNC                           ; [0x03F8]   D0
LXI B, #BD88h                 ; [0x03F9]   01 88 BD
DCX H                         ; [0x03FC]   2B
NOP                           ; [0x03FD]   FD
SBB C                         ; [0x03FE]   99
ORI #00h                      ; [0x03FF]   F6 00
XRA C                         ; [0x0401]   A9
STAX B                        ; [0x0402]   02
RIM                           ; [0x0403]   20
MOV A, M                      ; [0x0404]   7E
CP #C6h                       ; [0x0405]   FE C6
SUB C                         ; [0x0407]   91
RNC                           ; [0x0408]   D0
LDAX B                        ; [0x0409]   0A
ANA L                         ; [0x040A]   A5
XRA D                         ; [0x040B]   AA
DAD B                         ; [0x040C]   09
NOP                           ; [0x040D]   08
ADD L                         ; [0x040E]   85
XRA D                         ; [0x040F]   AA
XRA C                         ; [0x0410]   A9
MOV H, C                      ; [0x0411]   61
ADD L                         ; [0x0412]   85
JZ #ED20h                     ; [0x0413]   CA 20 ED
EI                            ; [0x0416]   FB
ADC D                         ; [0x0417]   8A
LDAX B                        ; [0x0418]   0A
LDAX B                        ; [0x0419]   0A
LDAX B                        ; [0x041A]   0A
DCR B                         ; [0x041B]   05
RST 5                         ; [0x041C]   EF
ADD L                         ; [0x041D]   85
RZ                            ; [0x041E]   C8
XRA C                         ; [0x041F]   A9
ORI #A4h                      ; [0x0420]   F6 A4
XRI #99h                      ; [0x0422]   EE 99
PUSH D                        ; [0x0424]   D5
NOP                           ; [0x0425]   00
MOV C, H                      ; [0x0426]   4C
ANA H                         ; [0x0427]   A4
DI                            ; [0x0428]   F3
MOV C, D                      ; [0x0429]   4A
ORA B                         ; [0x042A]   B0
DCR L                         ; [0x042B]   2D
ANA L                         ; [0x042C]   A5
RZ                            ; [0x042D]   C8
DAD H                         ; [0x042E]   29
DAD SP                        ; [0x042F]   39
RET                           ; [0x0430]   C9
DAD SP                        ; [0x0431]   39
RP                            ; [0x0432]   F0
DCR H                         ; [0x0433]   25
ANA L                         ; [0x0434]   A5
SBB M                         ; [0x0435]   9E
RET                           ; [0x0436]   C9
ORA H                         ; [0x0437]   B4
RP                            ; [0x0438]   F0
RAR                           ; [0x0439]   1F
ANA L                         ; [0x043A]   A5
SBB B                         ; [0x043B]   98
MOV C, D                      ; [0x043C]   4A
ORA B                         ; [0x043D]   B0
MVI B, #C6h                   ; [0x043E]   06 C6
SBB M                         ; [0x0440]   9E
RNC                           ; [0x0441]   D0
MVI D, #F0h                   ; [0x0442]   16 F0
NOP                           ; [0x0444]   08
ANI #9Eh                      ; [0x0445]   E6 9E
ANA L                         ; [0x0447]   A5
SBB M                         ; [0x0448]   9E
RET                           ; [0x0449]   C9
SBB B                         ; [0x044A]   98
SUB B                         ; [0x044B]   90
INC C                         ; [0x044C]   0C
XRA C                         ; [0x044D]   A9
ORA H                         ; [0x044E]   B4
ADD L                         ; [0x044F]   85
SBB M                         ; [0x0450]   9E
XRA C                         ; [0x0451]   A9
NOP                           ; [0x0452]   00
ADD L                         ; [0x0453]   85
CZ #04A9h                     ; [0x0454]   CC A9 04
ADD L                         ; [0x0457]   85
ADI #ADh                      ; [0x0458]   C6 AD
ADD B                         ; [0x045A]   80
STAX B                        ; [0x045B]   02
XRA B                         ; [0x045C]   A8
LDAX B                        ; [0x045D]   0A
LDAX B                        ; [0x045E]   0A
LDAX B                        ; [0x045F]   0A
LDAX B                        ; [0x0460]   0A
ADD L                         ; [0x0461]   85
XRI #29h                      ; [0x0462]   EE 29
ADD B                         ; [0x0464]   80
ADD L                         ; [0x0465]   85
ADD C                         ; [0x0466]   81
ANA L                         ; [0x0467]   A5
IN #C9h                       ; [0x0468]   DB C9
SUB B                         ; [0x046A]   90
RNC                           ; [0x046B]   D0
NOP                           ; [0x046C]   08
INR H                         ; [0x046D]   24
XRA D                         ; [0x046E]   AA
MOV D, B                      ; [0x046F]   50
MVI C, #A4h                   ; [0x0470]   0E A4
XRI #70h                      ; [0x0472]   EE 70
LDAX B                        ; [0x0474]   0A
DAD H                         ; [0x0475]   29
STAX B                        ; [0x0476]   02
RP                            ; [0x0477]   F0
MVI B, #98h                   ; [0x0478]   06 98
DAD H                         ; [0x047A]   29
MOV B, B                      ; [0x047B]   40
DCR B                         ; [0x047C]   05
ADD C                         ; [0x047D]   81
XRA B                         ; [0x047E]   A8
ANA D                         ; [0x047F]   A2
LXI B, #AAA5h                 ; [0x0480]   01 A5 AA
DCR A                         ; [0x0483]   3D
MOV H, B                      ; [0x0484]   60
NOP                           ; [0x0485]   FD
RNC                           ; [0x0486]   D0
NOP                           ; [0x0487]   18
INR H                         ; [0x0488]   24
XRI #30h                      ; [0x0489]   EE 30
STAX B                        ; [0x048B]   02
ORI #9Ch                      ; [0x048C]   F6 9C
MOV M, B                      ; [0x048E]   70
STAX B                        ; [0x048F]   02
SUI #9Ch                      ; [0x0490]   D6 9C
ORA L                         ; [0x0492]   B5
SBB H                         ; [0x0493]   9C
RET                           ; [0x0494]   C9
HLT                           ; [0x0495]   76
SUB B                         ; [0x0496]   90
STAX B                        ; [0x0497]   02
SUI #9Ch                      ; [0x0498]   D6 9C
RET                           ; [0x049A]   C9
INX H                         ; [0x049B]   23
ORA B                         ; [0x049C]   B0
STAX B                        ; [0x049D]   02
ORI #9Ch                      ; [0x049E]   F6 9C
ADD H                         ; [0x04A0]   84
XRI #CAh                      ; [0x04A1]   EE CA
NOP                           ; [0x04A3]   10
CC #CAA5h                     ; [0x04A4]   DC A5 CA
MOV C, D                      ; [0x04A7]   4A
MOV C, D                      ; [0x04A8]   4A
MOV C, D                      ; [0x04A9]   4A
ORA B                         ; [0x04AA]   B0
INX H                         ; [0x04AB]   23
ANA L                         ; [0x04AC]   A5
CC #904Ah                     ; [0x04AD]   DC 4A 90
MVI E, #A5h                   ; [0x04B0]   1E A5
XRA D                         ; [0x04B2]   AA
DAD H                         ; [0x04B3]   29
NOP                           ; [0x04B4]   10
RP                            ; [0x04B5]   F0
LDAX B                        ; [0x04B6]   0A
ANI #9Bh                      ; [0x04B7]   E6 9B
ANA L                         ; [0x04B9]   A5
SBB E                         ; [0x04BA]   9B
RET                           ; [0x04BB]   C9
DCR M                         ; [0x04BC]   35
SUB B                         ; [0x04BD]   90
NOP                           ; [0x04BE]   10
ORA B                         ; [0x04BF]   B0
NOP                           ; [0x04C0]   08
ADI #9Bh                      ; [0x04C1]   C6 9B
ANA L                         ; [0x04C3]   A5
SBB E                         ; [0x04C4]   9B
RET                           ; [0x04C5]   C9
LXI H, #06B0h                 ; [0x04C6]   21 B0 06
ANA L                         ; [0x04C9]   A5
XRA D                         ; [0x04CA]   AA
MOV C, C                      ; [0x04CB]   49
NOP                           ; [0x04CC]   10
ADD L                         ; [0x04CD]   85
XRA D                         ; [0x04CE]   AA
XRA L                         ; [0x04CF]   AD
ADD H                         ; [0x04D0]   84
STAX B                        ; [0x04D1]   02
RNC                           ; [0x04D2]   D0
EI                            ; [0x04D3]   FB
XRA C                         ; [0x04D4]   A9
STAX B                        ; [0x04D5]   02
ADD L                         ; [0x04D6]   85
LXI B, #0285h                 ; [0x04D7]   01 85 02
INR H                         ; [0x04DA]   24
XRA D                         ; [0x04DB]   AA
SIM                           ; [0x04DC]   30
INX D                         ; [0x04DD]   13
RM                            ; [0x04DE]   F8
ANA D                         ; [0x04DF]   A2
LXI B, #E8B5h                 ; [0x04E0]   01 B5 E8
NOP                           ; [0x04E3]   18
MOV M, L                      ; [0x04E4]   75
ORI #95h                      ; [0x04E5]   F6 95
RPE                           ; [0x04E7]   E8
ORA L                         ; [0x04E8]   B5
ANI #75h                      ; [0x04E9]   E6 75
CP #E695h                     ; [0x04EB]   F4 95 E6
JZ #F010h                     ; [0x04EE]   CA 10 F0
RC                            ; [0x04F1]   D8
ADD L                         ; [0x04F2]   85
STAX B                        ; [0x04F3]   02
ANA L                         ; [0x04F4]   A5
JZ #0729h                     ; [0x04F5]   CA 29 07
RNC                           ; [0x04F8]   D0
STAX D                        ; [0x04F9]   12
ANA L                         ; [0x04FA]   A5
RZ                            ; [0x04FB]   C8
NOP                           ; [0x04FC]   18
MOV L, C                      ; [0x04FD]   69
MOV B, B                      ; [0x04FE]   40
ADD L                         ; [0x04FF]   85
RZ                            ; [0x0500]   C8
RET                           ; [0x0501]   C9
MOV B, B                      ; [0x0502]   40
ORA B                         ; [0x0503]   B0
RLC                           ; [0x0504]   07
RIM                           ; [0x0505]   20
POP PSW                       ; [0x0506]   F1
EI                            ; [0x0507]   FB
XRA C                         ; [0x0508]   A9
SIM                           ; [0x0509]   30
ADD L                         ; [0x050A]   85
RZ                            ; [0x050B]   C8
XRA C                         ; [0x050C]   A9
STAX B                        ; [0x050D]   02
ADD L                         ; [0x050E]   85
STAX B                        ; [0x050F]   02
ADD L                         ; [0x0510]   85
NOP                           ; [0x0511]   00
ADD L                         ; [0x0512]   85
STAX B                        ; [0x0513]   02
ADD L                         ; [0x0514]   85
STAX B                        ; [0x0515]   02
XRA C                         ; [0x0516]   A9
SIM                           ; [0x0517]   30
ADC L                         ; [0x0518]   8D
SUB M                         ; [0x0519]   96
STAX B                        ; [0x051A]   02
XRA C                         ; [0x051B]   A9
NOP                           ; [0x051C]   00
ADD L                         ; [0x051D]   85
STAX B                        ; [0x051E]   02
ADD L                         ; [0x051F]   85
NOP                           ; [0x0520]   00
ANA L                         ; [0x0521]   A5
JZ #904Ah                     ; [0x0522]   CA 4A 90
INX H                         ; [0x0525]   23
ANA D                         ; [0x0526]   A2
LXI B, #D5B5h                 ; [0x0527]   01 B5 D5
RET                           ; [0x052A]   C9
MOV A, C                      ; [0x052B]   79
RNC                           ; [0x052C]   D0
INR B                         ; [0x052D]   04
XRA C                         ; [0x052E]   A9
ORI #95h                      ; [0x052F]   F6 95
PUSH D                        ; [0x0531]   D5
ORA L                         ; [0x0532]   B5
PUSH D                        ; [0x0533]   D5
RET                           ; [0x0534]   C9
CPE #0CB0h                    ; [0x0535]   EC B0 0C
ORA L                         ; [0x0538]   B5
PUSH D                        ; [0x0539]   D5
MOV L, C                      ; [0x053A]   69
CP #C9h                       ; [0x053B]   FE C9
INX B                         ; [0x053D]   03
ORA B                         ; [0x053E]   B0
STAX B                        ; [0x053F]   02
XRA C                         ; [0x0540]   A9
ORI #95h                      ; [0x0541]   F6 95
PUSH D                        ; [0x0543]   D5
JZ #E110h                     ; [0x0544]   CA 10 E1
SIM                           ; [0x0547]   30
MOV E, C                      ; [0x0548]   59
ANA L                         ; [0x0549]   A5
JZ #0F29h                     ; [0x054A]   CA 29 0F
RET                           ; [0x054D]   C9
RRC                           ; [0x054E]   0F
RP                            ; [0x054F]   F0
DCR B                         ; [0x0550]   05
RIM                           ; [0x0551]   20
EI                            ; [0x0552]   FB
NOP                           ; [0x0553]   FD
ADD L                         ; [0x0554]   85
JC #DCA5h                     ; [0x0555]   DA A5 DC
DAD H                         ; [0x0558]   29
INR B                         ; [0x0559]   04
MOV C, D                      ; [0x055A]   4A
MOV C, D                      ; [0x055B]   4A
MOV C, D                      ; [0x055C]   4A
XRA C                         ; [0x055D]   A9
LXI B, #90AAh                 ; [0x055E]   01 AA 90
LXI B, #850Ah                 ; [0x0561]   01 0A 85
ADD C                         ; [0x0564]   81
ORA L                         ; [0x0565]   B5
POP D                         ; [0x0566]   D1
RET                           ; [0x0567]   C9
CPE #34B0h                    ; [0x0568]   EC B0 34
ANA L                         ; [0x056B]   A5
CC #0229h                     ; [0x056C]   DC 29 02
RP                            ; [0x056F]   F0
RAR                           ; [0x0570]   1F
ANA L                         ; [0x0571]   A5
JC #00E0h                     ; [0x0572]   DA E0 00
RP                            ; [0x0575]   F0
STAX B                        ; [0x0576]   02
LDAX B                        ; [0x0577]   0A
LDAX B                        ; [0x0578]   0A
LDAX B                        ; [0x0579]   0A
SUB B                         ; [0x057A]   90
INR D                         ; [0x057B]   14
NOP                           ; [0x057C]   10
LDAX B                        ; [0x057D]   0A
ORA L                         ; [0x057E]   B5
OUT #C9h                      ; [0x057F]   D3 C9
ADD C                         ; [0x0581]   81
ORA B                         ; [0x0582]   B0
INC C                         ; [0x0583]   0C
ORI #D3h                      ; [0x0584]   F6 D3
RNC                           ; [0x0586]   D0
NOP                           ; [0x0587]   08
ORA L                         ; [0x0588]   B5
OUT #C9h                      ; [0x0589]   D3 C9
RAL                           ; [0x058B]   17
SUB B                         ; [0x058C]   90
STAX B                        ; [0x058D]   02
SUI #D3h                      ; [0x058E]   D6 D3
ORA L                         ; [0x0590]   B5
POP D                         ; [0x0591]   D1
NOP                           ; [0x0592]   18
MOV H, L                      ; [0x0593]   65
ADD C                         ; [0x0594]   81
SUB L                         ; [0x0595]   95
POP D                         ; [0x0596]   D1
RET                           ; [0x0597]   C9
MOV L, H                      ; [0x0598]   6C
SUB B                         ; [0x0599]   90
INR B                         ; [0x059A]   04
XRA C                         ; [0x059B]   A9
ORI #95h                      ; [0x059C]   F6 95
POP D                         ; [0x059E]   D1
JZ #C310h                     ; [0x059F]   CA 10 C3
ADI #CAh                      ; [0x05A2]   C6 CA
RP                            ; [0x05A4]   F0
INX B                         ; [0x05A5]   03
MOV C, H                      ; [0x05A6]   4C
ADC H                         ; [0x05A7]   8C
ORI #A5h                      ; [0x05A8]   F6 A5
RST 0                         ; [0x05AA]   C7
RP                            ; [0x05AB]   F0
INR B                         ; [0x05AC]   04
ANI #C7h                      ; [0x05AD]   E6 C7
ANI #C7h                      ; [0x05AF]   E6 C7
INR H                         ; [0x05B1]   24
PUSH H                        ; [0x05B2]   E5
SIM                           ; [0x05B3]   30
MOV L, L                      ; [0x05B4]   6D
ANA L                         ; [0x05B5]   A5
XRA D                         ; [0x05B6]   AA
DAD H                         ; [0x05B7]   29
NOP                           ; [0x05B8]   08
RP                            ; [0x05B9]   F0
LHLD #AA45h                   ; [0x05BA]   2A 45 AA
ADD L                         ; [0x05BD]   85
XRA D                         ; [0x05BE]   AA
ANA M                         ; [0x05BF]   A6
SBB C                         ; [0x05C0]   99
CMP L                         ; [0x05C1]   BD
RRC                           ; [0x05C2]   0F
NOP                           ; [0x05C3]   FD
ADD L                         ; [0x05C4]   85
SUB B                         ; [0x05C5]   90
PRO                           ; [0x05C6]   E0
INX B                         ; [0x05C7]   03
ORA B                         ; [0x05C8]   B0
STAX B                        ; [0x05C9]   02
ANI #99h                      ; [0x05CA]   E6 99
INR H                         ; [0x05CC]   24
SBB B                         ; [0x05CD]   98
SIM                           ; [0x05CE]   30
RRC                           ; [0x05CF]   0F
RIM                           ; [0x05D0]   20
JM #A5FEh                     ; [0x05D1]   FA FE A5
XRA D                         ; [0x05D4]   AA
DAD H                         ; [0x05D5]   29
MVI B, #D0h                   ; [0x05D6]   06 D0
INC C                         ; [0x05D8]   0C
ANA L                         ; [0x05D9]   A5
XRA D                         ; [0x05DA]   AA
DAD B                         ; [0x05DB]   09
LXI B, #AA85h                 ; [0x05DC]   01 85 AA
XRA C                         ; [0x05DF]   A9
MOV B, B                      ; [0x05E0]   40
ADD L                         ; [0x05E1]   85
JZ #3AD0h                     ; [0x05E2]   CA D0 3A
INR H                         ; [0x05E5]   24
SBB B                         ; [0x05E6]   98
NOP                           ; [0x05E7]   10
MVI C, #24h                   ; [0x05E8]   0E 24
ANA A                         ; [0x05EA]   A7
SIM                           ; [0x05EB]   30
SHLD #DBA5h                   ; [0x05EC]   22 A5 DB
RET                           ; [0x05EF]   C9
NOP                           ; [0x05F0]   10
RNC                           ; [0x05F1]   D0
INR E                         ; [0x05F2]   1C
XRA C                         ; [0x05F3]   A9
NOP                           ; [0x05F4]   00
RP                            ; [0x05F5]   F0
LXI SP, #AAA5h                ; [0x05F6]   31 A5 AA
DAD H                         ; [0x05F9]   29
LXI B, #25F0h                 ; [0x05FA]   01 F0 25
MOV B, L                      ; [0x05FD]   45
XRA D                         ; [0x05FE]   AA
ADD L                         ; [0x05FF]   85
XRA D                         ; [0x0600]   AA
XRA C                         ; [0x0601]   A9
MOV D, B                      ; [0x0602]   50
ADD L                         ; [0x0603]   85
NOP                           ; [0x0604]   D9
XRA C                         ; [0x0605]   A9
DCR B                         ; [0x0606]   05
ADD L                         ; [0x0607]   85
ADI #A5h                      ; [0x0608]   C6 A5
RET                           ; [0x060A]   C9
RNC                           ; [0x060B]   D0
MOV C, A                      ; [0x060C]   4F
ANI #C9h                      ; [0x060D]   E6 C9
ANA L                         ; [0x060F]   A5
PUSH H                        ; [0x0610]   E5
DAD B                         ; [0x0611]   09
ADD B                         ; [0x0612]   80
ADD L                         ; [0x0613]   85
PUSH H                        ; [0x0614]   E5
ANA L                         ; [0x0615]   A5
RST 0                         ; [0x0616]   C7
RNC                           ; [0x0617]   D0
DAD B                         ; [0x0618]   09
XRA C                         ; [0x0619]   A9
CMP A                         ; [0x061A]   BF
ADD L                         ; [0x061B]   85
RST 0                         ; [0x061C]   C7
NOP                           ; [0x061D]   10
INX B                         ; [0x061E]   03
MOV C, H                      ; [0x061F]   4C
ADC C                         ; [0x0620]   89
ORI #A5h                      ; [0x0621]   F6 A5
XRA D                         ; [0x0623]   AA
DAD H                         ; [0x0624]   29
MVI B, #F0h                   ; [0x0625]   06 F0
MOV B, B                      ; [0x0627]   40
DAD B                         ; [0x0628]   09
LXI B, #AA45h                 ; [0x0629]   01 45 AA
ADD L                         ; [0x062C]   85
XRA D                         ; [0x062D]   AA
XRA C                         ; [0x062E]   A9
INX H                         ; [0x062F]   23
ADD L                         ; [0x0630]   85
SBB H                         ; [0x0631]   9C
XRA C                         ; [0x0632]   A9
MOV M, L                      ; [0x0633]   75
ADD L                         ; [0x0634]   85
SBB L                         ; [0x0635]   9D
ANA L                         ; [0x0636]   A5
IN #C9h                       ; [0x0637]   DB C9
NOP                           ; [0x0639]   10
RNC                           ; [0x063A]   D0
MVI E, #24h                   ; [0x063B]   1E 24
ANA A                         ; [0x063D]   A7
SIM                           ; [0x063E]   30
LDAX D                        ; [0x063F]   1A
ANA D                         ; [0x0640]   A2
LDAX B                        ; [0x0641]   0A
ORA H                         ; [0x0642]   B4
SUB B                         ; [0x0643]   90
ORA L                         ; [0x0644]   B5
SBB A                         ; [0x0645]   9F
SUB L                         ; [0x0646]   95
SUB B                         ; [0x0647]   90
SUB H                         ; [0x0648]   94
SBB A                         ; [0x0649]   9F
JZ #F510h                     ; [0x064A]   CA 10 F5
RIM                           ; [0x064D]   20
LDA #A5FFh                    ; [0x064E]   3A FF A5
XRA D                         ; [0x0651]   AA
MOV C, C                      ; [0x0652]   49
MOV B, B                      ; [0x0653]   40
ADD L                         ; [0x0654]   85
XRA D                         ; [0x0655]   AA
DAD H                         ; [0x0656]   29
MOV B, B                      ; [0x0657]   40
RNC                           ; [0x0658]   D0
STAX B                        ; [0x0659]   02
ADI #C9h                      ; [0x065A]   C6 C9
XRA C                         ; [0x065C]   A9
MOV B, B                      ; [0x065D]   40
ADD L                         ; [0x065E]   85
JZ #B4A9h                     ; [0x065F]   CA A9 B4
ADD L                         ; [0x0662]   85
SBB M                         ; [0x0663]   9E
XRA C                         ; [0x0664]   A9
NOP                           ; [0x0665]   00
ADD L                         ; [0x0666]   85
CZ #C6C6h                     ; [0x0667]   CC C6 C6
RNC                           ; [0x066A]   D0
DCR E                         ; [0x066B]   1D
ANA L                         ; [0x066C]   A5
SUB C                         ; [0x066D]   91
RET                           ; [0x066E]   C9
RLC                           ; [0x066F]   07
SUB B                         ; [0x0670]   90
RAL                           ; [0x0671]   17
RIM                           ; [0x0672]   20
EI                            ; [0x0673]   FB
NOP                           ; [0x0674]   FD
DAD H                         ; [0x0675]   29
LXI B, #9845h                 ; [0x0676]   01 45 98
ADD L                         ; [0x0679]   85
SBB B                         ; [0x067A]   98
MOV C, D                      ; [0x067B]   4A
XRA C                         ; [0x067C]   A9
SBB B                         ; [0x067D]   98
SUB B                         ; [0x067E]   90
STAX B                        ; [0x067F]   02
XRA C                         ; [0x0680]   A9
NOP                           ; [0x0681]   00
ADD L                         ; [0x0682]   85
SBB M                         ; [0x0683]   9E
XRA C                         ; [0x0684]   A9
INR B                         ; [0x0685]   04
RIM                           ; [0x0686]   20
ADC E                         ; [0x0687]   8B
CP #4Ch                       ; [0x0688]   FE 4C
MOV M, L                      ; [0x068A]   75
RM                            ; [0x068B]   F8
ANA L                         ; [0x068C]   A5
JZ #B04Ah                     ; [0x068D]   CA 4A B0
INX B                         ; [0x0690]   03
MOV C, H                      ; [0x0691]   4C
IN #F7h                       ; [0x0692]   DB F7
XRA L                         ; [0x0694]   AD
ADD D                         ; [0x0695]   82
STAX B                        ; [0x0696]   02
DAD H                         ; [0x0697]   29
INX B                         ; [0x0698]   03
RET                           ; [0x0699]   C9
STAX B                        ; [0x069A]   02
RNC                           ; [0x069B]   D0
MVI B, #20h                   ; [0x069C]   06 20
ORA D                         ; [0x069E]   B2
CP #4Ch                       ; [0x069F]   FE 4C
MOV B, H                      ; [0x06A1]   44
RST 6                         ; [0x06A2]   F7
XRA L                         ; [0x06A3]   AD
ADD D                         ; [0x06A4]   82
STAX B                        ; [0x06A5]   02
DAD H                         ; [0x06A6]   29
STAX B                        ; [0x06A7]   02
RP                            ; [0x06A8]   F0
DAD B                         ; [0x06A9]   09
ANA L                         ; [0x06AA]   A5
XRA D                         ; [0x06AB]   AA
ADD L                         ; [0x06AC]   85
NOP                           ; [0x06AD]   ED
SIM                           ; [0x06AE]   30
MVI A, #4Ch                   ; [0x06AF]   3E 4C
MOV B, A                      ; [0x06B1]   47
RST 6                         ; [0x06B2]   F7
XRA C                         ; [0x06B3]   A9
ORA C                         ; [0x06B4]   B1
ADD L                         ; [0x06B5]   85
RST 0                         ; [0x06B6]   C7
INR H                         ; [0x06B7]   24
XRA D                         ; [0x06B8]   AA
SIM                           ; [0x06B9]   30
MVI C, #A5h                   ; [0x06BA]   0E A5
XRA D                         ; [0x06BC]   AA
DAD H                         ; [0x06BD]   29
ORA B                         ; [0x06BE]   B0
DAD B                         ; [0x06BF]   09
ADD B                         ; [0x06C0]   80
ADD L                         ; [0x06C1]   85
NOP                           ; [0x06C2]   ED
RIM                           ; [0x06C3]   20
RNZ                           ; [0x06C4]   C0
CP #4Ch                       ; [0x06C5]   FE 4C
MOV B, H                      ; [0x06C7]   44
RST 6                         ; [0x06C8]   F7
ANI #EDh                      ; [0x06C9]   E6 ED
ANA L                         ; [0x06CB]   A5
NOP                           ; [0x06CC]   ED
RET                           ; [0x06CD]   C9
RRC                           ; [0x06CE]   0F
SUB B                         ; [0x06CF]   90
DCR E                         ; [0x06D0]   1D
XRA L                         ; [0x06D1]   AD
ADD D                         ; [0x06D2]   82
STAX B                        ; [0x06D3]   02
MOV C, D                      ; [0x06D4]   4A
XRA C                         ; [0x06D5]   A9
DCR C                         ; [0x06D6]   0D
SUB B                         ; [0x06D7]   90
STAX B                        ; [0x06D8]   02
XRA C                         ; [0x06D9]   A9
STAX B                        ; [0x06DA]   02
ADD L                         ; [0x06DB]   85
NOP                           ; [0x06DC]   ED
ANA L                         ; [0x06DD]   A5
SBB B                         ; [0x06DE]   98
DAD H                         ; [0x06DF]   29
DI                            ; [0x06E0]   F3
ADD L                         ; [0x06E1]   85
SBB B                         ; [0x06E2]   98
ANA L                         ; [0x06E3]   A5
CC #6918h                     ; [0x06E4]   DC 18 69
SUB C                         ; [0x06E7]   91
RP                            ; [0x06E8]   F0
STAX B                        ; [0x06E9]   02
MOV L, C                      ; [0x06EA]   69
MOV M, B                      ; [0x06EB]   70
ADD L                         ; [0x06EC]   85
CC #AAA5h                     ; [0x06ED]   DC A5 AA
DAD B                         ; [0x06F0]   09
ADD B                         ; [0x06F1]   80
ADD L                         ; [0x06F2]   85
XRA D                         ; [0x06F3]   AA
ANA L                         ; [0x06F4]   A5
CC #4A4Ah                     ; [0x06F5]   DC 4A 4A
MOV C, D                      ; [0x06F8]   4A
MOV C, D                      ; [0x06F9]   4A
ADD L                         ; [0x06FA]   85
CPE #B9A8h                    ; [0x06FB]   EC A8 B9
MOV C, E                      ; [0x06FE]   4B
NOP                           ; [0x06FF]   FD
ADD L                         ; [0x0700]   85
IN #A5h                       ; [0x0701]   DB A5
SBB B                         ; [0x0703]   98
DAD H                         ; [0x0704]   29
RST 1                         ; [0x0705]   CF
DAD D                         ; [0x0706]   19
MOV D, D                      ; [0x0707]   52
NOP                           ; [0x0708]   FD
ADD L                         ; [0x0709]   85
SBB B                         ; [0x070A]   98
XRA C                         ; [0x070B]   A9
XRA D                         ; [0x070C]   AA
ADD L                         ; [0x070D]   85
RST 4                         ; [0x070E]   E7
XRA C                         ; [0x070F]   A9
ANA D                         ; [0x0710]   A2
ADD L                         ; [0x0711]   85
PCHL                          ; [0x0712]   E9
ANA B                         ; [0x0713]   A0
NOP                           ; [0x0714]   00
SBB B                         ; [0x0715]   98
NOP                           ; [0x0716]   38
MOV H, L                      ; [0x0717]   65
CC #0AC9h                     ; [0x0718]   DC C9 0A
SUB B                         ; [0x071B]   90
MVI B, #C8h                   ; [0x071C]   06 C8
PCHL                          ; [0x071E]   E9
LDAX B                        ; [0x071F]   0A
MOV C, H                      ; [0x0720]   4C
DAD D                         ; [0x0721]   19
RST 6                         ; [0x0722]   F7
MOV A, C                      ; [0x0723]   79
DAD SP                        ; [0x0724]   39
NOP                           ; [0x0725]   FD
ADD L                         ; [0x0726]   85
RPE                           ; [0x0727]   E8
ANA L                         ; [0x0728]   A5
CC #63C9h                     ; [0x0729]   DC C9 63
XRA C                         ; [0x072C]   A9
XRA D                         ; [0x072D]   AA
SUB B                         ; [0x072E]   90
STAX B                        ; [0x072F]   02
XRA C                         ; [0x0730]   A9
ANA C                         ; [0x0731]   A1
ADD L                         ; [0x0732]   85
ANI #A5h                      ; [0x0733]   E6 A5
CC #10C9h                     ; [0x0735]   DC C9 10
ORA B                         ; [0x0738]   B0
STAX B                        ; [0x0739]   02
ADI #E9h                      ; [0x073A]   C6 E9
RET                           ; [0x073C]   C9
DAD B                         ; [0x073D]   09
ORA B                         ; [0x073E]   B0
INR B                         ; [0x073F]   04
MOV L, C                      ; [0x0740]   69
ANA C                         ; [0x0741]   A1
ADD L                         ; [0x0742]   85
RPE                           ; [0x0743]   E8
MOV C, H                      ; [0x0744]   4C
MOV M, L                      ; [0x0745]   75
RM                            ; [0x0746]   F8
ANA L                         ; [0x0747]   A5
JZ #B04Ah                     ; [0x0748]   CA 4A B0
INX B                         ; [0x074B]   03
MOV C, H                      ; [0x074C]   4C
IN #F7h                       ; [0x074D]   DB F7
ANA L                         ; [0x074F]   A5
RST 0                         ; [0x0750]   C7
RNC                           ; [0x0751]   D0
SPHL                          ; [0x0752]   F9
INR H                         ; [0x0753]   24
SBB B                         ; [0x0754]   98
SIM                           ; [0x0755]   30
STAX D                        ; [0x0756]   12
ANA L                         ; [0x0757]   A5
XRA D                         ; [0x0758]   AA
DAD H                         ; [0x0759]   29
RLC                           ; [0x075A]   07
RNC                           ; [0x075B]   D0
INC C                         ; [0x075C]   0C
ANA L                         ; [0x075D]   A5
IN #29h                       ; [0x075E]   DB 29
NOP                           ; [0x0760]   10
RP                            ; [0x0761]   F0
MOV E, B                      ; [0x0762]   58
ANA L                         ; [0x0763]   A5
PUSH D                        ; [0x0764]   D5
RET                           ; [0x0765]   C9
CPE #03B0h                    ; [0x0766]   EC B0 03
MOV C, H                      ; [0x0769]   4C
RC                            ; [0x076A]   D8
RST 6                         ; [0x076B]   F7
ANA L                         ; [0x076C]   A5
IN #C9h                       ; [0x076D]   DB C9
INR D                         ; [0x076F]   14
RP                            ; [0x0770]   F0
NOP                           ; [0x0771]   08
RET                           ; [0x0772]   C9
SUB B                         ; [0x0773]   90
RNC                           ; [0x0774]   D0
DAD B                         ; [0x0775]   09
INR H                         ; [0x0776]   24
XRA D                         ; [0x0777]   AA
MOV D, B                      ; [0x0778]   50
LXI H, #0D24h                 ; [0x0779]   21 24 0D
MOV C, H                      ; [0x077C]   4C
SBB L                         ; [0x077D]   9D
RST 6                         ; [0x077E]   F7
ANA L                         ; [0x077F]   A5
IN #10h                       ; [0x0780]   DB 10
LDAX B                        ; [0x0782]   0A
ADI #D9h                      ; [0x0783]   C6 D9
RNC                           ; [0x0785]   D0
MVI B, #24h                   ; [0x0786]   06 24
XRA D                         ; [0x0788]   AA
MOV D, B                      ; [0x0789]   50
INR D                         ; [0x078A]   14
MOV M, B                      ; [0x078B]   70
MVI E, #24h                   ; [0x078C]   1E 24
XRA D                         ; [0x078E]   AA
MOV M, B                      ; [0x078F]   70
MVI D, #A5h                   ; [0x0790]   16 A5
IN #29h                       ; [0x0792]   DB 29
RIM                           ; [0x0794]   20
RP                            ; [0x0795]   F0
INR B                         ; [0x0796]   04
INR H                         ; [0x0797]   24
DCR C                         ; [0x0798]   0D
NOP                           ; [0x0799]   10
INR B                         ; [0x079A]   04
INR H                         ; [0x079B]   24
INC C                         ; [0x079C]   0C
SIM                           ; [0x079D]   30
DAD SP                        ; [0x079E]   39
ANA L                         ; [0x079F]   A5
SBB B                         ; [0x07A0]   98
DAD H                         ; [0x07A1]   29
EI                            ; [0x07A2]   FB
ANA D                         ; [0x07A3]   A2
NOP                           ; [0x07A4]   00
NOP                           ; [0x07A5]   10
LDAX B                        ; [0x07A6]   0A
INR H                         ; [0x07A7]   24
DCR C                         ; [0x07A8]   0D
SIM                           ; [0x07A9]   30
DCR L                         ; [0x07AA]   2D
ANA D                         ; [0x07AB]   A2
LXI B, #98A5h                 ; [0x07AC]   01 A5 98
DAD B                         ; [0x07AF]   09
INR B                         ; [0x07B0]   04
ADD L                         ; [0x07B1]   85
SBB B                         ; [0x07B2]   98
ANA B                         ; [0x07B3]   A0
NOP                           ; [0x07B4]   00
RIM                           ; [0x07B5]   20
XRA A                         ; [0x07B6]   AF
EI                            ; [0x07B7]   FB
MOV C, H                      ; [0x07B8]   4C
RC                            ; [0x07B9]   D8
RST 6                         ; [0x07BA]   F7
ANA B                         ; [0x07BB]   A0
LXI B, #01A2h                 ; [0x07BC]   01 A2 01
ANA L                         ; [0x07BF]   A5
SBB B                         ; [0x07C0]   98
DAD SP                        ; [0x07C1]   39
SBI #FCh                      ; [0x07C2]   DE FC
RNC                           ; [0x07C4]   D0
LXI B, #B9CAh                 ; [0x07C5]   01 CA B9
PUSH D                        ; [0x07C8]   D5
NOP                           ; [0x07C9]   00
RET                           ; [0x07CA]   C9
CPE #0790h                    ; [0x07CB]   EC 90 07
ORA L                         ; [0x07CE]   B5
INC C                         ; [0x07CF]   0C
SIM                           ; [0x07D0]   30
INX B                         ; [0x07D1]   03
RIM                           ; [0x07D2]   20
XRA A                         ; [0x07D3]   AF
EI                            ; [0x07D4]   FB
ADC B                         ; [0x07D5]   88
NOP                           ; [0x07D6]   10
PUSH H                        ; [0x07D7]   E5
MOV C, H                      ; [0x07D8]   4C
MOV M, L                      ; [0x07D9]   75
RM                            ; [0x07DA]   F8
ANA L                         ; [0x07DB]   A5
XRA D                         ; [0x07DC]   AA
DAD H                         ; [0x07DD]   29
RLC                           ; [0x07DE]   07
RNC                           ; [0x07DF]   D0
RST 6                         ; [0x07E0]   F7
XRA B                         ; [0x07E1]   A8
ANA L                         ; [0x07E2]   A5
SUB C                         ; [0x07E3]   91
RP                            ; [0x07E4]   F0
JP #EBA9h                     ; [0x07E5]   F2 A9 EB
ADD L                         ; [0x07E8]   85
XRI #C5h                      ; [0x07E9]   EE C5
JNC #EAB0h                    ; [0x07EB]   D2 B0 EA
RIM                           ; [0x07EE]   20
EI                            ; [0x07EF]   FB
NOP                           ; [0x07F0]   FD
NOP                           ; [0x07F1]   10
LDAX D                        ; [0x07F2]   1A
DAD H                         ; [0x07F3]   29
INX B                         ; [0x07F4]   03
LDAX B                        ; [0x07F5]   0A
ADD L                         ; [0x07F6]   85
XRI #A5h                      ; [0x07F7]   EE A5
JPE #4A4Ah                    ; [0x07F9]   EA 4A 4A
XRA D                         ; [0x07FC]   AA
ADC D                         ; [0x07FD]   8A
NOP                           ; [0x07FE]   38
MOV H, L                      ; [0x07FF]   65
XRI #29h                      ; [0x0800]   EE 29
RLC                           ; [0x0802]   07
XRA D                         ; [0x0803]   AA
CMP L                         ; [0x0804]   BD
CC #25FCh                     ; [0x0805]   DC FC 25
XCHG                          ; [0x0808]   EB
RP                            ; [0x0809]   F0
JP #2FD0h                     ; [0x080A]   F2 D0 2F
ANA L                         ; [0x080D]   A5
SBB B                         ; [0x080E]   98
DAD H                         ; [0x080F]   29
INR B                         ; [0x0810]   04
RP                            ; [0x0811]   F0
LXI B, #A2C8h                 ; [0x0812]   01 C8 A2
DCR B                         ; [0x0815]   05
CMP L                         ; [0x0816]   BD
CC #25FCh                     ; [0x0817]   DC FC 25
XCHG                          ; [0x081A]   EB
RP                            ; [0x081B]   F0
NOP                           ; [0x081C]   10
ANA L                         ; [0x081D]   A5
SBB D                         ; [0x081E]   9A
NOP                           ; [0x081F]   18
MOV L, C                      ; [0x0820]   69
NOP                           ; [0x0821]   FD
NOP                           ; [0x0822]   18
MOV A, L                      ; [0x0823]   7D
DAD SP                        ; [0x0824]   39
NOP                           ; [0x0825]   FD
NOP                           ; [0x0826]   D9
SBB H                         ; [0x0827]   9C
NOP                           ; [0x0828]   00
SUB B                         ; [0x0829]   90
MVI B, #86h                   ; [0x082A]   06 86
XRI #CAh                      ; [0x082C]   EE CA
NOP                           ; [0x082E]   10
ANI #E8h                      ; [0x082F]   E6 E8
ANA L                         ; [0x0831]   A5
JPE #1029h                    ; [0x0832]   EA 29 10
RNC                           ; [0x0835]   D0
DCR B                         ; [0x0836]   05
ANA L                         ; [0x0837]   A5
XRI #30h                      ; [0x0838]   EE 30
LXI B, #86AAh                 ; [0x083A]   01 AA 86
RST 5                         ; [0x083D]   EF
CMP L                         ; [0x083E]   BD
CC #85FCh                     ; [0x083F]   DC FC 85
RP                            ; [0x0842]   F0
ANA D                         ; [0x0843]   A2
RST 7                         ; [0x0844]   FF
RPE                           ; [0x0845]   E8
PRO                           ; [0x0846]   E0
MVI B, #B0h                   ; [0x0847]   06 B0
DCX H                         ; [0x0849]   2B
ORA L                         ; [0x084A]   B5
SUB D                         ; [0x084B]   92
DCR H                         ; [0x084C]   25
RP                            ; [0x084D]   F0
RP                            ; [0x084E]   F0
PUSH PSW                      ; [0x084F]   F5
XRA C                         ; [0x0850]   A9
INR A                         ; [0x0851]   3C
MOV H, L                      ; [0x0852]   65
SUB B                         ; [0x0853]   90
NOP                           ; [0x0854]   FD
LXI SP, #85FDh                ; [0x0855]   31 FD 85
JNC #E538h                    ; [0x0858]   D2 38 E5
POP D                         ; [0x085B]   D1
RET                           ; [0x085C]   C9
NOP                           ; [0x085D]   10
SUB B                         ; [0x085E]   90
LXI D, #F1C9h                 ; [0x085F]   11 C9 F1
ORA B                         ; [0x0862]   B0
DCR C                         ; [0x0863]   0D
ANA H                         ; [0x0864]   A4
RST 5                         ; [0x0865]   EF
ANA L                         ; [0x0866]   A5
SBB D                         ; [0x0867]   9A
MOV A, C                      ; [0x0868]   79
DAD SP                        ; [0x0869]   39
NOP                           ; [0x086A]   FD
MOV L, C                      ; [0x086B]   69
INR B                         ; [0x086C]   04
ADD L                         ; [0x086D]   85
CNC #04D0h                    ; [0x086E]   D4 D0 04
XRA C                         ; [0x0871]   A9
ORI #85h                      ; [0x0872]   F6 85
JNC #AAA5h                    ; [0x0874]   D2 A5 AA
DAD H                         ; [0x0877]   29
RLC                           ; [0x0878]   07
RNC                           ; [0x0879]   D0
MOV A, D                      ; [0x087A]   7A
INR H                         ; [0x087B]   24
SBB B                         ; [0x087C]   98
SIM                           ; [0x087D]   30
HLT                           ; [0x087E]   76
ANA B                         ; [0x087F]   A0
RST 7                         ; [0x0880]   FF
ANA L                         ; [0x0881]   A5
SUB C                         ; [0x0882]   91
RP                            ; [0x0883]   F0
MOV M, B                      ; [0x0884]   70
RZ                            ; [0x0885]   C8
NOP                           ; [0x0886]   D9
CPO #90FCh                    ; [0x0887]   E4 FC 90
JM #F6B9h                     ; [0x088A]   FA B9 F6
CM #EE85h                     ; [0x088D]   FC 85 EE
CMP C                         ; [0x0890]   B9
NOP                           ; [0x0891]   ED
CM #EF85h                     ; [0x0892]   FC 85 EF
ANA L                         ; [0x0895]   A5
JZ #3F29h                     ; [0x0896]   CA 29 3F
ADD L                         ; [0x0899]   85
RP                            ; [0x089A]   F0
NOP                           ; [0x089B]   18
MOV H, L                      ; [0x089C]   65
RST 5                         ; [0x089D]   EF
RET                           ; [0x089E]   C9
MOV B, C                      ; [0x089F]   41
ORA B                         ; [0x08A0]   B0
MOV D, E                      ; [0x08A1]   53
ANA L                         ; [0x08A2]   A5
RP                            ; [0x08A3]   F0
RP                            ; [0x08A4]   F0
DAD B                         ; [0x08A5]   09
PUSH B                        ; [0x08A6]   C5
RST 5                         ; [0x08A7]   EF
SUB B                         ; [0x08A8]   90
MOV C, E                      ; [0x08A9]   4B
PUSH H                        ; [0x08AA]   E5
RST 5                         ; [0x08AB]   EF
MOV C, H                      ; [0x08AC]   4C
ANA H                         ; [0x08AD]   A4
RM                            ; [0x08AE]   F8
INR H                         ; [0x08AF]   24
ADC E                         ; [0x08B0]   8B
XRA C                         ; [0x08B1]   A9
DAD B                         ; [0x08B2]   09
MOV M, B                      ; [0x08B3]   70
STAX B                        ; [0x08B4]   02
XRA C                         ; [0x08B5]   A9
RST 7                         ; [0x08B6]   FF
ADD L                         ; [0x08B7]   85
ADC E                         ; [0x08B8]   8B
XRA C                         ; [0x08B9]   A9
LXI B, #7E20h                 ; [0x08BA]   01 20 7E
CP #A5h                       ; [0x08BD]   FE A5
SBB B                         ; [0x08BF]   98
DAD H                         ; [0x08C0]   29
STAX B                        ; [0x08C1]   02
RP                            ; [0x08C2]   F0
RRC                           ; [0x08C3]   0F
ANA L                         ; [0x08C4]   A5
SBB D                         ; [0x08C5]   9A
NOP                           ; [0x08C6]   18
MOV H, L                      ; [0x08C7]   65
XRI #85h                      ; [0x08C8]   EE 85
SBB D                         ; [0x08CA]   9A
PUSH B                        ; [0x08CB]   C5
ADC L                         ; [0x08CC]   8D
SUB B                         ; [0x08CD]   90
MVI H, #A5h                   ; [0x08CE]   26 A5
ADC L                         ; [0x08D0]   8D
RNC                           ; [0x08D1]   D0
DCR C                         ; [0x08D2]   0D
ANA L                         ; [0x08D3]   A5
SBB D                         ; [0x08D4]   9A
NOP                           ; [0x08D5]   38
PUSH H                        ; [0x08D6]   E5
XRI #85h                      ; [0x08D7]   EE 85
SBB D                         ; [0x08D9]   9A
RET                           ; [0x08DA]   C9
RAL                           ; [0x08DB]   17
ORA B                         ; [0x08DC]   B0
RAL                           ; [0x08DD]   17
XRA C                         ; [0x08DE]   A9
RAL                           ; [0x08DF]   17
ADD L                         ; [0x08E0]   85
SBB D                         ; [0x08E1]   9A
ANA L                         ; [0x08E2]   A5
SBB B                         ; [0x08E3]   98
MOV C, C                      ; [0x08E4]   49
STAX B                        ; [0x08E5]   02
ADD L                         ; [0x08E6]   85
SBB B                         ; [0x08E7]   98
SIM                           ; [0x08E8]   30
DCX B                         ; [0x08E9]   0B
INR H                         ; [0x08EA]   24
XRA D                         ; [0x08EB]   AA
SIM                           ; [0x08EC]   30
RLC                           ; [0x08ED]   07
ANA L                         ; [0x08EE]   A5
SUB B                         ; [0x08EF]   90
NOP                           ; [0x08F0]   18
MOV L, C                      ; [0x08F1]   69
DCR B                         ; [0x08F2]   05
ADD L                         ; [0x08F3]   85
SUB B                         ; [0x08F4]   90
XRA C                         ; [0x08F5]   A9
DCR B                         ; [0x08F6]   05
ADD L                         ; [0x08F7]   85
ADC H                         ; [0x08F8]   8C
XRA C                         ; [0x08F9]   A9
DCX B                         ; [0x08FA]   0B
NOP                           ; [0x08FB]   38
PUSH H                        ; [0x08FC]   E5
SUB B                         ; [0x08FD]   90
ADD L                         ; [0x08FE]   85
ADC M                         ; [0x08FF]   8E
INR H                         ; [0x0900]   24
SBB B                         ; [0x0901]   98
MOV M, B                      ; [0x0902]   70
RLC                           ; [0x0903]   07
ANA L                         ; [0x0904]   A5
ADC M                         ; [0x0905]   8E
NOP                           ; [0x0906]   18
MOV L, C                      ; [0x0907]   69
INC C                         ; [0x0908]   0C
ADD L                         ; [0x0909]   85
ADC M                         ; [0x090A]   8E
ANA D                         ; [0x090B]   A2
EI                            ; [0x090C]   FB
ORA L                         ; [0x090D]   B5
SUB A                         ; [0x090E]   97
RNC                           ; [0x090F]   D0
INC C                         ; [0x0910]   0C
ADI #8Ch                      ; [0x0911]   C6 8C
ANA L                         ; [0x0913]   A5
ADC M                         ; [0x0914]   8E
NOP                           ; [0x0915]   18
MOV L, C                      ; [0x0916]   69
DAD B                         ; [0x0917]   09
ADD L                         ; [0x0918]   85
ADC M                         ; [0x0919]   8E
RPE                           ; [0x091A]   E8
RNC                           ; [0x091B]   D0
RP                            ; [0x091C]   F0
ANA L                         ; [0x091D]   A5
ADC M                         ; [0x091E]   8E
NOP                           ; [0x091F]   10
LXI SP, #98A5h                ; [0x0920]   31 A5 98
DAD H                         ; [0x0923]   29
MOV B, B                      ; [0x0924]   40
RP                            ; [0x0925]   F0
DCR C                         ; [0x0926]   0D
MOV B, L                      ; [0x0927]   45
SBB B                         ; [0x0928]   98
ADD L                         ; [0x0929]   85
SBB B                         ; [0x092A]   98
ANA L                         ; [0x092B]   A5
ADC M                         ; [0x092C]   8E
NOP                           ; [0x092D]   18
MOV L, C                      ; [0x092E]   69
INC C                         ; [0x092F]   0C
ADD L                         ; [0x0930]   85
ADC M                         ; [0x0931]   8E
NOP                           ; [0x0932]   10
MVI E, #A9h                   ; [0x0933]   1E A9
NOP                           ; [0x0935]   00
ADD L                         ; [0x0936]   85
ADC M                         ; [0x0937]   8E
ANA L                         ; [0x0938]   A5
SBB B                         ; [0x0939]   98
SIM                           ; [0x093A]   30
MVI D, #09h                   ; [0x093B]   16 09
ADD B                         ; [0x093D]   80
ADD L                         ; [0x093E]   85
SBB B                         ; [0x093F]   98
ANA H                         ; [0x0940]   A4
ADC H                         ; [0x0941]   8C
ANA L                         ; [0x0942]   A5
SUB B                         ; [0x0943]   90
NOP                           ; [0x0944]   18
MOV A, C                      ; [0x0945]   79
JP #85FFh                     ; [0x0946]   F2 FF 85
SUB B                         ; [0x0949]   90
RIM                           ; [0x094A]   20
MOV M, L                      ; [0x094B]   75
CP #A9h                       ; [0x094C]   FE A9
MVI B, #20h                   ; [0x094E]   06 20
MOV A, M                      ; [0x0950]   7E
CP #A2h                       ; [0x0951]   FE A2
DCR B                         ; [0x0953]   05
XRA C                         ; [0x0954]   A9
NOP                           ; [0x0955]   00
DCR D                         ; [0x0956]   15
SUB D                         ; [0x0957]   92
JZ #FB10h                     ; [0x0958]   CA 10 FB
ADD L                         ; [0x095B]   85
XCHG                          ; [0x095C]   EB
ANA L                         ; [0x095D]   A5
XCHG                          ; [0x095E]   EB
RP                            ; [0x095F]   F0
DCR L                         ; [0x0960]   2D
MOV C, D                      ; [0x0961]   4A
ORA B                         ; [0x0962]   B0
NOP                           ; [0x0963]   18
RIM                           ; [0x0964]   20
NOP                           ; [0x0965]   ED
EI                            ; [0x0966]   FB
XRA C                         ; [0x0967]   A9
LDA #C885h                    ; [0x0968]   3A 85 C8
ANA D                         ; [0x096B]   A2
DCR B                         ; [0x096C]   05
MOV D, M                      ; [0x096D]   56
SUB D                         ; [0x096E]   92
JZ #FB10h                     ; [0x096F]   CA 10 FB
ANA L                         ; [0x0972]   A5
SBB D                         ; [0x0973]   9A
MOV L, C                      ; [0x0974]   69
NOP                           ; [0x0975]   10
ADD L                         ; [0x0976]   85
SBB D                         ; [0x0977]   9A
MOV B, M                      ; [0x0978]   46
XCHG                          ; [0x0979]   EB
RNC                           ; [0x097A]   D0
POP H                         ; [0x097B]   E1
ANA D                         ; [0x097C]   A2
MVI B, #CAh                   ; [0x097D]   06 CA
CMP L                         ; [0x097F]   BD
CC #25FCh                     ; [0x0980]   DC FC 25
XCHG                          ; [0x0983]   EB
RP                            ; [0x0984]   F0
RM                            ; [0x0985]   F8
XRA C                         ; [0x0986]   A9
ADD D                         ; [0x0987]   82
NOP                           ; [0x0988]   38
NOP                           ; [0x0989]   FD
DAD SP                        ; [0x098A]   39
NOP                           ; [0x098B]   FD
ADD L                         ; [0x098C]   85
ADC L                         ; [0x098D]   8D
ANA L                         ; [0x098E]   A5
SUB B                         ; [0x098F]   90
ADD L                         ; [0x0990]   85
ADC A                         ; [0x0991]   8F
ANA D                         ; [0x0992]   A2
INR B                         ; [0x0993]   04
ORA L                         ; [0x0994]   B5
SBB C                         ; [0x0995]   99
RIM                           ; [0x0996]   20
MOV H, A                      ; [0x0997]   67
NOP                           ; [0x0998]   FD
JZ #F8D0h                     ; [0x0999]   CA D0 F8
XRA L                         ; [0x099C]   AD
ADD D                         ; [0x099D]   82
STAX B                        ; [0x099E]   02
DAD H                         ; [0x099F]   29
NOP                           ; [0x09A0]   08
XRA B                         ; [0x09A1]   A8
RP                            ; [0x09A2]   F0
STAX B                        ; [0x09A3]   02
XRA C                         ; [0x09A4]   A9
RST 6                         ; [0x09A5]   F7
DAD B                         ; [0x09A6]   09
RLC                           ; [0x09A7]   07
ADD L                         ; [0x09A8]   85
XRI #A2h                      ; [0x09A9]   EE A2
RM                            ; [0x09AB]   F8
CMP C                         ; [0x09AC]   B9
RST 7                         ; [0x09AD]   FF
CM #C745h                     ; [0x09AE]   FC 45 C7
DCR H                         ; [0x09B1]   25
XRI #95h                      ; [0x09B2]   EE 95
PUSH H                        ; [0x09B4]   E5
RZ                            ; [0x09B5]   C8
RPE                           ; [0x09B6]   E8
SIM                           ; [0x09B7]   30
DI                            ; [0x09B8]   F3
INR H                         ; [0x09B9]   24
XRA D                         ; [0x09BA]   AA
SIM                           ; [0x09BB]   30
INR B                         ; [0x09BC]   04
ANA L                         ; [0x09BD]   A5
RST 0                         ; [0x09BE]   C7
RNC                           ; [0x09BF]   D0
STAX D                        ; [0x09C0]   12
ANA L                         ; [0x09C1]   A5
RZ                            ; [0x09C2]   C8
DAD H                         ; [0x09C3]   29
NOP                           ; [0x09C4]   38
RET                           ; [0x09C5]   C9
SIM                           ; [0x09C6]   30
RNC                           ; [0x09C7]   D0
LDAX B                        ; [0x09C8]   0A
ANA L                         ; [0x09C9]   A5
CC #0829h                     ; [0x09CA]   DC 29 08
RP                            ; [0x09CD]   F0
INR B                         ; [0x09CE]   04
ANA L                         ; [0x09CF]   A5
XTHL                          ; [0x09D0]   E3
ADD L                         ; [0x09D1]   85
POP H                         ; [0x09D2]   E1
ANA L                         ; [0x09D3]   A5
SBI #85h                      ; [0x09D4]   DE 85
MVI B, #A5h                   ; [0x09D6]   06 A5
XTHL                          ; [0x09D8]   E3
ADD L                         ; [0x09D9]   85
DAD B                         ; [0x09DA]   09
ANA L                         ; [0x09DB]   A5
JPO #0885h                    ; [0x09DC]   E2 85 08
ANA L                         ; [0x09DF]   A5
JZ #A24Ah                     ; [0x09E0]   CA 4A A2
INR B                         ; [0x09E3]   04
ORA B                         ; [0x09E4]   B0
STAX B                        ; [0x09E5]   02
ANA D                         ; [0x09E6]   A2
NOP                           ; [0x09E7]   00
ADD M                         ; [0x09E8]   86
RST 5                         ; [0x09E9]   EF
ORA L                         ; [0x09EA]   B5
POP D                         ; [0x09EB]   D1
PUSH D                        ; [0x09EC]   D5
JNC #2B90h                    ; [0x09ED]   D2 90 2B
ADD L                         ; [0x09F0]   85
ADD C                         ; [0x09F1]   81
ORA L                         ; [0x09F2]   B5
JNC #D195h                    ; [0x09F3]   D2 95 D1
ANA L                         ; [0x09F6]   A5
ADD C                         ; [0x09F7]   81
SUB L                         ; [0x09F8]   95
JNC #D3B5h                    ; [0x09F9]   D2 B5 D3
ADD L                         ; [0x09FC]   85
ADD C                         ; [0x09FD]   81
ORA L                         ; [0x09FE]   B5
CNC #D395h                    ; [0x09FF]   D4 95 D3
ANA L                         ; [0x0A02]   A5
ADD C                         ; [0x0A03]   81
SUB L                         ; [0x0A04]   95
CNC #CAA5h                    ; [0x0A05]   D4 A5 CA
MOV C, D                      ; [0x0A08]   4A
SUB B                         ; [0x0A09]   90
NOP                           ; [0x0A0A]   10
ANA L                         ; [0x0A0B]   A5
SBB B                         ; [0x0A0C]   98
DAD H                         ; [0x0A0D]   29
INC C                         ; [0x0A0E]   0C
MOV C, D                      ; [0x0A0F]   4A
MOV C, D                      ; [0x0A10]   4A
XRA B                         ; [0x0A11]   A8
ANA L                         ; [0x0A12]   A5
SBB B                         ; [0x0A13]   98
DAD H                         ; [0x0A14]   29
DI                            ; [0x0A15]   F3
DAD D                         ; [0x0A16]   19
LDAX D                        ; [0x0A17]   1A
NOP                           ; [0x0A18]   FD
ADD L                         ; [0x0A19]   85
SBB B                         ; [0x0A1A]   98
ORA L                         ; [0x0A1B]   B5
CNC #05A2h                    ; [0x0A1C]   D4 A2 05
RIM                           ; [0x0A1F]   20
MOV H, A                      ; [0x0A20]   67
NOP                           ; [0x0A21]   FD
ANA M                         ; [0x0A22]   A6
RST 5                         ; [0x0A23]   EF
ORA L                         ; [0x0A24]   B5
POP D                         ; [0x0A25]   D1
ADD L                         ; [0x0A26]   85
ADC C                         ; [0x0A27]   89
ORA L                         ; [0x0A28]   B5
JNC #ECC9h                    ; [0x0A29]   D2 C9 EC
ORA B                         ; [0x0A2C]   B0
INX B                         ; [0x0A2D]   03
NOP                           ; [0x0A2E]   38
PUSH PSW                      ; [0x0A2F]   F5
POP D                         ; [0x0A30]   D1
ADD L                         ; [0x0A31]   85
ADC D                         ; [0x0A32]   8A
ORA L                         ; [0x0A33]   B5
OUT #A2h                      ; [0x0A34]   D3 A2
NOP                           ; [0x0A36]   00
RIM                           ; [0x0A37]   20
MOV H, A                      ; [0x0A38]   67
NOP                           ; [0x0A39]   FD
ANA D                         ; [0x0A3A]   A2
INR B                         ; [0x0A3B]   04
RIM                           ; [0x0A3C]   20
MOV A, M                      ; [0x0A3D]   7E
NOP                           ; [0x0A3E]   FD
ADD L                         ; [0x0A3F]   85
STAX B                        ; [0x0A40]   02
ADD L                         ; [0x0A41]   85
LHLD #84ADh                   ; [0x0A42]   2A AD 84
STAX B                        ; [0x0A45]   02
RNC                           ; [0x0A46]   D0
EI                            ; [0x0A47]   FB
ADD L                         ; [0x0A48]   85
LXI B, #2C85h                 ; [0x0A49]   01 85 2C
ANA D                         ; [0x0A4C]   A2
NOP                           ; [0x0A4D]   00
XRA C                         ; [0x0A4E]   A9
JPE #0285h                    ; [0x0A4F]   EA 85 02
ADC L                         ; [0x0A52]   8D
SUB M                         ; [0x0A53]   96
STAX B                        ; [0x0A54]   02
ADD L                         ; [0x0A55]   85
DCX H                         ; [0x0A56]   2B
INR H                         ; [0x0A57]   24
XRA D                         ; [0x0A58]   AA
SIM                           ; [0x0A59]   30
DAD B                         ; [0x0A5A]   09
ANA L                         ; [0x0A5B]   A5
SBB M                         ; [0x0A5C]   9E
RET                           ; [0x0A5D]   C9
ORA H                         ; [0x0A5E]   B4
RP                            ; [0x0A5F]   F0
INX B                         ; [0x0A60]   03
MOV C, H                      ; [0x0A61]   4C
DCR C                         ; [0x0A62]   0D
EI                            ; [0x0A63]   FB
ANA D                         ; [0x0A64]   A2
RLC                           ; [0x0A65]   07
ANA B                         ; [0x0A66]   A0
INX B                         ; [0x0A67]   03
CMP C                         ; [0x0A68]   B9
ANI #00h                      ; [0x0A69]   E6 00
DAD H                         ; [0x0A6B]   29
RRC                           ; [0x0A6C]   0F
ADD L                         ; [0x0A6D]   85
RP                            ; [0x0A6E]   F0
LDAX B                        ; [0x0A6F]   0A
LDAX B                        ; [0x0A70]   0A
MOV H, L                      ; [0x0A71]   65
RP                            ; [0x0A72]   F0
MOV L, C                      ; [0x0A73]   69
MOV D, H                      ; [0x0A74]   54
SUB L                         ; [0x0A75]   95
RP                            ; [0x0A76]   F0
JZ #E6B9h                     ; [0x0A77]   CA B9 E6
NOP                           ; [0x0A7A]   00
MOV C, D                      ; [0x0A7B]   4A
MOV C, D                      ; [0x0A7C]   4A
MOV C, D                      ; [0x0A7D]   4A
MOV C, D                      ; [0x0A7E]   4A
ADD L                         ; [0x0A7F]   85
RP                            ; [0x0A80]   F0
LDAX B                        ; [0x0A81]   0A
LDAX B                        ; [0x0A82]   0A
MOV H, L                      ; [0x0A83]   65
RP                            ; [0x0A84]   F0
MOV L, C                      ; [0x0A85]   69
MOV D, H                      ; [0x0A86]   54
SUB L                         ; [0x0A87]   95
RP                            ; [0x0A88]   F0
JZ #1088h                     ; [0x0A89]   CA 88 10
IN #85h                       ; [0x0A8C]   DB 85
STAX B                        ; [0x0A8E]   02
ANA L                         ; [0x0A8F]   A5
RST 3                         ; [0x0A90]   DF
ADD L                         ; [0x0A91]   85
MVI B, #A9h                   ; [0x0A92]   06 A9
STAX B                        ; [0x0A94]   02
ADD L                         ; [0x0A95]   85
LDAX B                        ; [0x0A96]   0A
ANA L                         ; [0x0A97]   A5
PRO                           ; [0x0A98]   E0
ADD L                         ; [0x0A99]   85
RLC                           ; [0x0A9A]   07
XRA C                         ; [0x0A9B]   A9
INR B                         ; [0x0A9C]   04
ADD L                         ; [0x0A9D]   85
XRI #A9h                      ; [0x0A9E]   EE A9
RST 7                         ; [0x0AA0]   FF
ADD L                         ; [0x0AA1]   85
RST 5                         ; [0x0AA2]   EF
JPE #A2EAh                    ; [0x0AA3]   EA EA A2
DCR B                         ; [0x0AA6]   05
JZ #FD10h                     ; [0x0AA7]   CA 10 FD
ANA H                         ; [0x0AAA]   A4
RP                            ; [0x0AAB]   F0
ORA C                         ; [0x0AAC]   B1
XRI #85h                      ; [0x0AAD]   EE 85
DCR C                         ; [0x0AAF]   0D
XRA C                         ; [0x0AB0]   A9
NOP                           ; [0x0AB1]   00
ADD L                         ; [0x0AB2]   85
MVI C, #A4h                   ; [0x0AB3]   0E A4
PUSH PSW                      ; [0x0AB5]   F5
ORA C                         ; [0x0AB6]   B1
XRI #4Ah                      ; [0x0AB7]   EE 4A
MOV C, D                      ; [0x0AB9]   4A
MOV C, D                      ; [0x0ABA]   4A
MOV C, D                      ; [0x0ABB]   4A
ADD L                         ; [0x0ABC]   85
RRC                           ; [0x0ABD]   0F
ANA H                         ; [0x0ABE]   A4
JP #EEB1h                     ; [0x0ABF]   F2 B1 EE
ADD L                         ; [0x0AC2]   85
DCR C                         ; [0x0AC3]   0D
ANA H                         ; [0x0AC4]   A4
RST 6                         ; [0x0AC5]   F7
ORA C                         ; [0x0AC6]   B1
XRI #4Ah                      ; [0x0AC7]   EE 4A
MOV C, D                      ; [0x0AC9]   4A
MOV C, D                      ; [0x0ACA]   4A
MOV C, D                      ; [0x0ACB]   4A
ADD L                         ; [0x0ACC]   85
RRC                           ; [0x0ACD]   0F
ANA H                         ; [0x0ACE]   A4
CP #EEB1h                     ; [0x0ACF]   F4 B1 EE
DAD H                         ; [0x0AD2]   29
RRC                           ; [0x0AD3]   0F
ADD L                         ; [0x0AD4]   85
ADD C                         ; [0x0AD5]   81
ANA H                         ; [0x0AD6]   A4
POP PSW                       ; [0x0AD7]   F1
ORA C                         ; [0x0AD8]   B1
XRI #0Ah                      ; [0x0AD9]   EE 0A
LDAX B                        ; [0x0ADB]   0A
LDAX B                        ; [0x0ADC]   0A
LDAX B                        ; [0x0ADD]   0A
DCR B                         ; [0x0ADE]   05
ADD C                         ; [0x0ADF]   81
ADD L                         ; [0x0AE0]   85
MVI C, #A9h                   ; [0x0AE1]   0E A9
NOP                           ; [0x0AE3]   00
ADD L                         ; [0x0AE4]   85
DCR C                         ; [0x0AE5]   0D
ADD L                         ; [0x0AE6]   85
RRC                           ; [0x0AE7]   0F
ANA H                         ; [0x0AE8]   A4
ORI #B1h                      ; [0x0AE9]   F6 B1
XRI #29h                      ; [0x0AEB]   EE 29
RRC                           ; [0x0AED]   0F
ADD L                         ; [0x0AEE]   85
ADD C                         ; [0x0AEF]   81
ANA H                         ; [0x0AF0]   A4
DI                            ; [0x0AF1]   F3
ORA C                         ; [0x0AF2]   B1
XRI #0Ah                      ; [0x0AF3]   EE 0A
LDAX B                        ; [0x0AF5]   0A
LDAX B                        ; [0x0AF6]   0A
LDAX B                        ; [0x0AF7]   0A
DCR B                         ; [0x0AF8]   05
ADD C                         ; [0x0AF9]   81
ADD L                         ; [0x0AFA]   85
MVI C, #C6h                   ; [0x0AFB]   0E C6
XRI #10h                      ; [0x0AFD]   EE 10
XRA D                         ; [0x0AFF]   AA
ANA L                         ; [0x0B00]   A5
ADC C                         ; [0x0B01]   89
NOP                           ; [0x0B02]   18
MOV L, C                      ; [0x0B03]   69
SPHL                          ; [0x0B04]   F9
ADD L                         ; [0x0B05]   85
ADC C                         ; [0x0B06]   89
XRA C                         ; [0x0B07]   A9
NOP                           ; [0x0B08]   00
ADD L                         ; [0x0B09]   85
MVI C, #F0h                   ; [0x0B0A]   0E F0
MOV C, B                      ; [0x0B0C]   48
RIM                           ; [0x0B0D]   20
MOV H, A                      ; [0x0B0E]   67
NOP                           ; [0x0B0F]   FD
RIM                           ; [0x0B10]   20
MOV A, M                      ; [0x0B11]   7E
NOP                           ; [0x0B12]   FD
RIM                           ; [0x0B13]   20
PCHL                          ; [0x0B14]   E9
NOP                           ; [0x0B15]   FD
XRA C                         ; [0x0B16]   A9
ANA B                         ; [0x0B17]   A0
ADD L                         ; [0x0B18]   85
XRI #A9h                      ; [0x0B19]   EE A9
CM #EF85h                     ; [0x0B1B]   FC 85 EF
XRA C                         ; [0x0B1E]   A9
NOP                           ; [0x0B1F]   00
ADD L                         ; [0x0B20]   85
INR B                         ; [0x0B21]   04
ADD L                         ; [0x0B22]   85
STAX B                        ; [0x0B23]   02
ADD L                         ; [0x0B24]   85
LHLD #C8A5h                   ; [0x0B25]   2A A5 C8
DAD H                         ; [0x0B28]   29
DAD SP                        ; [0x0B29]   39
RET                           ; [0x0B2A]   C9
DAD SP                        ; [0x0B2B]   39
RNC                           ; [0x0B2C]   D0
MVI C, #A5h                   ; [0x0B2D]   0E A5
RZ                            ; [0x0B2F]   C8
LHLD #2A2Ah                   ; [0x0B30]   2A 2A 2A
LHLD #0329h                   ; [0x0B33]   2A 29 03
XRA B                         ; [0x0B36]   A8
CMP C                         ; [0x0B37]   B9
MVI E, #FDh                   ; [0x0B38]   1E FD
ADD L                         ; [0x0B3A]   85
XRI #85h                      ; [0x0B3B]   EE 85
STAX B                        ; [0x0B3D]   02
ADD L                         ; [0x0B3E]   85
DCX H                         ; [0x0B3F]   2B
RIM                           ; [0x0B40]   20
PCHL                          ; [0x0B41]   E9
NOP                           ; [0x0B42]   FD
ANA B                         ; [0x0B43]   A0
DAD B                         ; [0x0B44]   09
ADD L                         ; [0x0B45]   85
STAX B                        ; [0x0B46]   02
ORA C                         ; [0x0B47]   B1
XRI #85h                      ; [0x0B48]   EE 85
DCX D                         ; [0x0B4A]   1B
SBB B                         ; [0x0B4B]   98
MOV C, D                      ; [0x0B4C]   4A
ORA B                         ; [0x0B4D]   B0
INX B                         ; [0x0B4E]   03
RIM                           ; [0x0B4F]   20
PCHL                          ; [0x0B50]   E9
NOP                           ; [0x0B51]   FD
ADC B                         ; [0x0B52]   88
NOP                           ; [0x0B53]   10
RP                            ; [0x0B54]   F0
XRA C                         ; [0x0B55]   A9
NOP                           ; [0x0B56]   00
ADD L                         ; [0x0B57]   85
STAX B                        ; [0x0B58]   02
ADD L                         ; [0x0B59]   85
DCX D                         ; [0x0B5A]   1B
ANA L                         ; [0x0B5B]   A5
ADD H                         ; [0x0B5C]   84
ADD L                         ; [0x0B5D]   85
LXI H, #2085h                 ; [0x0B5E]   21 85 20
DAD H                         ; [0x0B61]   29
RRC                           ; [0x0B62]   0F
XRA B                         ; [0x0B63]   A8
ADC B                         ; [0x0B64]   88
NOP                           ; [0x0B65]   10
NOP                           ; [0x0B66]   FD
ADD L                         ; [0x0B67]   85
NOP                           ; [0x0B68]   10
XRA C                         ; [0x0B69]   A9
MVI B, #85h                   ; [0x0B6A]   06 85
LXI D, #0285h                 ; [0x0B6C]   11 85 02
ADD L                         ; [0x0B6F]   85
LHLD #0485h                   ; [0x0B70]   2A 85 04
ADD L                         ; [0x0B73]   85
DCR B                         ; [0x0B74]   05
ANA D                         ; [0x0B75]   A2
LDAX B                        ; [0x0B76]   0A
XRA C                         ; [0x0B77]   A9
CM #EF95h                     ; [0x0B78]   FC 95 EF
JZ #10CAh                     ; [0x0B7B]   CA CA 10
JM #E920h                     ; [0x0B7E]   FA 20 E9
NOP                           ; [0x0B81]   FD
ANA L                         ; [0x0B82]   A5
STAX B                        ; [0x0B83]   02
DAD H                         ; [0x0B84]   29
MOV B, B                      ; [0x0B85]   40
ADD L                         ; [0x0B86]   85
ADD D                         ; [0x0B87]   82
ADD L                         ; [0x0B88]   85
INR L                         ; [0x0B89]   2C
ADD L                         ; [0x0B8A]   85
DCX H                         ; [0x0B8B]   2B
XRA C                         ; [0x0B8C]   A9
RP                            ; [0x0B8D]   F0
ADD L                         ; [0x0B8E]   85
LXI H, #0285h                 ; [0x0B8F]   21 85 02
ADD L                         ; [0x0B92]   85
LHLD #E1A5h                   ; [0x0B93]   2A A5 E1
ADD L                         ; [0x0B96]   85
MVI B, #85h                   ; [0x0B97]   06 85
RLC                           ; [0x0B99]   07
ADI #8Fh                      ; [0x0B9A]   C6 8F
NOP                           ; [0x0B9C]   10
DCX B                         ; [0x0B9D]   0B
ANA B                         ; [0x0B9E]   A0
DCR B                         ; [0x0B9F]   05
XRA C                         ; [0x0BA0]   A9
LXI B, #2585h                 ; [0x0BA1]   01 85 25
ADD L                         ; [0x0BA4]   85
MVI H, #4Ch                   ; [0x0BA5]   26 4C
ANA L                         ; [0x0BA7]   A5
RP                            ; [0x0BA8]   F0
RIM                           ; [0x0BA9]   20
ORA D                         ; [0x0BAA]   B2
NOP                           ; [0x0BAB]   FD
MOV C, H                      ; [0x0BAC]   4C
SBB D                         ; [0x0BAD]   9A
EI                            ; [0x0BAE]   FB
ADD M                         ; [0x0BAF]   86
JP #38BEh                     ; [0x0BB0]   F2 BE 38
NOP                           ; [0x0BB3]   FD
ORA L                         ; [0x0BB4]   B5
PUSH D                        ; [0x0BB5]   D5
RET                           ; [0x0BB6]   C9
MOV D, M                      ; [0x0BB7]   56
ORA B                         ; [0x0BB8]   B0
INR B                         ; [0x0BB9]   04
RET                           ; [0x0BBA]   C9
MOV B, L                      ; [0x0BBB]   45
ORA B                         ; [0x0BBC]   B0
MVI L, #A6h                   ; [0x0BBD]   2E A6
JP #55A9h                     ; [0x0BBF]   F2 A9 55
SBB C                         ; [0x0BC2]   99
PUSH D                        ; [0x0BC3]   D5
NOP                           ; [0x0BC4]   00
CMP L                         ; [0x0BC5]   BD
JPO #2DFCh                    ; [0x0BC6]   E2 FC 2D
ADD D                         ; [0x0BC9]   82
STAX B                        ; [0x0BCA]   02
NOP                           ; [0x0BCB]   18
RP                            ; [0x0BCC]   F0
STAX B                        ; [0x0BCD]   02
XRA C                         ; [0x0BCE]   A9
INR B                         ; [0x0BCF]   04
MOV L, C                      ; [0x0BD0]   69
DCR B                         ; [0x0BD1]   05
MOV M, L                      ; [0x0BD2]   75
SBB H                         ; [0x0BD3]   9C
SBB C                         ; [0x0BD4]   99
RST 2                         ; [0x0BD5]   D7
NOP                           ; [0x0BD6]   00
XRA C                         ; [0x0BD7]   A9
INX B                         ; [0x0BD8]   03
RIM                           ; [0x0BD9]   20
ADC E                         ; [0x0BDA]   8B
CP #A5h                       ; [0x0BDB]   FE A5
IN #29h                       ; [0x0BDD]   DB 29
ADD B                         ; [0x0BDF]   80
RP                            ; [0x0BE0]   F0
LDAX B                        ; [0x0BE1]   0A
ANA L                         ; [0x0BE2]   A5
XRA D                         ; [0x0BE3]   AA
MOV C, C                      ; [0x0BE4]   49
MOV B, B                      ; [0x0BE5]   40
ADD L                         ; [0x0BE6]   85
XRA D                         ; [0x0BE7]   AA
XRA C                         ; [0x0BE8]   A9
MOV D, B                      ; [0x0BE9]   50
ADD L                         ; [0x0BEA]   85
NOP                           ; [0x0BEB]   D9
MOV H, B                      ; [0x0BEC]   60
ANA L                         ; [0x0BED]   A5
RZ                            ; [0x0BEE]   C8
DAD H                         ; [0x0BEF]   29
DAD SP                        ; [0x0BF0]   39
RET                           ; [0x0BF1]   C9
DAD SP                        ; [0x0BF2]   39
RNC                           ; [0x0BF3]   D0
NOP                           ; [0x0BF4]   08
XRA C                         ; [0x0BF5]   A9
ORA H                         ; [0x0BF6]   B4
ADD L                         ; [0x0BF7]   85
SBB M                         ; [0x0BF8]   9E
XRA C                         ; [0x0BF9]   A9
NOP                           ; [0x0BFA]   00
ADD L                         ; [0x0BFB]   85
CZ #0060h                     ; [0x0BFC]   CC 60 00
NOP                           ; [0x0BFF]   00
NOP                           ; [0x0C00]   00
NOP                           ; [0x0C01]   00
NOP                           ; [0x0C02]   00
NOP                           ; [0x0C03]   00
NOP                           ; [0x0C04]   00
NOP                           ; [0x0C05]   00
NOP                           ; [0x0C06]   00
NOP                           ; [0x0C07]   00
NOP                           ; [0x0C08]   00
NOP                           ; [0x0C09]   00
CP #FEh                       ; [0x0C0A]   FE FE
MOV A, H                      ; [0x0C0C]   7C
CP #38h                       ; [0x0C0D]   FE 38
NOP                           ; [0x0C0F]   38
MOV A, H                      ; [0x0C10]   7C
NOP                           ; [0x0C11]   38
NOP                           ; [0x0C12]   38
NOP                           ; [0x0C13]   10
ORA M                         ; [0x0C14]   B6
CMP M                         ; [0x0C15]   BE
MOV E, L                      ; [0x0C16]   5D
MOV L, E                      ; [0x0C17]   6B
MOV E, C                      ; [0x0C18]   59
MOV H, E                      ; [0x0C19]   63
INR A                         ; [0x0C1A]   3C
MOV C, H                      ; [0x0C1B]   4C
INR D                         ; [0x0C1C]   14
NOP                           ; [0x0C1D]   28
ORA M                         ; [0x0C1E]   B6
CMP M                         ; [0x0C1F]   BE
MOV E, L                      ; [0x0C20]   5D
MOV E, E                      ; [0x0C21]   5B
INR H                         ; [0x0C22]   24
ADD L                         ; [0x0C23]   85
MOV H, M                      ; [0x0C24]   66
MOV H, H                      ; [0x0C25]   64
NOP                           ; [0x0C26]   28
NOP                           ; [0x0C27]   10
SUB B                         ; [0x0C28]   90
ADC B                         ; [0x0C29]   88
ADC B                         ; [0x0C2A]   88
MOV B, H                      ; [0x0C2B]   44
MOV B, D                      ; [0x0C2C]   42
MOV B, D                      ; [0x0C2D]   42
RST 7                         ; [0x0C2E]   FF
IN #5Ah                       ; [0x0C2F]   DB 5A
NOP                           ; [0x0C31]   18
DAD B                         ; [0x0C32]   09
LXI D, #2211h                 ; [0x0C33]   11 11 22
MOV B, D                      ; [0x0C36]   42
MOV B, D                      ; [0x0C37]   42
RST 7                         ; [0x0C38]   FF
IN #7Eh                       ; [0x0C39]   DB 7E
NOP                           ; [0x0C3B]   18
ANA L                         ; [0x0C3C]   A5
ANA L                         ; [0x0C3D]   A5
ANA L                         ; [0x0C3E]   A5
SBB C                         ; [0x0C3F]   99
SBB C                         ; [0x0C40]   99
ANA L                         ; [0x0C41]   A5
RST 7                         ; [0x0C42]   FF
MOV E, D                      ; [0x0C43]   5A
MOV A, M                      ; [0x0C44]   7E
INR A                         ; [0x0C45]   3C
MOV B, D                      ; [0x0C46]   42
MOV E, D                      ; [0x0C47]   5A
MOV E, D                      ; [0x0C48]   5A
MOV E, D                      ; [0x0C49]   5A
SBB C                         ; [0x0C4A]   99
ANA L                         ; [0x0C4B]   A5
RST 7                         ; [0x0C4C]   FF
MOV E, D                      ; [0x0C4D]   5A
MOV A, M                      ; [0x0C4E]   7E
INR A                         ; [0x0C4F]   3C
JMP #1824h                    ; [0x0C50]   C3 24 18
NOP                           ; [0x0C53]   18
NOP                           ; [0x0C54]   18
MOV E, D                      ; [0x0C55]   5A
CMP L                         ; [0x0C56]   BD
ANA L                         ; [0x0C57]   A5
ADD C                         ; [0x0C58]   81
ADD C                         ; [0x0C59]   81
INR H                         ; [0x0C5A]   24
MOV B, D                      ; [0x0C5B]   42
INR H                         ; [0x0C5C]   24
ANA L                         ; [0x0C5D]   A5
SBB C                         ; [0x0C5E]   99
SBB C                         ; [0x0C5F]   99
CMP L                         ; [0x0C60]   BD
MOV E, D                      ; [0x0C61]   5A
NOP                           ; [0x0C62]   18
NOP                           ; [0x0C63]   00
ADD C                         ; [0x0C64]   81
MOV B, D                      ; [0x0C65]   42
MOV B, D                      ; [0x0C66]   42
INR H                         ; [0x0C67]   24
INR H                         ; [0x0C68]   24
INR A                         ; [0x0C69]   3C
MOV A, M                      ; [0x0C6A]   7E
XCHG                          ; [0x0C6B]   EB
MOV A, M                      ; [0x0C6C]   7E
INR A                         ; [0x0C6D]   3C
NOP                           ; [0x0C6E]   00
INR H                         ; [0x0C6F]   24
MOV E, D                      ; [0x0C70]   5A
MOV B, D                      ; [0x0C71]   42
INR H                         ; [0x0C72]   24
INR A                         ; [0x0C73]   3C
MOV A, M                      ; [0x0C74]   7E
RST 2                         ; [0x0C75]   D7
MOV A, M                      ; [0x0C76]   7E
INR A                         ; [0x0C77]   3C
MOV M, A                      ; [0x0C78]   77
MOV B, H                      ; [0x0C79]   44
MOV B, H                      ; [0x0C7A]   44
MOV B, H                      ; [0x0C7B]   44
MOV E, H                      ; [0x0C7C]   5C
RST 7                         ; [0x0C7D]   FF
DI                            ; [0x0C7E]   F3
DI                            ; [0x0C7F]   F3
MOV A, M                      ; [0x0C80]   7E
INR A                         ; [0x0C81]   3C
XRI #22h                      ; [0x0C82]   EE 22
SHLD #3A22h                   ; [0x0C84]   22 22 3A
RST 7                         ; [0x0C87]   FF
RST 1                         ; [0x0C88]   CF
RST 1                         ; [0x0C89]   CF
MOV A, M                      ; [0x0C8A]   7E
INR A                         ; [0x0C8B]   3C
RST 4                         ; [0x0C8C]   E7
MOV B, D                      ; [0x0C8D]   42
MOV A, M                      ; [0x0C8E]   7E
MOV A, M                      ; [0x0C8F]   7E
MOV L, E                      ; [0x0C90]   6B
MVI A, #98h                   ; [0x0C91]   3E 98
ANA H                         ; [0x0C93]   A4
MOV B, D                      ; [0x0C94]   42
LXI B, #42C6h                 ; [0x0C95]   01 C6 42
MOV A, M                      ; [0x0C98]   7E
MOV A, M                      ; [0x0C99]   7E
MOV D, M                      ; [0x0C9A]   56
MOV A, H                      ; [0x0C9B]   7C
DAD D                         ; [0x0C9C]   19
DCR H                         ; [0x0C9D]   25
MOV B, D                      ; [0x0C9E]   42
ADD B                         ; [0x0C9F]   80
NOP                           ; [0x0CA0]   00
NOP                           ; [0x0CA1]   38
MOV A, H                      ; [0x0CA2]   7C
CP #FEh                       ; [0x0CA3]   FE FE
XRA D                         ; [0x0CA5]   AA
CP #7Ch                       ; [0x0CA6]   FE 7C
NOP                           ; [0x0CA8]   38
NOP                           ; [0x0CA9]   00
NOP                           ; [0x0CAA]   00
NOP                           ; [0x0CAB]   00
NOP                           ; [0x0CAC]   00
INR H                         ; [0x0CAD]   24
INR A                         ; [0x0CAE]   3C
HLT                           ; [0x0CAF]   76
MOV E, H                      ; [0x0CB0]   5C
NOP                           ; [0x0CB1]   28
NOP                           ; [0x0CB2]   00
NOP                           ; [0x0CB3]   00
NOP                           ; [0x0CB4]   00
NOP                           ; [0x0CB5]   00
NOP                           ; [0x0CB6]   00
LXI B, #9524h                 ; [0x0CB7]   01 24 95
MOV C, B                      ; [0x0CBA]   48
RST 0                         ; [0x0CBB]   C7
INR H                         ; [0x0CBC]   24
SUB B                         ; [0x0CBD]   90
RIM                           ; [0x0CBE]   20
MOV B, B                      ; [0x0CBF]   40
MOV E, L                      ; [0x0CC0]   5D
CMP E                         ; [0x0CC1]   BB
ORA M                         ; [0x0CC2]   B6
MOV M, A                      ; [0x0CC3]   77
CZ #7E2Dh                     ; [0x0CC4]   CC 2D 7E
Call #6DDAh                   ; [0x0CC7]   CD DA 6D
MOV M, A                      ; [0x0CCA]   77
MOV M, A                      ; [0x0CCB]   77
ADD D                         ; [0x0CCC]   82
MOV D, H                      ; [0x0CCD]   54
DCR H                         ; [0x0CCE]   25
MOV D, E                      ; [0x0CCF]   53
JMP #9354h                    ; [0x0CD0]   C3 54 93
ANA L                         ; [0x0CD3]   A5
SBB C                         ; [0x0CD4]   99
ADD C                         ; [0x0CD5]   81
NOP                           ; [0x0CD6]   28
MOV A, B                      ; [0x0CD7]   78
MOV H, H                      ; [0x0CD8]   64
MOV D, B                      ; [0x0CD9]   50
INR A                         ; [0x0CDA]   3C
ADC H                         ; [0x0CDB]   8C
LXI B, #0402h                 ; [0x0CDC]   01 02 04
NOP                           ; [0x0CDF]   08
NOP                           ; [0x0CE0]   10
RIM                           ; [0x0CE1]   20
MOV B, B                      ; [0x0CE2]   40
ADD B                         ; [0x0CE3]   80
SHLD #0C16h                   ; [0x0CE4]   22 16 0C
NOP                           ; [0x0CE7]   08
DCR B                         ; [0x0CE8]   05
INR B                         ; [0x0CE9]   04
INX B                         ; [0x0CEA]   03
STAX B                        ; [0x0CEB]   02
NOP                           ; [0x0CEC]   00
RIM                           ; [0x0CED]   20
RIM                           ; [0x0CEE]   20
DCR D                         ; [0x0CEF]   15
DCR D                         ; [0x0CF0]   15
NOP                           ; [0x0CF1]   10
DCX B                         ; [0x0CF2]   0B
RLC                           ; [0x0CF3]   07
RLC                           ; [0x0CF4]   07
INR B                         ; [0x0CF5]   04
LXI B, #0201h                 ; [0x0CF6]   01 01 02
STAX B                        ; [0x0CF9]   02
INX B                         ; [0x0CFA]   03
INX B                         ; [0x0CFB]   03
INX B                         ; [0x0CFC]   03
INR B                         ; [0x0CFD]   04
DCR B                         ; [0x0CFE]   05
RRC                           ; [0x0CFF]   0F
MVI C, #0Fh                   ; [0x0D00]   0E 0F
NOP                           ; [0x0D02]   00
STAX B                        ; [0x0D03]   02
NOP                           ; [0x0D04]   00
INR B                         ; [0x0D05]   04
STAX B                        ; [0x0D06]   02
INR M                         ; [0x0D07]   34
MOV D, D                      ; [0x0D08]   52
CZ #14F6h                     ; [0x0D09]   CC F6 14
RRC                           ; [0x0D0C]   0F
NOP                           ; [0x0D0D]   00
JPO #0A05h                    ; [0x0D0E]   E2 05 0A
RRC                           ; [0x0D11]   0F
INR D                         ; [0x0D12]   14
CMP L                         ; [0x0D13]   BD
ORA H                         ; [0x0D14]   B4
XRA E                         ; [0x0D15]   AB
MOV D, H                      ; [0x0D16]   54
MOV E, C                      ; [0x0D17]   59
MOV E, M                      ; [0x0D18]   5E
MOV H, E                      ; [0x0D19]   63
NOP                           ; [0x0D1A]   00
NOP                           ; [0x0D1B]   08
INR B                         ; [0x0D1C]   04
INC C                         ; [0x0D1D]   0C
XRA D                         ; [0x0D1E]   AA
ORA M                         ; [0x0D1F]   B6
RNZ                           ; [0x0D20]   C0
CZ #7E3Ch                     ; [0x0D21]   CC 3C 7E
MOV A, M                      ; [0x0D24]   7E
MOV A, M                      ; [0x0D25]   7E
MOV A, M                      ; [0x0D26]   7E
RST 7                         ; [0x0D27]   FF
RST 7                         ; [0x0D28]   FF
RST 7                         ; [0x0D29]   FF
JMP #1005h                    ; [0x0D2A]   C3 05 10
DCR D                         ; [0x0D2D]   15
RIM                           ; [0x0D2E]   20
DCR H                         ; [0x0D2F]   25
SIM                           ; [0x0D30]   30
NOP                           ; [0x0D31]   00
DAD B                         ; [0x0D32]   09
STAX D                        ; [0x0D33]   12
DCX D                         ; [0x0D34]   1B
INR H                         ; [0x0D35]   24
DCR L                         ; [0x0D36]   2D
MVI M, #01h                   ; [0x0D37]   36 01
NOP                           ; [0x0D39]   00
NOP                           ; [0x0D3A]   10
RIM                           ; [0x0D3B]   20
SIM                           ; [0x0D3C]   30
MOV B, B                      ; [0x0D3D]   40
MOV D, B                      ; [0x0D3E]   50
MOV H, B                      ; [0x0D3F]   60
MOV M, B                      ; [0x0D40]   70
ADD B                         ; [0x0D41]   80
SUB B                         ; [0x0D42]   90
NOP                           ; [0x0D43]   00
NOP                           ; [0x0D44]   10
ADC E                         ; [0x0D45]   8B
POP D                         ; [0x0D46]   D1
CMP A                         ; [0x0D47]   BF
SBB L                         ; [0x0D48]   9D
POP D                         ; [0x0D49]   D1
POP D                         ; [0x0D4A]   D1
NOP                           ; [0x0D4B]   18
NOP                           ; [0x0D4C]   10
MOV H, C                      ; [0x0D4D]   61
POP D                         ; [0x0D4E]   D1
STA #1490h                    ; [0x0D4F]   32 90 14
NOP                           ; [0x0D52]   10
NOP                           ; [0x0D53]   10
SIM                           ; [0x0D54]   30
SIM                           ; [0x0D55]   30
NOP                           ; [0x0D56]   10
NOP                           ; [0x0D57]   10
NOP                           ; [0x0D58]   10
NOP                           ; [0x0D59]   00
NOP                           ; [0x0D5A]   00
NOP                           ; [0x0D5B]   08
NOP                           ; [0x0D5C]   00
NOP                           ; [0x0D5D]   00
NOP                           ; [0x0D5E]   00
NOP                           ; [0x0D5F]   00
DCR B                         ; [0x0D60]   05
INX B                         ; [0x0D61]   03
RAL                           ; [0x0D62]   17
DCX H                         ; [0x0D63]   2B
INX H                         ; [0x0D64]   23
MOV M, L                      ; [0x0D65]   75
ORA H                         ; [0x0D66]   B4
ANA B                         ; [0x0D67]   A0
RST 7                         ; [0x0D68]   FF
NOP                           ; [0x0D69]   38
RZ                            ; [0x0D6A]   C8
PCHL                          ; [0x0D6B]   E9
RRC                           ; [0x0D6C]   0F
ORA B                         ; [0x0D6D]   B0
EI                            ; [0x0D6E]   FB
MOV C, C                      ; [0x0D6F]   49
RST 7                         ; [0x0D70]   FF
PCHL                          ; [0x0D71]   E9
MVI B, #0Ah                   ; [0x0D72]   06 0A
LDAX B                        ; [0x0D74]   0A
LDAX B                        ; [0x0D75]   0A
LDAX B                        ; [0x0D76]   0A
SUB H                         ; [0x0D77]   94
ADD E                         ; [0x0D78]   83
DCR D                         ; [0x0D79]   15
ADD E                         ; [0x0D7A]   83
SUB L                         ; [0x0D7B]   95
ADD E                         ; [0x0D7C]   83
MOV H, B                      ; [0x0D7D]   60
ADD L                         ; [0x0D7E]   85
STAX B                        ; [0x0D7F]   02
JPE #95C8h                    ; [0x0D80]   EA C8 95
RIM                           ; [0x0D83]   20
JPE #1088h                    ; [0x0D84]   EA 88 10
NOP                           ; [0x0D87]   FD
SUB L                         ; [0x0D88]   95
NOP                           ; [0x0D89]   10
MOV H, B                      ; [0x0D8A]   60
RNZ                           ; [0x0D8B]   C0
DAD B                         ; [0x0D8C]   09
ORA B                         ; [0x0D8D]   B0
SHLD #EE86h                   ; [0x0D8E]   22 86 EE
RPE                           ; [0x0D91]   E8
RIM                           ; [0x0D92]   20
EI                            ; [0x0D93]   FB
NOP                           ; [0x0D94]   FD
DAD H                         ; [0x0D95]   29
RIM                           ; [0x0D96]   20
RNC                           ; [0x0D97]   D0
STAX B                        ; [0x0D98]   02
JZ #E0CAh                     ; [0x0D99]   CA CA E0
NOP                           ; [0x0D9C]   08
ORA B                         ; [0x0D9D]   B0
DAD B                         ; [0x0D9E]   09
ANA L                         ; [0x0D9F]   A5
JPE #C0C9h                    ; [0x0DA0]   EA C9 C0
SUB B                         ; [0x0DA3]   90
INX B                         ; [0x0DA4]   03
RIM                           ; [0x0DA5]   20
XRA D                         ; [0x0DA6]   AA
NOP                           ; [0x0DA7]   FD
ANA M                         ; [0x0DA8]   A6
XRI #B1h                      ; [0x0DA9]   EE B1
RP                            ; [0x0DAB]   F0
DCR A                         ; [0x0DAC]   3D
MOV C, H                      ; [0x0DAD]   4C
RST 7                         ; [0x0DAE]   FF
SUB C                         ; [0x0DAF]   91
RP                            ; [0x0DB0]   F0
MOV H, B                      ; [0x0DB1]   60
ADI #89h                      ; [0x0DB2]   C6 89
ANA L                         ; [0x0DB4]   A5
ADC C                         ; [0x0DB5]   89
SIM                           ; [0x0DB6]   30
RRC                           ; [0x0DB7]   0F
RET                           ; [0x0DB8]   C9
INR B                         ; [0x0DB9]   04
XRA C                         ; [0x0DBA]   A9
STAX B                        ; [0x0DBB]   02
SUB B                         ; [0x0DBC]   90
LXI B, #854Ah                 ; [0x0DBD]   01 4A 85
RAR                           ; [0x0DC0]   1F
ADD L                         ; [0x0DC1]   85
STAX B                        ; [0x0DC2]   02
ADD L                         ; [0x0DC3]   85
DCX H                         ; [0x0DC4]   2B
NOP                           ; [0x0DC5]   10
DCR E                         ; [0x0DC6]   1D
NOP                           ; [0x0DC7]   18
MOV H, L                      ; [0x0DC8]   65
ADC D                         ; [0x0DC9]   8A
ADD L                         ; [0x0DCA]   85
ADC C                         ; [0x0DCB]   89
XRA C                         ; [0x0DCC]   A9
NOP                           ; [0x0DCD]   00
ADD L                         ; [0x0DCE]   85
STAX B                        ; [0x0DCF]   02
ADD L                         ; [0x0DD0]   85
DCX H                         ; [0x0DD1]   2B
ADD L                         ; [0x0DD2]   85
RAR                           ; [0x0DD3]   1F
ANA L                         ; [0x0DD4]   A5
ADC B                         ; [0x0DD5]   88
ADD L                         ; [0x0DD6]   85
INR H                         ; [0x0DD7]   24
DAD H                         ; [0x0DD8]   29
RRC                           ; [0x0DD9]   0F
XRA B                         ; [0x0DDA]   A8
ADC B                         ; [0x0DDB]   88
NOP                           ; [0x0DDC]   10
NOP                           ; [0x0DDD]   FD
ADD L                         ; [0x0DDE]   85
INR D                         ; [0x0DDF]   14
XRA C                         ; [0x0DE0]   A9
MOV A, H                      ; [0x0DE1]   7C
ADD L                         ; [0x0DE2]   85
ADC D                         ; [0x0DE3]   8A
ADD L                         ; [0x0DE4]   85
STAX B                        ; [0x0DE5]   02
ADD L                         ; [0x0DE6]   85
LHLD #C660h                   ; [0x0DE7]   2A 60 C6
ADC C                         ; [0x0DEA]   89
ANA L                         ; [0x0DEB]   A5
ADC C                         ; [0x0DEC]   89
RET                           ; [0x0DED]   C9
INR B                         ; [0x0DEE]   04
SUB B                         ; [0x0DEF]   90
INR B                         ; [0x0DF0]   04
XRA C                         ; [0x0DF1]   A9
NOP                           ; [0x0DF2]   00
ORA B                         ; [0x0DF3]   B0
INX B                         ; [0x0DF4]   03
JPE #02A9h                    ; [0x0DF5]   EA A9 02
ADD L                         ; [0x0DF8]   85
RAR                           ; [0x0DF9]   1F
MOV H, B                      ; [0x0DFA]   60
ANA L                         ; [0x0DFB]   A5
JPE #0A0Ah                    ; [0x0DFC]   EA 0A 0A
NOP                           ; [0x0DFF]   18
MOV H, L                      ; [0x0E00]   65
JPE #6918h                    ; [0x0E01]   EA 18 69
MOV E, C                      ; [0x0E04]   59
ADD L                         ; [0x0E05]   85
JPE #A560h                    ; [0x0E06]   EA 60 A5
RST 0                         ; [0x0E09]   C7
RNC                           ; [0x0E0A]   D0
MOV E, H                      ; [0x0E0B]   5C
ORI #CDh                      ; [0x0E0C]   F6 CD
ORA H                         ; [0x0E0E]   B4
NOP                           ; [0x0E0F]   CB
RP                            ; [0x0E10]   F0
MOV D, M                      ; [0x0E11]   56
RNZ                           ; [0x0E12]   C0
DCR B                         ; [0x0E13]   05
RP                            ; [0x0E14]   F0
INR B                         ; [0x0E15]   04
RNZ                           ; [0x0E16]   C0
STAX B                        ; [0x0E17]   02
RNC                           ; [0x0E18]   D0
INR H                         ; [0x0E19]   24
ORA H                         ; [0x0E1A]   B4
Call #08C0h                   ; [0x0E1B]   CD C0 08
RNC                           ; [0x0E1E]   D0
NOP                           ; [0x0E1F]   08
ORA L                         ; [0x0E20]   B5
NOP                           ; [0x0E21]   CB
RET                           ; [0x0E22]   C9
DCR B                         ; [0x0E23]   05
RP                            ; [0x0E24]   F0
MOV B, M                      ; [0x0E25]   46
RNC                           ; [0x0E26]   D0
MOV B, B                      ; [0x0E27]   40
CMP C                         ; [0x0E28]   B9
JPE #95FFh                    ; [0x0E29]   EA FF 95
RAL                           ; [0x0E2C]   17
XRA C                         ; [0x0E2D]   A9
INC C                         ; [0x0E2E]   0C
SUB L                         ; [0x0E2F]   95
DCR D                         ; [0x0E30]   15
XRA C                         ; [0x0E31]   A9
NOP                           ; [0x0E32]   CB
RET                           ; [0x0E33]   C9
DCR B                         ; [0x0E34]   05
XRA C                         ; [0x0E35]   A9
INR B                         ; [0x0E36]   04
SUB B                         ; [0x0E37]   90
STAX B                        ; [0x0E38]   02
XRA C                         ; [0x0E39]   A9
NOP                           ; [0x0E3A]   08
SUB L                         ; [0x0E3B]   95
DAD D                         ; [0x0E3C]   19
MOV H, B                      ; [0x0E3D]   60
CMP C                         ; [0x0E3E]   B9
MOV B, H                      ; [0x0E3F]   44
NOP                           ; [0x0E40]   FD
ADD L                         ; [0x0E41]   85
XRI #A9h                      ; [0x0E42]   EE A9
RST 7                         ; [0x0E44]   FF
ADD L                         ; [0x0E45]   85
RST 5                         ; [0x0E46]   EF
ORA H                         ; [0x0E47]   B4
RST 1                         ; [0x0E48]   CF
ORA C                         ; [0x0E49]   B1
XRI #D5h                      ; [0x0E4A]   EE D5
Call #18D0h                   ; [0x0E4C]   CD D0 18
RZ                            ; [0x0E4F]   C8
ORA C                         ; [0x0E50]   B1
XRI #30h                      ; [0x0E51]   EE 30
INR D                         ; [0x0E53]   14
RET                           ; [0x0E54]   C9
CMC                           ; [0x0E55]   3F
RP                            ; [0x0E56]   F0
INR D                         ; [0x0E57]   14
SUB L                         ; [0x0E58]   95
RAL                           ; [0x0E59]   17
RZ                            ; [0x0E5A]   C8
ORA C                         ; [0x0E5B]   B1
XRI #95h                      ; [0x0E5C]   EE 95
DCR D                         ; [0x0E5E]   15
RZ                            ; [0x0E5F]   C8
ORA C                         ; [0x0E60]   B1
XRI #C8h                      ; [0x0E61]   EE C8
SUB H                         ; [0x0E63]   94
RST 1                         ; [0x0E64]   CF
SUB L                         ; [0x0E65]   95
DAD D                         ; [0x0E66]   19
MOV H, B                      ; [0x0E67]   60
XRA C                         ; [0x0E68]   A9
NOP                           ; [0x0E69]   00
SUB L                         ; [0x0E6A]   95
NOP                           ; [0x0E6B]   CB
XRA C                         ; [0x0E6C]   A9
NOP                           ; [0x0E6D]   00
SUB L                         ; [0x0E6E]   95
DAD D                         ; [0x0E6F]   19
SUB L                         ; [0x0E70]   95
Call #CF95h                   ; [0x0E71]   CD 95 CF
MOV H, B                      ; [0x0E74]   60
ANA L                         ; [0x0E75]   A5
JZ #0129h                     ; [0x0E76]   CA 29 01
DAD B                         ; [0x0E79]   09
ADD B                         ; [0x0E7A]   80
ADD L                         ; [0x0E7B]   85
JZ #C560h                     ; [0x0E7C]   CA 60 C5
NOP                           ; [0x0E7F]   CB
SUB B                         ; [0x0E80]   90
NOP                           ; [0x0E81]   08
ADD L                         ; [0x0E82]   85
NOP                           ; [0x0E83]   CB
XRA C                         ; [0x0E84]   A9
NOP                           ; [0x0E85]   00
ADD L                         ; [0x0E86]   85
Call #CF85h                   ; [0x0E87]   CD 85 CF
MOV H, B                      ; [0x0E8A]   60
PUSH B                        ; [0x0E8B]   C5
CZ #0890h                     ; [0x0E8C]   CC 90 08
ADD L                         ; [0x0E8F]   85
CZ #00A9h                     ; [0x0E90]   CC A9 00
ADD L                         ; [0x0E93]   85
ACI #85h                      ; [0x0E94]   CE 85
RNC                           ; [0x0E96]   D0
MOV H, B                      ; [0x0E97]   60
RC                            ; [0x0E98]   D8
MOV A, B                      ; [0x0E99]   78
ANA D                         ; [0x0E9A]   A2
NOP                           ; [0x0E9B]   00
ADC D                         ; [0x0E9C]   8A
SUB L                         ; [0x0E9D]   95
NOP                           ; [0x0E9E]   00
RPE                           ; [0x0E9F]   E8
RNC                           ; [0x0EA0]   D0
EI                            ; [0x0EA1]   FB
JZ #209Ah                     ; [0x0EA2]   CA 9A 20
ORA D                         ; [0x0EA5]   B2
CP #A9h                       ; [0x0EA6]   FE A9
PUSH B                        ; [0x0EA8]   C5
ADD L                         ; [0x0EA9]   85
RST 0                         ; [0x0EAA]   C7
XRA C                         ; [0x0EAB]   A9
ADD B                         ; [0x0EAC]   80
ADD L                         ; [0x0EAD]   85
XRA D                         ; [0x0EAE]   AA
MOV C, H                      ; [0x0EAF]   4C
CNC #A9F4h                    ; [0x0EB0]   D4 F4 A9
NOP                           ; [0x0EB3]   00
ADD L                         ; [0x0EB4]   85
ANI #85h                      ; [0x0EB5]   E6 85
RPE                           ; [0x0EB7]   E8
ADD L                         ; [0x0EB8]   85
RST 4                         ; [0x0EB9]   E7
ADD L                         ; [0x0EBA]   85
PCHL                          ; [0x0EBB]   E9
ADD L                         ; [0x0EBC]   85
RST 0                         ; [0x0EBD]   C7
XRA C                         ; [0x0EBE]   A9
LXI B, #AA85h                 ; [0x0EBF]   01 85 AA
XRA C                         ; [0x0EC2]   A9
NOP                           ; [0x0EC3]   00
ADD L                         ; [0x0EC4]   85
SUB B                         ; [0x0EC5]   90
ADD L                         ; [0x0EC6]   85
SBB C                         ; [0x0EC7]   99
ADD L                         ; [0x0EC8]   85
ADI #20h                      ; [0x0EC9]   C6 20
MOV M, L                      ; [0x0ECB]   75
CP #A9h                       ; [0x0ECC]   FE A9
INX B                         ; [0x0ECE]   03
ADD L                         ; [0x0ECF]   85
RET                           ; [0x0ED0]   C9
XRA C                         ; [0x0ED1]   A9
RST 7                         ; [0x0ED2]   FF
ADD L                         ; [0x0ED3]   85
ADC E                         ; [0x0ED4]   8B
ANA L                         ; [0x0ED5]   A5
SBB B                         ; [0x0ED6]   98
DAD H                         ; [0x0ED7]   29
MOV D, E                      ; [0x0ED8]   53
ANA H                         ; [0x0ED9]   A4
CPE #5219h                    ; [0x0EDA]   EC 19 52
NOP                           ; [0x0EDD]   FD
DAD D                         ; [0x0EDE]   19
MOV E, C                      ; [0x0EDF]   59
NOP                           ; [0x0EE0]   FD
ADD L                         ; [0x0EE1]   85
SBB B                         ; [0x0EE2]   98
ANA L                         ; [0x0EE3]   A5
PUSH H                        ; [0x0EE4]   E5
DAD H                         ; [0x0EE5]   29
MOV A, A                      ; [0x0EE6]   7F
ADD L                         ; [0x0EE7]   85
PUSH H                        ; [0x0EE8]   E5
RIM                           ; [0x0EE9]   20
JM #A2FEh                     ; [0x0EEA]   FA FE A2
LDAX B                        ; [0x0EED]   0A
ORA L                         ; [0x0EEE]   B5
SUB B                         ; [0x0EEF]   90
SUB L                         ; [0x0EF0]   95
SBB A                         ; [0x0EF1]   9F
JZ #F910h                     ; [0x0EF2]   CA 10 F9
XRA C                         ; [0x0EF5]   A9
MOV L, M                      ; [0x0EF6]   6E
ADD L                         ; [0x0EF7]   85
ANA A                         ; [0x0EF8]   A7
MOV H, B                      ; [0x0EF9]   60
ANA D                         ; [0x0EFA]   A2
DCR B                         ; [0x0EFB]   05
XRA C                         ; [0x0EFC]   A9
CMC                           ; [0x0EFD]   3F
SUB L                         ; [0x0EFE]   95
SUB D                         ; [0x0EFF]   92
JZ #FB10h                     ; [0x0F00]   CA 10 FB
ADD L                         ; [0x0F03]   85
XCHG                          ; [0x0F04]   EB
ADD L                         ; [0x0F05]   85
RST 2                         ; [0x0F06]   D7
ADD L                         ; [0x0F07]   85
RC                            ; [0x0F08]   D8
ADD L                         ; [0x0F09]   85
OUT #85h                      ; [0x0F0A]   D3 85
CNC #F6A9h                    ; [0x0F0C]   D4 A9 F6
ADD L                         ; [0x0F0F]   85
PUSH D                        ; [0x0F10]   D5
ADD L                         ; [0x0F11]   85
SUI #85h                      ; [0x0F12]   D6 85
POP D                         ; [0x0F14]   D1
ADD L                         ; [0x0F15]   85
JNC #05A2h                    ; [0x0F16]   D2 A2 05
CMP L                         ; [0x0F19]   BD
MOV H, C                      ; [0x0F1A]   61
NOP                           ; [0x0F1B]   FD
SUB L                         ; [0x0F1C]   95
SBB C                         ; [0x0F1D]   99
JZ #F8D0h                     ; [0x0F1E]   CA D0 F8
ADC D                         ; [0x0F21]   8A
ADD L                         ; [0x0F22]   85
NOP                           ; [0x0F23]   CB
ADD L                         ; [0x0F24]   85
CZ #24A9h                     ; [0x0F25]   CC A9 24
ADD L                         ; [0x0F28]   85
SUB C                         ; [0x0F29]   91
XRA C                         ; [0x0F2A]   A9
MOV B, D                      ; [0x0F2B]   42
DCR B                         ; [0x0F2C]   05
SBB B                         ; [0x0F2D]   98
ADD L                         ; [0x0F2E]   85
SBB B                         ; [0x0F2F]   98
XRA C                         ; [0x0F30]   A9
SIM                           ; [0x0F31]   30
ADD L                         ; [0x0F32]   85
RZ                            ; [0x0F33]   C8
ANA L                         ; [0x0F34]   A5
XRA D                         ; [0x0F35]   AA
DAD H                         ; [0x0F36]   29
RST 6                         ; [0x0F37]   F7
ADD L                         ; [0x0F38]   85
XRA D                         ; [0x0F39]   AA
ANA D                         ; [0x0F3A]   A2
LDAX D                        ; [0x0F3B]   1A
ANA B                         ; [0x0F3C]   A0
NOP                           ; [0x0F3D]   08
CMP C                         ; [0x0F3E]   B9
SHLD #95FDh                   ; [0x0F3F]   22 FD 95
XRA E                         ; [0x0F42]   AB
ADC B                         ; [0x0F43]   88
NOP                           ; [0x0F44]   10
STAX B                        ; [0x0F45]   02
ANA B                         ; [0x0F46]   A0
NOP                           ; [0x0F47]   08
JZ #F310h                     ; [0x0F48]   CA 10 F3
MOV H, B                      ; [0x0F4B]   60
MOV A, A                      ; [0x0F4C]   7F
CMP A                         ; [0x0F4D]   BF
RST 3                         ; [0x0F4E]   DF
RST 5                         ; [0x0F4F]   EF
RST 6                         ; [0x0F50]   F7
EI                            ; [0x0F51]   FB
NOP                           ; [0x0F52]   FD
CP #E7h                       ; [0x0F53]   FE E7
ANA L                         ; [0x0F55]   A5
ANA L                         ; [0x0F56]   A5
ANA L                         ; [0x0F57]   A5
RST 4                         ; [0x0F58]   E7
RST 4                         ; [0x0F59]   E7
MOV B, D                      ; [0x0F5A]   42
MOV B, D                      ; [0x0F5B]   42
MOV H, M                      ; [0x0F5C]   66
MOV B, D                      ; [0x0F5D]   42
RST 4                         ; [0x0F5E]   E7
INR H                         ; [0x0F5F]   24
RST 4                         ; [0x0F60]   E7
ADD C                         ; [0x0F61]   81
RST 4                         ; [0x0F62]   E7
RST 4                         ; [0x0F63]   E7
ADD C                         ; [0x0F64]   81
RST 4                         ; [0x0F65]   E7
ADD C                         ; [0x0F66]   81
RST 4                         ; [0x0F67]   E7
ADD C                         ; [0x0F68]   81
ADD C                         ; [0x0F69]   81
RST 4                         ; [0x0F6A]   E7
ANA L                         ; [0x0F6B]   A5
ANA L                         ; [0x0F6C]   A5
RST 4                         ; [0x0F6D]   E7
ADD C                         ; [0x0F6E]   81
RST 4                         ; [0x0F6F]   E7
INR H                         ; [0x0F70]   24
RST 4                         ; [0x0F71]   E7
RST 4                         ; [0x0F72]   E7
ANA L                         ; [0x0F73]   A5
RST 4                         ; [0x0F74]   E7
INR H                         ; [0x0F75]   24
INR H                         ; [0x0F76]   24
ADD C                         ; [0x0F77]   81
ADD C                         ; [0x0F78]   81
ADD C                         ; [0x0F79]   81
ADD C                         ; [0x0F7A]   81
RST 4                         ; [0x0F7B]   E7
RST 4                         ; [0x0F7C]   E7
ANA L                         ; [0x0F7D]   A5
RST 4                         ; [0x0F7E]   E7
ANA L                         ; [0x0F7F]   A5
RST 4                         ; [0x0F80]   E7
ADD C                         ; [0x0F81]   81
ADD C                         ; [0x0F82]   81
RST 4                         ; [0x0F83]   E7
ANA L                         ; [0x0F84]   A5
RST 4                         ; [0x0F85]   E7
NOP                           ; [0x0F86]   00
NOP                           ; [0x0F87]   00
NOP                           ; [0x0F88]   00
NOP                           ; [0x0F89]   00
NOP                           ; [0x0F8A]   00
LXI B, #0916h                 ; [0x0F8B]   01 16 09
LDAX B                        ; [0x0F8E]   0A
STAX B                        ; [0x0F8F]   02
DAD D                         ; [0x0F90]   19
NOP                           ; [0x0F91]   08
LDAX B                        ; [0x0F92]   0A
INX B                         ; [0x0F93]   03
RAR                           ; [0x0F94]   1F
INC C                         ; [0x0F95]   0C
NOP                           ; [0x0F96]   08
INR B                         ; [0x0F97]   04
MVI D, #0Eh                   ; [0x0F98]   16 0E
RLC                           ; [0x0F9A]   07
MVI B, #FFh                   ; [0x0F9B]   06 FF
LXI B, #0C18h                 ; [0x0F9D]   01 18 0C
INX B                         ; [0x0FA0]   03
INX B                         ; [0x0FA1]   03
MVI D, #0Ch                   ; [0x0FA2]   16 0C
INX B                         ; [0x0FA4]   03
DCR B                         ; [0x0FA5]   05
INR D                         ; [0x0FA6]   14
INC C                         ; [0x0FA7]   0C
INX B                         ; [0x0FA8]   03
RLC                           ; [0x0FA9]   07
STAX D                        ; [0x0FAA]   12
INC C                         ; [0x0FAB]   0C
INX B                         ; [0x0FAC]   03
DAD B                         ; [0x0FAD]   09
NOP                           ; [0x0FAE]   10
INC C                         ; [0x0FAF]   0C
INX B                         ; [0x0FB0]   03
DCX B                         ; [0x0FB1]   0B
MVI C, #0Ch                   ; [0x0FB2]   0E 0C
INX B                         ; [0x0FB4]   03
DCR C                         ; [0x0FB5]   0D
DCR C                         ; [0x0FB6]   0D
INC C                         ; [0x0FB7]   0C
INX B                         ; [0x0FB8]   03
RRC                           ; [0x0FB9]   0F
NOP                           ; [0x0FBA]   10
INC C                         ; [0x0FBB]   0C
INX B                         ; [0x0FBC]   03
LXI D, #013Fh                 ; [0x0FBD]   11 3F 01
NOP                           ; [0x0FC0]   18
NOP                           ; [0x0FC1]   08
RLC                           ; [0x0FC2]   07
INR B                         ; [0x0FC3]   04
DAD D                         ; [0x0FC4]   19
NOP                           ; [0x0FC5]   08
DCR B                         ; [0x0FC6]   05
NOP                           ; [0x0FC7]   10
INR E                         ; [0x0FC8]   1C
NOP                           ; [0x0FC9]   08
STAX B                        ; [0x0FCA]   02
SIM                           ; [0x0FCB]   30
MVI E, #08h                   ; [0x0FCC]   1E 08
LXI B, #FF50h                 ; [0x0FCE]   01 50 FF
LXI B, #0318h                 ; [0x0FD1]   01 18 03
INC C                         ; [0x0FD4]   0C
DAD B                         ; [0x0FD5]   09
NOP                           ; [0x0FD6]   10
LDAX B                        ; [0x0FD7]   0A
NOP                           ; [0x0FD8]   08
LXI D, #0E12h                 ; [0x0FD9]   11 12 0E
RRC                           ; [0x0FDC]   0F
DAD D                         ; [0x0FDD]   19
MVI D, #0Eh                   ; [0x0FDE]   16 0E
NOP                           ; [0x0FE0]   08
DAD H                         ; [0x0FE1]   29
LDAX D                        ; [0x0FE2]   1A
MVI C, #04h                   ; [0x0FE3]   0E 04
DAD SP                        ; [0x0FE5]   39
DCR E                         ; [0x0FE6]   1D
MVI C, #02h                   ; [0x0FE7]   0E 02
MOV C, C                      ; [0x0FE9]   49
RST 7                         ; [0x0FEA]   FF
NOP                           ; [0x0FEB]   10
DCR C                         ; [0x0FEC]   0D
LDAX B                        ; [0x0FED]   0A
NOP                           ; [0x0FEE]   08
RLC                           ; [0x0FEF]   07
MVI B, #05h                   ; [0x0FF0]   06 05
MVI B, #07h                   ; [0x0FF2]   06 07
INX B                         ; [0x0FF4]   03
INR B                         ; [0x0FF5]   04
DCR B                         ; [0x0FF6]   05
MVI B, #00h                   ; [0x0FF7]   06 00
NOP                           ; [0x0FF9]   00
SBB B                         ; [0x0FFA]   98
CP #98h                       ; [0x0FFB]   FE 98
CP #98h                       ; [0x0FFD]   FE 98
CP #FDh                       ; [0x0FFF]   FE FD
