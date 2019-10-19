

part2_greets_0:
	dta 0,8,c'music',0
part2_greets_1:
	dta 0,9,c'wieczor',0
part2_greets_2:
	dta 29,20,c'GFX',0
part2_greets_3:
	dta 24,21,c'werynajs',0
part2_greets_4:
	dta 28,3,c'code',0
part2_greets_5:
	dta 28,4,c'zibi',0

part2_greets_6:
	dta 12,0,c'GREETING',0
part2_greets_7:
	dta 7,23,c'SILLY VENTURE 2018',0

part2_greets_8:
	dta 11,12,c' THE  END ',0

part2:
	lda #COLOR_BLACK     
	sta DLI_PEN
	lda #COLOR_WHITE     
	sta DLI_PAPER
	lda #COLOR_WHITE     
	sta DLI_FRAME


	ZX_PRINT_STRING part2_greets_0
	SLEEP 50
	ZX_PRINT_STRING part2_greets_1
	SLEEP 50
	ZX_PRINT_STRING part2_greets_2
	SLEEP 50
	ZX_PRINT_STRING part2_greets_3
	SLEEP 50
	ZX_PRINT_STRING part2_greets_4
	SLEEP 50
	ZX_PRINT_STRING part2_greets_5
	SLEEP 50

	ZX_PRINT_STRING part2_greets_6
	SLEEP 50
	ZX_PRINT_STRING part2_greets_7
	SLEEP 50
	SLEEP 50


	ZX_PRINT_STRING part2_greets_8
	SLEEP 250
	
part2_loop:
	jmp part2_loop	
part2_end:
	rts

	