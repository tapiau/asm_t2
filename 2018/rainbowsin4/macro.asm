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

.MACRO LINE_NOP_SPACE_1
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop

	nop
	nop
.ENDM

.MACRO LINE_NOP_SPACE_2
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

	;; 4 nops
	LINE_COLOR_CALC
	LINE_NOP_SPACE_1
	
	stx DLI_PAPER	; 4 cycles
;	stx DLI_PEN	; 4 cycles
	LINE_NOP_SPACE_2
	nop
	sty DLI_PAPER	; 4 cycles
;	sty DLI_PEN	; 4 cycles
.ENDM

.MACRO LINE_NOP_SHORT
	LINE_WAIT

	;; 4 nops
	LINE_COLOR_CALC
	LINE_NOP_SPACE_1
	
	stx DLI_PAPER	; 4 cycles
;	stx DLI_PEN	; 4 cycles
	LINE_NOP_SPACE_2
	sty DLI_PAPER	; 4 cycles
;	sty DLI_PEN	; 4 cycles
.ENDM
