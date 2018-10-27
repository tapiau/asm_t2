part1_x dta 0
part1_y dta 0
part1_d dta 0

part1_sync: dta 0

part1:
	; set handler for display list interrupt 
	mwa #part1_dli_handler VDSLST

	jsr dl_set_mode

	; enable DL interrupt
	lda #$c0
	sta NMIEN


part1_0:
	jsr set_screen_2
	jsr part1_dli
	
;	jsr part1_wait_sync
	
	jsr set_screen_1
	jsr part1_dli

;	jsr part1_wait_sync

	jmp part1_0
         
part1_dli:
	REG_PUSH

	ldx screen_adr
	ldy screen_adr+1
	jsr screen_clear
	
	lda 0
	sta part1_y

part1_dli_loop:

	lda part1_y
	adc part1_d
	; MATH_SIN_MASK
	and #MATH_SIN_MASK
	tay
	ldx math_sin,y
	txa
;	lsr
;	lsr
;	lsr
	tax
	ldy part1_y
	jsr plot
	
	clc
	eor #$FF
;	adc #1
	
	tax
	jsr plot

; zmiana koloru ramki		
	stx COLBG
	stx WSYNC	;WAIT

	iny
	sty part1_y
	tya
	cmp #192 ; (0xc0)
	bne part1_dli_loop

	ldx part1_d
	inx
	stx part1_d

	REG_PULL
	
	rts
	
part1_dli_handler:

	pha
	
	lda part1_sync
	adc #$01
	sta part1_sync
	
	pla
	
	rti
	
part1_wait_sync:
	REG_PUSH
	
part1_wait_sync_loop:	
	lda part1_sync
	cmp #$00
	bne part1_wait_sync_loop 
	lda #$00
	sta part1_sync
	
	REG_PULL
	rts
	
	
	