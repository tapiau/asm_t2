
	org $a000
MUSIC equ	$a000
	
STEREOMODE equ 0
	
	opt h-
	ins "random_s.rmt"
	opt h+
	
	icl "rmtplayr.asm"
