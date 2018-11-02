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
