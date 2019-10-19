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

.MACRO LINE_NOP_HALF
	sta WSYNC	;WAIT

	;; 4 nops
	lda bar_color1  ; 3 cycles
	sbc #$01	; 2 cycles
	sta bar_color1  ; 3 cycles
	eor #$ff	; 2 cycles
	sta bar_color10 ; 3 cycles

	lda bar_color2  ; 3 cycles
	sbc #$01	; 2 cycles
	sta bar_color2  ; 3 cycles
	eor #$ff	; 2 cycles
	sta bar_color20 ; 3 cycles

	
	lda bar_color20	; 3 cycles
	sta DLI_PAPER	; 4 cycles
	lda bar_color10
	nop
	nop
	nop
	sta DLI_PAPER	; 4 cycles

	dey
.ENDM

.MACRO LINE_NOP_NORMAL
	sta WSYNC	;WAIT

	;; 4 nops
	lda bar_color1  ; 3 cycles
	sbc #$01	; 2 cycles
	sta bar_color1  ; 3 cycles
	eor #$ff	; 2 cycles
	sta bar_color10 ; 3 cycles

	lda bar_color2  ; 3 cycles
	sbc #$01	; 2 cycles
	sta bar_color2  ; 3 cycles
	eor #$ff	; 2 cycles
	sta bar_color20 ; 3 cycles

	
	sta DLI_PAPER	; 4 cycles
	lda bar_color10
	nop
	nop
	nop
	nop
	sta DLI_PAPER	; 4 cycles

	dey
.ENDM

.MACRO LINE_NOP_SHORT
	sta WSYNC	;WAIT

	lda bar_color1  ; 3 cycles
	sbc #$01	; 2 cycles
	sta bar_color1  ; 3 cycles
	eor #$ff	; 2 cycles
	sta bar_color10 ; 3 cycles

	lda bar_color2  ; 3 cycles
	sbc #$01	; 2 cycles
	sta bar_color2  ; 3 cycles
	eor #$ff	; 2 cycles
	sta bar_color20 ; 3 cycles

	
	sta DLI_PAPER	; 4 cycles
	lda bar_color10 ; 3 cycles
	nop		; 2 cycles
	nop		; 2 cycles
	nop		; 2 cycles
	sta DLI_PAPER	; 4 cycles

	dey
.ENDM
