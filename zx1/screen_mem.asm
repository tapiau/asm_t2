	org $4000

screen_mem_1 = $4000
	:2048 dta $0
screen_mem_1_1 = $4800
	:2048 dta $0
screen_mem_1_2 = $5000
	:1792 dta $0
screen_mem_zx:
	:256 dta $0
	
;	org $5800
screen_mem_2
	:2048 dta $0
screen_mem_2_1
	:2048 dta $0
screen_mem_2_2
	:2048 dta $0

image_data_unicorn = $5800
;image_data_unicorn:
	.local graphics
	ins "..\pic\unicorn2inv.gr8"
	.endl
image_data_sinclair_research
	.local graphics
	ins "..\pic\sinclair_research.gr8"
	.endl
image_data_zx_font
	.local graphics
	ins "..\pic\zx_font.fnt"
	.endl


screen_adr
	dta 0,0

screen_clear:
	REG_PUSH
	mwa screen_adr screen_clear_loop_2+1
	lda #0
	ldx #24
screen_clear_loop_1
	ldy #0	
screen_clear_loop_2	
	sta $0000,y
	iny
	bne screen_clear_loop_2
	inc screen_clear_loop_2+2
	dex
	bne screen_clear_loop_2
	REG_PULL
	rts	

screen_fill:
	REG_PUSH
	mwa screen_adr screen_fill_loop_2+1
	lda #255
	ldx #24
screen_fill_loop_1
	ldy #0	
screen_fill_loop_2	
	sta $0000,y
	iny
	bne screen_fill_loop_2
	inc screen_fill_loop_2+2
	dex
	bne screen_fill_loop_2
	REG_PULL
	rts	

	
screen_set_read_1:
	; load display list address to register
	mwa #dl_antic_1 DLIST
	rts
screen_set_write_1:
	; switch working buffer pointer
	mwa #screen_mem_1 screen_adr
	rts

screen_set_read_2:
	; load display list address to register
	mwa #dl_antic_2 DLIST
	rts
screen_set_write_2:	
	; switch working buffer pointer
	mwa #screen_mem_2 screen_adr
	rts
	
