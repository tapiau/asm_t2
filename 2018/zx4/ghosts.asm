	org $6000

pm_base:
	:768 dta $FF
pm_missle:
	:256 dta $FF
pm_player0:
	:256 dta $FF
pm_player1:
	:256 dta $FF
pm_player2:
	:256 dta $FF
pm_player3:
	:256 dta $FF
	
.MACRO PM_SHOW

	lda #$60
	sta PMBASE	; PMBASE

	lda #1
	sta GTIACTLS		; GTIACTLS

	; szerokoœæ
	lda #0
	sta SIZEP0	; SIZEP0
	lda #1
	sta SIZEP1	; SIZEP0
	lda #1
	sta SIZEP2	; SIZEP0
	lda #0
	sta SIZEP3	; SIZEP0

	lda #2
	sta PMCTL	; PMCTL

	lda #57
	sta DMACTLS		; DMACTLS

	; 64 - begin
	; 4,8,12,16
	lda #68
	sta HPOSP0 

	lda #88
	sta HPOSP1 

	lda #150
	sta HPOSP2 

	lda #180
	sta HPOSP3 

	lda #14
	sta COLPM0
	sta COLPM1
	sta COLPM2
	sta COLPM3

.ENDM

.MACRO PM_HIDE
	lda #0
	sta HPOSP0 
	sta HPOSP1 
	sta HPOSP2 
	sta HPOSP3 
.ENDM


.MACRO PM_MOVE
	lda RTCLOCK_0
	sta 53248
.ENDM

