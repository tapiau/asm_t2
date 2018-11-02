
zx_dli_header_block:

	REG_PUSH

	; 192 screen lines
	ldy #240
zx_dli_header_block_loop1:	
	lda (RTCLOCK_0),y
	adc #5
	and #$0f
	ldx #COLOR_RED
	stx DLI_FRAME
zx_dli_header_block_loop2:	
	LINE_WAIT
	dey
	beq zx_dli_header_block_end
	sbc #1
	bne zx_dli_header_block_loop2

zx_dli_header_block_loop3:	
	lda (RTCLOCK_0),y
	adc #5
	and #$0f
	ldx #COLOR_CYAN
	stx DLI_FRAME
zx_dli_header_block_loop4:	
	LINE_WAIT
	dey
	beq zx_dli_header_block_end
	sbc #1
	bne zx_dli_header_block_loop4
	
	jmp zx_dli_header_block_loop1

zx_dli_header_block_end:
	REG_PULL
	rti
	
	
	