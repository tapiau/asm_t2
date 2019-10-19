	org $4000
screen_mem_1
	:2048 dta $0
screen_mem_1_1
	:2048 dta $0
screen_mem_1_2
	:2048 dta $0
screen_mem_2
	:2048 dta $0
screen_mem_2_1
	:2048 dta $0
screen_mem_2_2
	:2048 dta $0

; x - lo byte
; y - hi byte
screen_clear:
	stx screen_clear_loop_2+1
	sty screen_clear_loop_2+2
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
	
	rts	
