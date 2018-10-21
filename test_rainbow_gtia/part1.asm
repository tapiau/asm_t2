part1_x dta 0
part1_y dta 0
part1_d dta 0
TMPCLR dta 0

part1_sync: dta 0
rainbow:
	dta $B4 ; red
	dta $B4 ; red
	dta $B6 ; red
	dta $B6 ; red
	dta $BA ; red
	dta $BA ; red
	dta $EE ; red
	dta $EE ; red
	dta $EC ; red
	dta $EC ; red
	dta $1C ; red
	dta $1C ; red
	dta $1A ; red
	dta $1A ; red
	dta $24 ; red
	dta $24 ; red

part1:
	; set handler for display list interrupt 
	mwa #part1_dli_handler VDSLST
	jsr dl_set_mode

	; enable DL interrupt
	lda #$c0
	sta NMIEN

	jsr screen_set_write_1
	jsr screen_clear
	jsr screen_fill_raster
	jsr screen_fill
	jsr screen_set_read_1

part1_0:
	
	jmp part1_0


	REG_PULL

	rts
	
part1_gtia_prior: 
	dta 0
	
part1_dli_handler:
	REG_PUSH

	lda GPRIOR
	sta part1_gtia_prior

; zmiana koloru ramki
	ldy #$0F;
dli_handler_loop:
	ldx rainbow,y
	stx WSYNC	;WAIT
	stx DLI_PAPER
	stx DLI_FRAME
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	lda #192
	sta PRIOR
	lda part1_gtia_prior
	nop
	nop
	nop
	sta PRIOR
	stx WSYNC	;WAIT
	stx WSYNC	;WAIT
	dey
	bne dli_handler_loop

	stx WSYNC	;WAIT
	stx DLI_PAPER
	stx DLI_FRAME
	stx WSYNC	;WAIT
	stx WSYNC	;WAIT

	sta WSYNC	;WAIT
	lda #14
	sta DLI_PAPER
	sta DLI_FRAME

	REG_PULL
	rti
	
	
	