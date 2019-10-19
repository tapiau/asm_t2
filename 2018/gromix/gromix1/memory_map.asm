MEM_ZERO	= $0000 ; protected!
MEM_ZERO_TOP	= $00FF ; protected!
MEM_STACK   	= $0100 ; protected!
MEM_STACK_TOP 	= $01FF ; protected!
MEM_OS_RAM	= $0200 ; 1.2KB
MEM_OS_RAM_TOP 	= $06FF
MEM_DOS		= $0700 ; 30.25KB
MEM_DOS_TOP	= $7FFF
MEM_CART_A	= $8000 ; 8KB
MEM_CART_A_TOP	= $9FFF
MEM_CART_B	= $A000 ; 8KB
MEM_CART_B_TOP	= $BFFF
MEM_FREE	= $C000 ; 4KB
MEM_FREE_TOP	= $CFFF
MEM_HW_REG	= $D000 ; protected!
MEM_HE_REG_TOP	= $D799 ; protected!
MEM_FP		= $D800 ; 2KB
MEM_FP_TOP	= $DFFF
MEM_OS		= $E000 ; 8KB
MEM_OS_TOP	= $FFFF

RTCLOCK_2 = $12
RTCLOCK_1 = $13
RTCLOCK_0 = $14

DLIST	= $D402
DLISTL	= $D402
DLISTH	= $D403

COLPF0	= $D016  
COLPF1	= $D017  
COLPF2	= $D018  
COLPF3	= $D019
COLBG	= $D01A 

COLOR0	= $02C4
COLOR1	= $02C5
COLOR2	= $02C6
COLOR3	= $02C7
COLOR4 	= $02C8

DMACTL  = $D400
VDSLST  = $0200 ; display list interrupt vector
NMEN	= $D40E
NMIEN	= $D40E ; bit 7
WSYNC   = $D40A
VCOUNT  = $D40B
NMIST 	= $D40F ; read
NMIRES  = $D40F ; write
PORTB	= $D301

GR8_PEN   = COLOR1
GR8_PAPER = COLOR2
GR8_FRAME = COLOR4 

DLI_PEN   = COLPF1
DLI_PAPER = COLPF2
DLI_FRAME = COLBG 

COLOR_BLACK = $00
COLOR_WHITE = $0E
COLOR_CYAN  = $ac
COLOR_RED   = $43

COLPM0	= $D012
COLPM1	= $D013
COLPM2	= $D014
COLPM3	= $D015

;COLPM0S	= $02C0
;COLPM1S	= $02C1
;COLPM2S	= $02C2
;COLPM3S	= $02C3


SIZEP0	= $D008
SIZEP1	= $D009
SIZEP2	= $D00A
SIZEP3	= $D00B

SIZEM	= $D00C

HPOSP0	= $D000
HPOSP1	= $D001
HPOSP2	= $D002
HPOSP3	= $D003

HPOSM0	= $D004
HPOSM1	= $D005
HPOSM2	= $D006
HPOSM3	= $D007

VDELAY	= $D01C

GTIACTL	= $D01B
GTIACTLS = $026F

PMCTL	= $D01D

PMBASE = $D407

;     SAVMSC $0058,2       (88): pointer to current screen for CIO commands
;     RAMTOP $006A        (106): start-of-ROM pointer (MSB only)
;     VDSLST $0200,2      (512): DLI vector
;     RAMSIZ $02E4        (740): permanent start-of-ROM pointer (MSB only)
;     DLISTL $D402      (54274): display list pointer low byte
;     DLISTH $D403      (54275):     "    high byte
;     HSCROL $D404      (54276): horizontal scroll register
;     VSCROL $D405      (54277): vertical scroll register
;     NMIEN  $D40E      (54286): NMI enable (DLIs)
;     
;     
;                               Shadow registers
;     
;     
;     SDLSTL $0230        (560): DLISTL
;     SDLSTH $0231        (561): DLISTH