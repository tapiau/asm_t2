	ICL 'macro.asm'

	org $2000

	.proc main
	
	jsr dl_set_mode	
	jsr zx

	jsr dl_set_mode
	jsr part1
;	jsr part2
	
	rts

	.endp
	
	ICL 'zx.asm'
	ICL 'zx_func.asm'
	ICL 'func.asm'
	ICL 'screen_mem.asm'
	ICL 'display_list_const.asm'
	ICL 'display_list.asm'
	ICL 'wait_vsync.asm'
	ICL 'math.asm'
	ICL 'zero.asm'
	ICL 'ghosts.asm'
	ICL 'part1.asm'
;	ICL 'part2.asm'
	ICL 'zx_dli.asm'

