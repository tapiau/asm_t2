WSYNC = $D40A
VCOUNT = $D40B

wait_vsync:

	pha

	lda #$52
	sta WSYNC	;WAIT
	pla

	rts


wait_frame:
	pha
wait_frame_loop:
	lda VCOUNT
	cmp #100
	bne wait_frame_loop 
	
	pla
	rts
	