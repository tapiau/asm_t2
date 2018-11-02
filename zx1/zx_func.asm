zx_print_func:
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

.MACRO ZX_PRINT letter position
	mwa #image_data_zx_font src
	mwa #screen_mem_zx dst

	ADW src #:letter
	ADW src #:letter
	ADW src #:letter
	ADW src #:letter
	ADW src #:letter
	ADW src #:letter
	ADW src #:letter
	ADW src #:letter

	ADW dst #:position
	
	jsr zx_print_func
.ENDM

zx_print_inv_func:
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
	
.MACRO ZX_PRINT_INV letter position
	mwa #image_data_zx_font src
	mwa #screen_mem_zx dst

	ADW src #:letter
	ADW src #:letter
	ADW src #:letter
	ADW src #:letter
	ADW src #:letter
	ADW src #:letter
	ADW src #:letter
	ADW src #:letter

	ADW dst #:position
	
	jsr zx_print_inv_func
.ENDM
	
	
	
		