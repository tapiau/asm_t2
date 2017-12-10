WSYNC = $D40A

wait_vsync:

	pha

	lda #$52
	sta WSYNC	;WAIT
	pla

	rts
