RTCLOCK_2 = $12
RTCLOCK_1 = $13
RTCLOCK_0 = $14

DLIST   = $230
DLISTL  = $230 ; display list pointer low byte
DLISTH  = $231 ;                      high byte
COLRBK  = $2C8

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

SDMCTL  = $022F
DMACTL  = $D400
VDSLST  = $0200 ; display list interrupt vector
NMEN	= $D40E
NMIEN	= $D40E ; bit 7
WSYNC   = $D40A
VCOUNT  = $D40B

GR8_PEN   = COLOR1
GR8_PAPER = COLOR2
GR8_FRAME = COLOR4 

DLI_PEN   = COLPF1
DLI_PAPER = COLPF2
DLI_FRAME = COLBG 

COLOR_BLACK = $00
COLOR_WHITE = $0E



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