
part2_greets: 
	dta c'greeets',0

part2:
	mva #part2_greets src

	ldy #0
	lda (src),y
	beq part2_end
	
	sbc #32
	ldx #:position_x
	ldy #:position_y
	jsr zx_print_func
	
	
	
	
	
part2_end:
	rts
	