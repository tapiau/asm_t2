	org $6000

pm_base:
	:768 dta 0
pm_missle:
	:256 dta 0
pm_player0:
	:256 dta $AA
pm_player1:
	:256 dta $55
pm_player2:
	:256 dta $AA
pm_player3:
	:256 dta $55
	
.MACRO PM_SHOW
	lda <pm_base
	sta PMBASE
	lda #0
	sta SIZEP0
	lda COLOR_WHITE
	sta COLPM0
	lda #100
	sta HPOSP0
	lda PMCTL
	ORA #$01
	sta PMCTL
	
.ENDM