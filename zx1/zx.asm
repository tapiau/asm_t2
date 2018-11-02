zx:
	; set handler for display list interrupt 
;	mwa #part1_dli_handler VDSLST
	jsr dl_set_mode

	; enable DL interrupt
;	lda #$c0
;	sta NMIEN

	lda #COLOR_BLACK     
	sta GR8_PEN
	lda #COLOR_WHITE     
	sta GR8_PAPER
	lda #COLOR_WHITE     
	sta GR8_FRAME

	jsr screen_set_write_1
	jsr screen_set_read_1
	
zx_loop:	
	jsr screen_fill
	SLEEP 50
	jsr screen_clear
	
	MEMCOPY_BLOCK image_data_sinclair_research screen_mem_zx
	SLEEP 50

	jsr screen_clear
;	MEMCOPY_BLOCK image_data_load_pp_L screen_mem_zx
;	SLEEP 50
	
	ZX_PRINT 'L'-32 0
	ZX_PRINT 'O'-32 1
	ZX_PRINT 'A'-32 2
	ZX_PRINT 'D'-32 3
	ZX_PRINT ' '-32 4
	ZX_PRINT_INV 'L'-32 5
	SLEEP 25
	ZX_PRINT 'L'-32 5
	SLEEP 25
	ZX_PRINT_INV 'L'-32 5
	SLEEP 25
	ZX_PRINT 'L'-32 5
	SLEEP 25
	ZX_PRINT '"'-32 5
	ZX_PRINT_INV 'L'-32 6
	SLEEP 25
	ZX_PRINT '"'-32 6
	ZX_PRINT_INV 'L'-32 7
	SLEEP 25
	ZX_PRINT 'L'-32 7
	SLEEP 25
	ZX_PRINT_INV 'L'-32 7
	SLEEP 25
	ZX_PRINT 'L'-32 7
	SLEEP 25
	ZX_PRINT_INV 'L'-32 7
	SLEEP 25
	ZX_PRINT 'L'-32 7
	SLEEP 25
	
	jmp zx_loop
	
;	PM_SHOW

	