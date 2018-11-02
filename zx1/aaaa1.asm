	ICL 'macro.asm'

	org $2000

	.proc main
	
	jmp zx

	.endp
	
	ICL 'zx.asm'
	ICL 'zx_func.asm'
	ICL 'func.asm'
	ICL 'screen_mem.asm'
	ICL 'display_list.asm'
	ICL 'wait_vsync.asm'
	ICL 'math.asm'
	ICL 'zero.asm'
	ICL 'ghosts.asm'
	ICL 'zx_dli.asm'

;	org $8000
;image_data:	
;	.local graphics
;	ins "..\pic\unicorn2.gr8"
;	.endl
	