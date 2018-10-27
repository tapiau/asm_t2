.MACRO REG_PUSH 
	pha
	txa
	pha
	tya
	pha
.ENDM

.MACRO REG_PULL
	pla
	tay
	pla
	tax
	pla
.ENDM
	