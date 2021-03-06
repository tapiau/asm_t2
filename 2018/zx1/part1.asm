part1_x dta 0
part1_y dta 0
part1_d dta 0
TMPCLR dta 0

part1_tmpx dta 0
part1_tmpy dta 0
part1_sync: dta 0


part1:
	; set handler for display list interrupt 
	DLI_ENABLE part1_dli_handler

	lda #COLOR_BLACK     
	sta GR8_PEN
	lda #COLOR_WHITE     
	sta GR8_PAPER
	lda #COLOR_WHITE     
	sta GR8_FRAME

	jsr screen_set_write_2
;	jsr screen_clear
;	jsr screen_fill
	jsr screen_set_read_2
	
;	PM_SHOW


part1_0:

	
part1_0_idle:
	
	;PM_MOVE
	
	jmp part1_0_idle
	
	REG_PULL

	rts

part1_dli_handler:

; line:
; 32 cycles - frame (2+26+4)
; 28 cycles - screen

	REG_PUSH
	lda #COLOR_BLACK
	sta DLI_PAPER ; black
	lda 1
	sta COLPM0


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

	:1 sta WSYNC
	
	lda RTCLOCK_1
	sta 704		; KOLOR

	:18 sta WSYNC	;WAIT

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

	LINE_NOP_NORMAL
	LINE_NOP_NORMAL

	lda #57
dli_handler_loop_0:
	LINE_NOP_NORMAL
	sbc #1
	bne dli_handler_loop_0

	LINE_NOP_SHORT

	lda #63
dli_handler_loop_1:
	LINE_NOP_NORMAL
	sbc #1
	bne dli_handler_loop_1
	LINE_NOP_SHORT

	lda #63
dli_handler_loop_2:
	LINE_NOP_NORMAL
	sbc #1
	bne dli_handler_loop_2
;	LINE_NOP_SHORT
	
	LINE_NOP_LAST

	lda 1
	sta COLPM0
	sta COLPM1
	sta COLPM2
	sta COLPM3

	LINE_WAIT
	

	REG_PULL
	rti
	
	
	