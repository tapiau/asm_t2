	jsr screen_clear
	
	SLEEP 25
	lda #COLOR_CYAN
	sta GR8_FRAME
	SLEEP 25
	lda #COLOR_WHITE
	sta GR8_FRAME
	
	SLEEP 25
	lda #COLOR_CYAN
	sta GR8_FRAME
	SLEEP 25
	lda #COLOR_WHITE
	sta GR8_FRAME

	SLEEP 25
	lda #COLOR_CYAN
	sta GR8_FRAME

	DLI_ENABLE zx_dli_header_block
	SLEEP 100
	DLI_DISABLE
	SLEEP 100
	
	
	
	
	
	