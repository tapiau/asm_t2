	
nmi_old_vector:
	dta 0,0
	
vvblkd equ $0224
	
nmi_set:

	lda RTCLOCK_0
czekaj:
	cmp RTCLOCK_0
	beq czekaj 
       
	sei ; interrupt off
	mva #$00 NMIEN
	sta DMACTL
	mva #$fe PORTB ; wyłączenie basica?

;	mwa $fffa nmi_old_vector	
	mwa #NMI $fffa ; nowa procedura przerwania

;	mwa vvblkd nmi_old_vector	
;	mwa #NMI vvblkd ; nowa procedura przerwania

	mva #$c0 NMIEN
		
	ldx #<MUSIC
	ldy #>MUSIC
	lda #0
	jsr rmt_init
	
	rts
	
NMI:
	bit NMIST
	bpl VBL
		
	jmp dli_pass
nmi_dli_handler_vector equ *-2
	
VBL:
	REG_PUSH
	lda RTCLOCK_0
	clc
	adc #1
	sta RTCLOCK_0
	jsr rmt_play
	REG_PULL
;	jmp (nmi_old_vector)
	
	rti

dli_pass:
	rti
	