test:

loop0	ldy #0
	ldx #0
loop	
	jsr wait_vsync
	jsr plot
	iny
	inx
	txa
	sta COLBG
	sta WSYNC	;WAIT
;	bne loop
	jmp loop
