part1_x dta 0
part1_y dta 0
part1_d dta 0
TMPCLR dta 0

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
; 32 cycle - frame
; 12+1+1

	REG_PUSH
	lda #COLOR_black
	sta DLI_PAPER ; black

	; cycle register
	inc part1_d
	ldy part1_d
	ldx math_sin,y
	:24 sta WSYNC	;WAIT
	
	sta DLI_PAPER ; black
	:1 sta WSYNC	;WAIT
	:29 nop
	dex
	ldy #57
dli_handler_loop_1:
	stx DLI_PAPER
	sta WSYNC	;WAIT
	dex
	:13 nop
	sta DLI_PAPER ; black
	:12 nop
	dey
	bne dli_handler_loop_1

; odd line
	sta WSYNC	;WAIT
	:16 nop
	sta DLI_PAPER ; black
	:3 nop
	stx DLI_PAPER
	:2 nop
	dex
	dex
	nop

	ldy #57
dli_handler_loop_2:
	sta WSYNC	;WAIT
	:17 nop
	sta DLI_PAPER ; black
	:2 nop
	stx DLI_PAPER
	:2 nop
	dex
	dex
	dey
	bne dli_handler_loop_2



	lda #14
	sta DLI_PAPER
	sta DLI_FRAME

	REG_PULL
	rti
	
	
	