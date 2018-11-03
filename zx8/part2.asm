
part2_greets: 
	dta 0,0,c'GREETS',0

part2:
	ZX_PRINT_STRING part2_greets
	
part2_loop:
	jmp part2_loop	
part2_end:
	rts

	