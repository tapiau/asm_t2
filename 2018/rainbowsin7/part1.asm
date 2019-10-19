part1_x dta 0
part1_y dta 0
part1_d dta 0
TMPCLR dta 0

part1_tmpx dta 0
part1_tmpy dta 0
part1_sync: dta 0


part1:
	jsr dl_set_mode

	DLI_ENABLE part1_dli_handler

	jsr screen_set_write_1
	jsr screen_set_read_1
	
	PM_SHOW

	SLEEP 250
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

	; bar size
	lda #2
	sta bar_size

	:1 sta WSYNC	;WAIT
	
	; cycle begin
	ldx #1
	:1 sta WSYNC	;WAIT

	; set sprite positions
	lda #68
	sta HPOSP0 

	lda #88
	sta HPOSP1 

	lda #150
	sta HPOSP2 

	lda #180
	sta HPOSP3 

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

	; hide sprites
	lda #0
	sta HPOSP0 
	sta HPOSP1 
	sta HPOSP2 
	sta HPOSP3 

	lda #1
	sta COLPM0
	sta COLPM1
	sta COLPM2
	sta COLPM3

	LINE_WAIT
	

	REG_PULL
	rti
	
	
	