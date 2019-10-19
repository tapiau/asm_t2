	lda #COLOR_WHITE
	sta GR8_FRAME
	jsr screen_fill
	SLEEP 50
	jsr screen_clear
	
	MEMCOPY_BLOCK image_data_sinclair_research screen_mem_zx
	SLEEP 50

	jsr screen_clear
;	MEMCOPY_BLOCK image_data_load_pp_L screen_mem_zx
;	SLEEP 50
	
	ZX_PRINT 'L'-32 0 23
	ZX_PRINT 'O'-32 1 23
	ZX_PRINT 'A'-32 2 23
	ZX_PRINT 'D'-32 3 23
	ZX_PRINT ' '-32 4 23
	ZX_PRINT_INV 'L'-32 5 23
	SLEEP 25
	ZX_PRINT 'L'-32 5 23
	SLEEP 25
	ZX_PRINT_INV 'L'-32 5 23
	SLEEP 25
	ZX_PRINT 'L'-32 5 23
	SLEEP 25
	ZX_PRINT '"'-32 5 23
	ZX_PRINT_INV 'L'-32 6 23
	SLEEP 25
	ZX_PRINT '"'-32 6 23
	ZX_PRINT_INV 'L'-32 7 23
	SLEEP 25
	ZX_PRINT 'L'-32 7 23
	SLEEP 25
	ZX_PRINT_INV 'L'-32 7 23
	SLEEP 25
	ZX_PRINT 'L'-32 7 23
	SLEEP 25
	
	
	
