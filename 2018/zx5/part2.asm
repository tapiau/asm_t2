
part2_greets: 
	dta 0,0,c'greeets',0

part2:
	ZX_PRINT_STRING part2_greets
	
	
part2_end:
	rts


.MACRO ZX_PRINT_STRING :src
	mwa #:part2_greets src

	ldy #0
	lda (src),y
	sta zero_x
	iny
	lda (src),y
	sta zero_y
	
	iny
	beq part2_end
	
	sbc #32
	ldx #:position_x
	ldy #:position_y
	jsr zx_print_func	
.ENDM	