	
nmi_old_vector:
	dta 0,0
	
vvblkd equ $0224
	
nmi_set:

	lda RTCLOCK_0
nmi_wait:
	cmp RTCLOCK_0
	beq nmi_wait 
       
	sei ; interrupt off
	mva #$00 NMIEN
	sta DMACTL
	mva #$fe PORTB ; wy³¹czenie basica?

	mwa #NMI NMIVECT ; nowa procedura przerwania
	mva #(NMIEN_DLI+NMIEN_VBI) NMIEN
		
;	MUSIC_INIT
	
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
;	jsr rmt_play ; uncomment when music enabled
	REG_PULL
;	jmp (nmi_old_vector)
	
	rti

dli_pass:
	rti
	