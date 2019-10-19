	org $6000

pm_base:
	:768 dta $FF
pm_missle:
	:256 dta $FF
pm_player0:
	:24  dta $00
	:232 dta $FF
pm_player1:
	:24  dta $00
	:232 dta $FF
pm_player2:
	:24  dta $00
	:232 dta $FF
pm_player3:
	:24  dta $00
	:232 dta $FF
	
.MACRO PM_SHOW

	lda #$60
	sta PMBASE	; PMBASE

	lda #1
	sta GTIACTL		; GTIACTLS

	; szerokoœæ
	lda #0
	sta SIZEP0	; SIZEP0
	lda #0
	sta SIZEP1	; SIZEP1
	lda #0
	sta SIZEP2	; SIZEP2
	lda #0
	sta SIZEP3	; SIZEP3

	; enable PMG
	lda #2
	sta PMCTL	; PMCTL

	lda #57
	sta DMACTL		; DMACTLS

	; 64 - begin
	; 4,8,12,16
	lda #68
	sta HPOSP0 

	lda #88
	sta HPOSP1 

	lda #108
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

