
	org $80
	
and_mask 
	dta %01111111,%10111111,%11011111,%11101111
	dta %11110111,%11111011,%11111101,%11111110
ora_mask 
	dta %10000000,%01000000,%00100000,%00010000
	dta %00001000,%00000100,%00000010,%00000001
plot_adr  
	dta 0,0
screen_adr
	dta 0,0

;Y = y, X = x
plot:
	// push registers to stack
	pha
	txa
	pha
	tya
	pha
	
	; check if Y is less than 192
	tya
	cmp #192
	bcs plot_ret
	
	; prepare tmp addr
	lda screen_adr
	sta plot_adr
	lda screen_adr+1
	sta plot_adr+1

	; move pointer by X
	txa
	and #%11111000
	:3 lsr ; Logical Shoft Right - div by 8 
	adc plot_adr
	sta plot_adr
	and #0
	adc plot_adr+1
	sta plot_adr+1
	
	; move pointer by Y
	tya
	and #%00000111
	:5 asl
	clc
	adc plot_adr
	sta plot_adr
	and #0
	adc plot_adr+1
	sta plot_adr+1
	
	tya
	and #%11111000
	:3 lsr
	clc
	adc plot_adr+1
	sta plot_adr+1
	
	; get byte by pointer
	txa
	and #%00000111
	tax
	ldy #0
	lda (plot_adr),y ; modify byte using bit map
	ora ora_mask,x
	sta (plot_adr),y
	
plot_ret:
	; pull from stack to registers
	pla
	tay
	pla
	tax
	pla
		
 	rts
