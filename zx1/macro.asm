.MACRO REG_PUSH 
	pha
	txa
	pha
	tya
	pha
.ENDM

.MACRO REG_PULL
	pla
	tay
	pla
	tax
	pla
.ENDM

.MACRO SLEEP frames
	lda RTCLOCK_0
	add #:frames
SLEEP_LOOP:
	cmp RTCLOCK_0
	bne SLEEP_LOOP
.ENDM

.MACRO LINE_SPACE_9_CYCLES
	nop
	nop
	nop
	sta bar_color20	; 3 cycles
.ENDM

.MACRO LINE_SPACE_10_CYCLES
	nop
	nop
	nop
	nop
	nop
.ENDM

.MACRO LINE_SPACE_11_CYCLES
	nop
	nop
	nop
	nop
	sta bar_color20	; 3 cycles
.ENDM

.MACRO LINE_WAIT
	sta WSYNC	;WAIT
.ENDM

.MACRO LINE_COLOR_CALC
	dex
	dey
.ENDM

.MACRO LINE_NOP_HALF
	LINE_WAIT

	;; 4 nops
	LINE_COLOR_CALC
	
	LINE_NOP_SPACE_1
	
	sta bar_color20	; 3 cycles
	stx DLI_PAPER	; 4 cycles
;	stx DLI_PEN	; 4 cycles
	LINE_NOP_SPACE_2
	sty DLI_PAPER	; 4 cycles
;	sty DLI_PEN	; 4 cycles
.ENDM

.MACRO LINE_NOP_NORMAL
	LINE_WAIT
	LINE_COLOR_CALC
	sty COLPM0
	sty COLPM1
	stx COLPM2
	stx COLPM3
	stx DLI_PAPER	; 4 cycles
	LINE_SPACE_10_CYCLES
	nop
	sty DLI_PAPER	; 4 cycles
.ENDM

.MACRO LINE_NOP_SHORT
	LINE_WAIT
	LINE_COLOR_CALC
	sty COLPM0
	sty COLPM1
	stx COLPM2
	stx COLPM3
	stx DLI_PAPER	; 4 cycles
	LINE_SPACE_10_CYCLES
	sty DLI_PAPER	; 4 cycles
.ENDM

.MACRO LINE_NOP_LAST
	LINE_WAIT
	stx DLI_PAPER	; 4 cycles
	lda #1
	sta COLPM0
	sta COLPM1
	sta COLPM2
	sta COLPM3
	LINE_SPACE_10_CYCLES
	nop
	sty DLI_PAPER	; 4 cycles
.ENDM
