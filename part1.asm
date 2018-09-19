part1_x dta 0
part1_y dta 0
part1_d dta 0

part1:
	; load display list address to register
	lda <part1_dli
	sta VDSLST
	lda >part1_dli
	sta VDSLST
	lda #$c0
	sta NMEN

	jsr set_mode
	
part1_0:
	jsr set_screen_2

	lda <screen_mem_1
	sta screen_adr
	lda >screen_mem_1
	sta screen_adr+1

	jsr wait_vsync

	jsr part1_dli

	lda 20         ;czekamy 1 ramke
q_1      
	cmp 20
	beq q_1

	jsr set_screen_1

	lda <screen_mem_2
	sta screen_adr
	lda >screen_mem_2
	sta screen_adr+1

	jsr part1_dli

	lda 20         ;czekamy 1 ramke
q_2      
	cmp 20
	beq q_2

	jmp part1_0
         
part1_dli:
	pha
	txa
	pha
	tya
	pha

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

	pla
	tay
	pla
	tax
	pla
	
	rts 