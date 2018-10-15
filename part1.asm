part1_x dta 0
part1_y dta 0
part1_d dta 0

part1:
	; set handler for display list interrupt 
	mwa #part1_dli VDSLST

	; enable DL interrupt?
;	lda #$c0
;	sta NMEN

	jsr dl_set_mode
	
part1_0:
	jsr set_screen_2
	jsr part1_dli
	
	jsr set_screen_1
	jsr part1_dli

	jmp part1_0
         
part1_dli:
	REG_PUSH

	ldx screen_adr
	ldy screen_adr+1
	jsr screen_clear
	
	lda 0
	sta part1_y

part1_dli_loop

	lda part1_y
	adc part1_d
	and #%00001111
	tay
	ldx math_sin,y
	txa
	lsr
	lsr
	lsr
	tax
	ldy part1_y

	jsr plot

; zmiana koloru ramki		
;	stx COLBG
;	stx WSYNC	;WAIT

	jsr wait_vsync

	iny
	sty part1_y
	tya
	cmp #192 ; (0xc0)
	bne part1_dli_loop

	ldx part1_d
	inx
	stx part1_d

	REG_PULL
	
	rts 