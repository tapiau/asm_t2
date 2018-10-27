WSYNC = $D40A
VCOUNT = $D40B

wait_hsync:

	pha

	lda #$52
	sta WSYNC	;WAIT
	pla

	rts


wait_vsync:
	pha
wait_vsync_loop:
	lda VCOUNT
	cmp #100
	bne wait_vsync_loop 
	
	pla
	rts
	