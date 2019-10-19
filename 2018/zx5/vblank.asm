	
nmi_old_vector:
	dta 0,0
	
nmi_set:
	sei ; interrupt off
	mva #$00 NMIEN
	sta DMACTL
	sta DMACTLS
	mva #$fe portb ; wy³¹czenie basica?
	mwa $fffa nmi_old_vector
	
	mwa #NMI $fffa ; nowa procedura przerwania
	mva #$c0 NMIEN
		
	ldx #<MUSIC
	ldy #>MUSIC
	
	lda #0
	jsr rmt_init
	
	rts
	
NMI:
	bit NMIST
	bpl VBL
		
	jmp part1_dli_handler
nmi_dli_handler_vector equ *-2
	
VBL:
	REG_PUSH
	jsr rmt_play
	REG_PULL
;	jmp (nmi_old_vector)
	
	rti
