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


	; bar size
	lda #2
	sta bar_size

	:1 sta WSYNC	;WAIT
	
	; cycle begin
	ldx #1
	:1 sta WSYNC	;WAIT

;	lda math_sin_16,x
;	:4 lsr
;	adc #1
;	tax

	:20 sta WSYNC	;WAIT

	; init color value
	ldy RTCLOCK_0
	lda math_sin,y
	sta bar_color1
	tya
	eor #$ff
	tay
	lda math_sin,y
	sta bar_color2

	:1 sta WSYNC	;WAIT

	; 192 screen lines


	ldx bar_color1
	ldy bar_color2

	LINE_NOP_HALF
	LINE_NOP_NORMAL

	lda #55
dli_handler_loop_0:
	LINE_NOP_NORMAL
	sbc #1
	bne dli_handler_loop_0
	LINE_NOP_SHORT
	

	LINE_WAIT

	REG_PULL
	rti
	
	
	