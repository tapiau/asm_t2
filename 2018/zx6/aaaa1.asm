	ICL 'macro.asm'
	ICL 'display_list_const.asm'

	org $2000

	.proc main
	
;	jsr nmi_set
	jsr dl_set_mode	
	jsr zx

	jsr dl_set_mode
	jsr part1
	jsr part2
	
	rts

	.endp
	
	ICL 'zx_dli.asm'
	ICL 'zx.asm'
	ICL 'wait_vsync.asm'
	ICL 'zx_func.asm'
	ICL 'func.asm'
	ICL 'part1.asm'
	ICL 'vblank.asm'
	ICL 'display_list.asm'
	ICL 'screen_mem.asm'
	ICL 'image_data.asm'
	ICL 'math.asm'
	ICL 'zero.asm'
	ICL 'ghosts.asm'
	ICL 'part2.asm'
	ICL 'music.asm'

