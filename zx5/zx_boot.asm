	lda #COLOR_WHITE
	sta GR8_FRAME
	jsr screen_fill
	SLEEP 50
	jsr screen_clear
	
	ZX_PRINT 96 0 23
	ZX_PRINT '2'-32 2 23
	ZX_PRINT '0'-32 3 23
	ZX_PRINT '1'-32 4 23
	ZX_PRINT '8'-32 5 23

	ZX_PRINT 'G'-32 7 23
	ZX_PRINT 'o'-32 8 23
	ZX_PRINT 'm'-32 9 23
	ZX_PRINT 'i'-32 10 23
	ZX_PRINT 'b'-32 11 23
	ZX_PRINT 'o'-32 12 23
	ZX_PRINT 'y'-32 13 23

	ZX_PRINT 'R'-32 15 23
	ZX_PRINT 'e'-32 16 23
	ZX_PRINT 's'-32 17 23
	ZX_PRINT 'e'-32 18 23
	ZX_PRINT 'a'-32 19 23
	ZX_PRINT 'r'-32 20 23
	ZX_PRINT 'c'-32 21 23
	ZX_PRINT 'h'-32 22 23

	ZX_PRINT 'L'-32 24 23
	ZX_PRINT 't'-32 25 23
	ZX_PRINT 'd'-32 26 23
	
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
	
	
	