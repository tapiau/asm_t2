	ICL 'macro.asm'

	org $2000

	.proc main

	jsr dl_set_mode
	
	jsr part1

	.endp
	
	ICL 'part1.asm'
	ICL 'screen_mem.asm'
	ICL 'display_list.asm'
	ICL 'wait_vsync.asm'
	ICL 'math.asm'
	ICL 'zero.asm'
	ICL 'ghosts.asm'

