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
	jsr screen_fill
	jsr screen_set_read_1

part1_0:
	
	jmp part1_0


	REG_PULL

	rts
	
part1_dli_handler:
	REG_PUSH

; zmiana koloru ramki
	ldy #$FE;
dli_handler_loop:
	sty WSYNC	;WAIT
	sty DLI_PAPER
	sty DLI_FRAME
	dey
	dey
	bne dli_handler_loop

	sta WSYNC	;WAIT
	lda #14
	sta DLI_PAPER
	sta DLI_FRAME

	REG_PULL
	rti
	
	
	