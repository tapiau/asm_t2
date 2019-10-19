	ICL 'macro.asm'
	ICL '../lib/memory_map.asm'

	org $2000

	.proc main
	
	jsr nmi_set

	jsr dl_set_mode
	jsr part_test1
	
	rts

	.endp
	
	ICL 'wait_vsync.asm'
	ICL 'func.asm'
	ICL 'part_test1.asm'
	ICL 'vblank.asm'
	ICL 'display_list.asm'
	ICL 'screen_mem.asm'
	ICL 'image_data.asm'
	ICL 'math.asm'
	ICL 'zero.asm'
	ICL 'ghosts.asm'

