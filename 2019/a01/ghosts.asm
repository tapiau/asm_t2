	org $6000

pm_base:
	:768 dta $FF
pm_missle:
	:256 dta $FF
pm_player0:
	:32  dta $00
	:96  dta $FF
	:48  dta $55
	:48  dta $AA
	:32  dta $00
pm_player1:
	:32  dta $00
	:96  dta $FF
	:48  dta $55
	:48  dta $AA
	:32  dta $00
pm_player2:
	:32  dta $00
	:96  dta $FF
	:48  dta $55
	:48  dta $AA
	:32  dta $00
pm_player3:
	:32  dta $00
	:96  dta $FF
	:48  dta $55
	:48  dta $AA
	:32  dta $00
	
.MACRO PM_SHOW

	lda #$60
	sta PMBASE	; PMBASE

	lda #$01
	sta GTIACTL		; GTIACTLS

	lda #0
	; szerokoœæ
	sta SIZEP0	; SIZEP0
	sta SIZEP1	; SIZEP1
	sta SIZEP2	; SIZEP2
	sta SIZEP3	; SIZEP3
	; pozycja
	sta HPOSP0 
	sta HPOSP1 
	sta HPOSP2 
	sta HPOSP3
	; kolor 
	sta COLPM0
	sta COLPM1
	sta COLPM2
	sta COLPM3

	; enable PMG
	lda #2
	sta PMCTL	; PMCTL

	lda #57
	sta DMACTL		; DMACTLS

	; 64 - begin
	; 4,8,12,16
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

