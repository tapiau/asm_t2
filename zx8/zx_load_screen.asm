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
	SLEEP 175
	DLI_DISABLE
	
	ZX_PRINT 'B'-32 0 0
	ZX_PRINT 'y'-32 1 0
	ZX_PRINT 't'-32 2 0
	ZX_PRINT 'e'-32 3 0
	ZX_PRINT 's'-32 4 0
	ZX_PRINT ':'-32 5 0
	
	ZX_PRINT 'U'-32 7 0
	ZX_PRINT 'N'-32 8 0
	ZX_PRINT 'I'-32 9 0
	ZX_PRINT 'C'-32 10 0
	ZX_PRINT 'O'-32 11 0
	ZX_PRINT 'R'-32 12 0
	ZX_PRINT 'N'-32 13 0
	SLEEP 100

	mwa #image_data_unicorn src
	mwa #screen_mem_1 dst
	
	DLI_ENABLE zx_dli_data_block

	
	jsr zx_copy_screen_block
	SLEEP 50

	DLI_DISABLE
	