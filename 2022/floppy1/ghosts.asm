	org $6000

pm_base:
	:768 dta $FF
pm_missle:
	:256 dta $FF
pm_player0:
	:32 dta $00 ; frame
	:26 dta $00 ; position y
	:73 dta $CC ; lines
	:125 dta $00
pm_player1:
	:32 dta $00 ; frame
	:26 dta $00 ; position y
	:73 dta $F0 ; lines
	:125 dta $00
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

	lda #COLOR_AMIGA_BACKGROUND
	sta COLPM0S	; KOLOR
	sta COLPM1S	; KOLOR
	sta COLPM2S	; KOLOR
	sta COLPM3S	; KOLOR
	sta COLPM0	; KOLOR
	sta COLPM1	; KOLOR
	sta COLPM2	; KOLOR
	sta COLPM3	; KOLOR

	; szerokoœæ
	lda #1
	sta SIZEP0	; SIZEP0
	lda #1
	sta SIZEP1	; SIZEP0
	lda #1
	sta SIZEP2	; SIZEP0
	lda #0
	sta SIZEP3	; SIZEP0

	lda #2
	sta 53277	; PMCTL


	; enable PM DMA
	lda #%11100111
	and DMACTLS
	ora #%00011000

	sta DMACTLS		; DMACTLS

	; 64 - begin
	; 4,8,12,16
	lda #98
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

