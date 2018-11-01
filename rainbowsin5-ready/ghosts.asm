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

;	lda #$60
;	sta PMBASE
;	lda #0
;	sta SIZEP0
;	lda #COLOR_WHITE
;	sta COLPM0
;	sta COLPM0S
;	lda #100
;	sta HPOSP0
;	lda #3
;	sta PMCTL
;	lda #1
;	sta GTIACTL

;	lda DMACTLS
;	ora #%00011000
;	sta DMACTLS


	lda #$60
	sta 54279	; PMBASE

	lda #1
	sta 623		; GTIACTL

	lda #14
	sta 704		; KOLOR

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
	sta 53277	; PMCTL

	lda #57
	sta 559		; DMACTLS

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

.ENDM

.MACRO PM_MOVE
	lda RTCLOCK_0
	sta 53248
.ENDM

