; copy 256 byte block from src to dst

memcopy_block_func:
	REG_PUSH

	ldy #0
memcopy_block_loop:	
 	lda (memcopy_block_src),y
 	sta (memcopy_block_dst),y
 	iny
 	bne memcopy_block_loop

 	REG_PULL
 	rts

.MACRO MEMCOPY_BLOCK src dst
	mwa #:src memcopy_block_src
	mwa #:dst memcopy_block_dst
	
	jsr memcopy_block_func
.ENDM

memcopy_screen_func:
	REG_PUSH
	
	ldx #30
memcopy_screen_func_loop:
	jsr memcopy_block_func
	lda memcopy_block_src+1
	adc #1
	sta memcopy_block_src+1	
	lda memcopy_block_dst+1
	adc #1
	sta memcopy_block_dst+1	
	dex
	bne memcopy_screen_func_loop
	
	REG_PULL
	rts

.MACRO MEMCOPY_SCREEN src dst
	mwa #:src memcopy_block_src
	mwa #:dst memcopy_block_dst
	
	jsr memcopy_screen_func	
.ENDM

screen_clear:
	REG_PUSH
	mwa screen_adr screen_clear_loop_2+1
	lda #0
	ldx #30
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
	ldx #30
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
	
