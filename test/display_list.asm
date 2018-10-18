	ICL 'display_list_const.asm'

	org $3800

; DL for first buffer	
dl_antic_1	dta $70,$70,$70              ; 3x8 empty scanlines
		dta $F0
		dta b($4f),a(screen_mem_1)   ; $0f - mode, $40 - addr of 1/3 screen bitmap 
		:63 dta b($0f)               ; 63 lines of $0f 
		dta b($4f),a(screen_mem_1_1) ; $0f - mode, $40 - addr of 2/3 screen bitmap
		:63 dta b($0f)	             ; 63 lines of $0f 
		dta b($4f),a(screen_mem_1_2) ; $0f - mode, $40 - addr of 3/3 screen bitmap
		:63 dta b($0f)               ; 63 lines of $0f
		;dta b($c1),a(dl_antic_1)     ; jump to DL start and trigger interrupt
		dta b($41),a(dl_antic_1)     ; jump to DL start
dl_antic_2	dta $70,$70,$70              ; 3x8 empty scanlines 
		dta $F0
		dta b($4f),a(screen_mem_2)   ; $0f - mode, $40 - addr of 1/3 screen bitmap
		:63 dta b($0f)               ; 63 lines of $0f 
		dta b($4f),a(screen_mem_2_1) ; $0f - mode, $40 - addr of 2/3 screen bitmap
		:63 dta b($0f)	             ; 63 lines of $0f 
		dta b($4f),a(screen_mem_2_2) ; $0f - mode, $40 - addr of 3/3 screen bitmap
		:63 dta b($0f)               ; 63 lines of $0f 
		;dta b($c1),a(dl_antic_2)     ; jump to DL start and trigger interrupt
		dta b($41),a(dl_antic_2)     ; jump to DL start 

dl_set_mode
	; set screen width to 32 byte
	lda #$fd
	and SDMCTL
	add #1
	sta SDMCTL
	sta DMACTL

	; set colors
	lda #0      ; black
	sta COLOR1
	lda #14     ; white
	sta COLOR2
	lda #0      ; black
	sta COLOR3
	lda #14     ; white
	sta COLOR4
	lda #14     ; white
	sta COLBG

	rts

set_screen_1:
	; load display list address to register
	mwa #dl_antic_1 DLIST
	; switch working buffer pointer
	mwa #screen_mem_2 screen_adr
	rts

set_screen_2:
	; load display list address to register
	mwa #dl_antic_2 DLIST
	; switch working buffer pointer
	mwa #screen_mem_1 screen_adr
	rts
		