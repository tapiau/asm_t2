part_test1_x dta 0
part_test1_y dta 0
part_test1_d dta 0
TMPCLR dta 0

part_test1_tmpx dta 0
part_test1_tmpy dta 0
part_test1_tmpa dta 0
part_test1_sync: dta 0
part_test1_line: dta 0


part_test1:

	lda #0     
	sta DLI_PEN
	lda #COLOR_BLACK     
	sta DLI_PAPER
	lda #COLOR_BLACK     
	sta DLI_FRAME
	
	jsr screen_set_write_1
	jsr screen_set_read_1

	MEMCOPY_SCREEN image_data_unicorn screen_mem_1
	
	PM_SHOW

	lda #$04
	sta GTIACTL		; GTIACTLS

	lda #2
	sta PMCTL	; PMCTL
	
	; szeroko��
	lda #2
	sta SIZEP0	; SIZEP0
	; pozycja
	lda #90
	sta HPOSP0 
	; kolor 
	lda #$CA
	sta COLPM0
	
	DLI_ENABLE part_test1_dli_handler
	
	


part_test1_0:

	
part_test1_0_idle:
	
	;PM_MOVE
	
	jmp part_test1_0_idle

	SLEEP 250
	SLEEP 250
	SLEEP 250
	SLEEP 250
	SLEEP 250
	SLEEP 250
	
	DLI_DISABLE
	PM_HIDE

	rts

part_test1_dli_handler:

; line:
; 32 cycles - frame (2+26+4)
; 28 cycles - screen

	REG_PUSH
	
	; disable PMG

	lda #0
	LINE_WAIT
	ldy #0
;	ldy #64+0
;	sty HPOSP0
;	ldy #64+32
;	sty HPOSP1
;	ldy #64+64
;	sty HPOSP2
;	ldy #64+96
;	sty HPOSP3
	LINE_WAIT
;	lda #COLOR_RED
;	sta COLPM0
;	lda #COLOR_GREEN
;	sta COLPM1
;	lda #COLOR_BLUE
;	sta COLPM2
;	lda #COLOR_YELLOW
;	sta COLPM3

	:11 LINE_WAIT
	
	LINE_WAIT
;	lda #COLOR_RED
;	sta COLPM0
	LINE_WAIT

	; init color value
	; init color value
	
;	ldy RTCLOCK_0
;	lda math_sin,y
;	sta bar_color1
;	tya
;	eor #$ff
;	tay
;	lda math_sin,y
;	sta bar_color2	

;	ldx bar_color1
;	ldy bar_color2

;	lda #3
;	sta SIZEP0	; SIZEP0
;	sta SIZEP1	; SIZEP0
;	sta SIZEP2	; SIZEP0
;	lda #1
;	sta SIZEP3      ; SIZEP0

	LINE_WAIT

	:14 nop
	; enable PMG

	nop
	nop

	lda #0;
	ldx #128 
	LINE_WAIT
	    
part_test1_p1:	 ; 67 cycles
	:2 nop
	sta part_test1_tmpa	; 2
	lsr			; 1
	lsr			; 1
	lsr			; 1
	adc #$10		; 1
 	sta DLI_PAPER   	; 2
	:3 nop
	;adc #1			; 1
 	;sta DLI_PEN   	; 2
	lda part_test1_tmpa	
	:15 nop		; 56
	adc #1          ; 2
	dex             ; 2  
	; stx WSYNC       ; 4
	bne part_test1_p1 ; 3


	ldx #176 
	LINE_WAIT
	
part_test1_p2:	 ; 67 cycles
	:11 nop
 	sta DLI_PAPER   ; 4
	:17 nop		; 56
	adc #1          ; 2
	dex             ; 2  
	; stx WSYNC       ; 4
	bne part_test1_p2 ; 3
	

	REG_PULL
	rti
	
	
	