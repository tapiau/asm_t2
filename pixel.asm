
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
	pha
	txa
	pha
	tya
	pha
	
	tya
	cmp #192
	bcs plot_ret
	
	lda screen_adr
	sta plot_adr
	lda screen_adr+1
	sta plot_adr+1

	txa
	and #%11111000
	lsr
	lsr
	lsr
	adc plot_adr
	sta plot_adr
	and #0
	adc plot_adr+1
	sta plot_adr+1
	
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
	
	txa
	and #%00000111
	tax
	ldy #0
	lda (plot_adr),y
	ora ora_mask,x
	sta (plot_adr),y
	
plot_ret:
	pla
	tay
	pla
	tax
	pla
		
 	rts
