part1_x dta 0
part1_y dta 0
part1_d dta 0
TMPCLR dta 0

part1_tmpx dta 0
part1_tmpy dta 0
part1_sync: dta 0

part1:
	; set handler for display list interrupt 
	mwa #part1_dli_handler VDSLST
	jsr dl_set_mode

	; enable DL interrupt
	lda #$c0
	sta NMIEN

	jsr screen_set_write_1
	jsr screen_clear
;	jsr screen_fill
	jsr screen_set_read_1

part1_0:
	
	jmp part1_0


	REG_PULL

	rts

part1_dli_handler:

; line:
; 32 cycles - frame (2+26+4)
; 28 cycles - screen

	REG_PUSH
	lda #COLOR_BLACK
	sta DLI_PAPER ; black

	; cycle register
	inc part1_d
	ldy part1_d
	:23 sta WSYNC	;WAIT
	ldx math_sin,y
	txa 		; 2 cycles
	
	ldy #57
dli_handler_loop_1:
	sta WSYNC	;WAIT
	sta DLI_PAPER	; 4 cycles
sbc_1:	sbc #$02	; 2 cycles

	dey		; 2 cycles
	bne dli_handler_loop_1
	

; odd line
	sta WSYNC	;WAIT
	sta DLI_PAPER	; 4 cycles
sbc_2:	sbc #$02	; 2 cycles

	ldy #63
dli_handler_loop_2:
	sta WSYNC	;WAIT
	sta DLI_PAPER	; 4 cycles
sbc_3:	sbc #$02	; 2 cycles

	dey
	bne dli_handler_loop_2
	
; odd line
	sta WSYNC	;WAIT
	sta DLI_PAPER	; 4 cycles
sbc_4:	sbc #$02	; 2 cycles

	ldy #57
dli_handler_loop_3:
	sta WSYNC	;WAIT
	sta DLI_PAPER	; 4 cycles
sbc_5:	sbc #$02	; 2 cycles

	dey
	bne dli_handler_loop_3

; odd line
	sta WSYNC	;WAIT
	:14 nop
	sta DLI_PAPER	; 4 cycles
sbc_6:	sbc #$02	; 2 cycles

	ldy #18
dli_handler_loop_4:
	sta WSYNC	;WAIT
	:16 nop
	sta DLI_PAPER	; 4 cycles
sbc_7:	sbc #$02	; 2 cycles

	dey
	bne dli_handler_loop_4

	sta WSYNC	;WAIT


	lda #14
	sta DLI_PAPER
	sta DLI_FRAME

	REG_PULL
	rti
	
dli_handler_line:
	ldy #64
dli_handler_loop_0:
	sta WSYNC	;WAIT
	sta DLI_PAPER	; 4 cycles
sbc_0:	sbc #$02	; 2 cycles

	dey
	bne dli_handler_loop_0
	
	