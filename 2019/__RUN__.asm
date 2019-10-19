	ICL 'macro.inc'

	org $2000

	.proc main
	
;	jmp test	
	jmp part1

	.endp
	
;	ICL 'test.asm'
	ICL 'part1.asm'
	ICL 'screen_mem.asm'
	ICL 'display_list.asm'
	ICL 'pixel.asm'
	ICL 'wait_vsync.asm'
	ICL 'math.asm'

	