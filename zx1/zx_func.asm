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

		