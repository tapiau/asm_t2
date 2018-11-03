	lda #COLOR_WHITE
	sta GR8_FRAME
	jsr screen_fill
	SLEEP 50
	jsr screen_clear
	
	jmp zx_boot_skip
zx_boot_str1:
	dta 2,23,c'2018 Gomiboy Research Ltd',0
zx_boot_skip:	
	
	ZX_PRINT 96 0 23

	ZX_PRINT_STRING zx_boot_str1
	
	SLEEP 50

	jsr screen_clear
	
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
	
	
	
