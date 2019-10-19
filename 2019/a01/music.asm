.MACRO MUSIC_INIT 
	ldx #<MUSIC
	ldy #>MUSIC
	lda #0
	jsr rmt_init
.ENDM


	org $a000
MUSIC equ	$a000
	
STEREOMODE equ 0
	
	opt h-
	ins "random_s.rmt"
	opt h+
	
	icl "rmtplayr.asm"
