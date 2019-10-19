zx:
	lda #COLOR_BLACK     
	sta DLI_PEN
	lda #COLOR_WHITE     
	sta DLI_PAPER
	lda #COLOR_WHITE     
	sta DLI_FRAME

	jsr screen_set_write_1
	jsr screen_set_read_1
	
zx_loop:

	ICL "zx_boot.asm"
	ICL "zx_load.asm"	
	ICL "zx_load_screen.asm"	
	
	rts
;	jmp zx_loop
	
;	PM_SHOW

	