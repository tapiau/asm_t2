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

	ICL "zx_boot.asm"
	ICL "zx_load.asm"	
	
	jmp zx_loop
	
;	PM_SHOW

	