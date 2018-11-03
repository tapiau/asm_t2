zx_print_x: dta 0,0
zx_print_y: dta 0,0
zx_print_a: dta 0,0

zx_print_func:
	stx zx_print_x 
	sty zx_print_y 
	sta zx_print_a 

	mwa #image_data_zx_font src
	mwa screen_adr dst
	
	ADW src zx_print_a
	ADW src zx_print_a
	ADW src zx_print_a
	ADW src zx_print_a
	ADW src zx_print_a
	ADW src zx_print_a
	ADW src zx_print_a
	ADW src zx_print_a
	
	lda dst+1
	adc zx_print_y
	sta dst+1

	ADW dst zx_print_x
	
	ldx #8
	ldy #0
zx_print_func_loop:
	lda (src),y
	sta (dst),y
	INW src
	ADW dst #32
	dex
	bne zx_print_func_loop

	rts

.MACRO ZX_PRINT letter position_x position_y
	lda #:letter
	ldx #:position_x
	ldy #:position_y
	jsr zx_print_func
.ENDM

zx_print_inv_func:
	sta zx_print_a 
	stx zx_print_x 
	sty zx_print_y 

	mwa #image_data_zx_font src
	mwa screen_adr dst
	
	ADW src zx_print_a
	ADW src zx_print_a
	ADW src zx_print_a
	ADW src zx_print_a
	ADW src zx_print_a
	ADW src zx_print_a
	ADW src zx_print_a
	ADW src zx_print_a
	
	lda dst+1
	adc zx_print_y
	sta dst+1 

	ADW dst zx_print_x
	
	ldx #8
	ldy #0
zx_print_inv_func_loop:
	lda (src),y
	eor #$ff
	sta (dst),y
	INW src
	ADW dst #32
	dex
	bne zx_print_inv_func_loop

	rts

.MACRO ZX_PRINT_INV letter position_x position_y
	lda #:letter
	ldx #:position_x
	ldy #:position_y
	jsr zx_print_inv_func
.ENDM

; src
; dst
; tmp_word (0,1)
zx_copy_line:
	REG_PUSH
	ldx #8
zx_load_screen_8_lines_loop:
	ldy #0
zx_load_screen_line_loop:
	lda (src),y
	sta (dst),y
	iny
	tya
	cmp #32
	bne zx_load_screen_line_loop
	lda src+1
	clc
	adc #1
	sta src+1
	lda dst+1
	clc
	adc #1
	sta dst+1
	dex
	bne zx_load_screen_8_lines_loop
	REG_PULL
	rts
	
zx_copy_screen_block:
	REG_PUSH
	ldy #3
zx_copy_screen_block_loop0:	
	ldx #8
zx_copy_screen_block_loop1:
	jsr zx_copy_line
	lda src
	clc
	adc #32
	sta src
	lda src+1
	adc #0
	sta src+1

	lda dst
	clc
	adc #32
	sta dst
	lda dst+1
	adc #0
	sta dst+1

	lda src+1
	sec
	sbc #$08
	sta src+1
	lda dst+1
	sec
	sbc #$08
	sta dst+1
	dex
	bne zx_copy_screen_block_loop1
	
	lda src+1
	clc
	adc #$07
	sta src+1
	lda dst+1
	clc
	adc #$07
	sta dst+1
	
	dey
	bne zx_copy_screen_block_loop0
	
	REG_PULL
	rts

.MACRO ZX_PRINT_STRING string_addr
	mwa #:string_addr src
	jsr zx_print_string_func
.ENDM	


zx_print_string_func:
	ldy #0
	sty zx_print_string_func_counter
	lda (src),y
	sta zero_x
	iny
	lda (src),y
	sta zero_y
	sty zx_print_string_func_counter
zx_print_string_func_loop:	
	ldy zx_print_string_func_counter
	iny
	sty zx_print_string_func_counter
	lda (src),y
	beq zx_print_string_func_end
	sec
	sbc #32
	sta zero_a
	
	mwa src zx_print_string_func_src
	
	lda zero_a
	ldx zero_x
	ldy zero_y
	jsr zx_print_func
	; increment x coord
	ldx zero_x
	inx
	stx zero_x
	
	mwa zx_print_string_func_src src
	
	jmp zx_print_string_func_loop	

zx_print_string_func_end:	
	rts
	
zx_print_string_func_counter:
	dta 0
zx_print_string_func_src:
	dta 0
	