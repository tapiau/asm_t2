part1_x dta 0
part1_y dta 0
part1_d dta 0
TMPCLR dta 0

part1_tmpx dta 0
part1_tmpy dta 0
part1_sync: dta 0

part1_p0x: dta 98
part1_p1x: dta 68


part1:
	; set handler for display list interrupt 
	mwa #part1_dli_handler VDSLST
	
	lda #COLOR_AMIGA_BACKGROUND
	sta COLPM0
	sta COLPM1
	sta COLPM2
	sta COLPM3
	sta COLPM0S
	sta COLPM1S
	sta COLPM2S
	sta COLPM3S
	
	; enable DL interrupt
	lda #$c0
	sta NMIEN

	jsr screen_set_write_1
	jsr screen_set_read_1
	
	PM_SHOW

part1_0:

	
part1_0_idle:
	
;	PM_MOVE
	
	jmp part1_0_idle
	
	REG_PULL

	rts

part1_dli_handler:

; line:
; 32 cycles - frame (2+26+4)
; 28 cycles - screen

	REG_PUSH
	lda #COLOR_AMIGA_BACKGROUND
	sta DLI_PAPER ; black
	lda #COLOR_WHITE
	sta DLI_FRAME

	; init player 0 
	lda #98         ; x-pos
	sta part1_p0x
	lda #COLOR_WHITE
	sta COLPM0	; KOLOR

	; init player 1 
	lda #68         ; x-pos
	sta part1_p1x
	lda #COLOR_BLACK
	sta COLPM1	; KOLOR


	:1 sta WSYNC	;WAIT
	
	; cycle begin
	:1 sta WSYNC	;WAIT

;	lda math_sin_16,x
;	:4 lsr
;	adc #1
;	tax

	:1 sta WSYNC
	
	;lda RTCLOCK_1
	;sta 704		; KOLOR

	:18 sta WSYNC	;WAIT

	; init color value
;	ldy RTCLOCK_0
;	lda math_sin,y
	lda COLOR_WHITE
	sta bar_color1

	:1 sta WSYNC	;WAIT

	; 200 screen lines

;	LINE_NOP_NORMAL
;	LINE_NOP_NORMAL

	lda #21 ; empty lines
dli_handler_loop_0:
	LINE_NOP_NORMAL
	sbc #1
	bne dli_handler_loop_0

	LINE_NOP_SHORT

; 76 back rainbow
; now draw front rainbow
	ldx part1_p0x
	lda #16 
dli_handler_loop_1:
	stx HPOSP0 
	
	LINE_NOP_NORMAL
	LINE_NOP_NORMAL
	LINE_NOP_NORMAL
	
	dex
		
	sbc #1
	bne dli_handler_loop_1


	lda #24 
dli_handler_loop_2:
	stx HPOSP0 
	
	LINE_NOP_NORMAL
	LINE_NOP_NORMAL
	LINE_NOP_NORMAL
	
	dex
		
	sbc #1
	bne dli_handler_loop_2


	LINE_NOP_SHORT

;	lda #63
;dli_handler_loop_2:
;	LINE_NOP_NORMAL
;	sbc #1
;	bne dli_handler_loop_2
;	LINE_NOP_SHORT
	
;	LINE_NOP_LAST

	lda #COLOR_AMIGA_BACKGROUND
	sta COLPM0
	sta COLPM1
	sta COLPM2
	sta COLPM3

	LINE_WAIT
	

	REG_PULL
	rti
	
	
	