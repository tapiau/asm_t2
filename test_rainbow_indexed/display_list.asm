	ICL 'display_list_const.asm'

	org $3800

DL_DLI = $80

; DL for first buffer	
dl_antic_1	dta $70,$70,$70              ; 3x8 empty scanlines
		dta b($4f),a(screen_mem_1)   ; $0f - mode, $40 - addr of 1/3 screen bitmap 
		:62 dta b($0f)               ; 63 lines of $0f 
		dta b($8f)                   ; 1 line of $0f + DLI 
		dta b($4f),a(screen_mem_1_1) ; $0f - mode, $40 - addr of 2/3 screen bitmap
		:63 dta b($0f)	             ; 63 lines of $0f 
		dta b($4f),a(screen_mem_1_2) ; $0f - mode, $40 - addr of 3/3 screen bitmap
		:63 dta b($0f)               ; 63 lines of $0f
		;dta b($c1),a(dl_antic_1)     ; jump to DL start and trigger interrupt
		dta b($41),a(dl_antic_1)     ; jump to DL start
dl_antic_2	dta $70,$70,$70              ; 3x8 empty scanlines 
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

	lda #COLOR_BLACK     
	sta GR8_PEN
	lda #COLOR_WHITE     
	sta GR8_PAPER
	lda #COLOR_WHITE     
	sta GR8_FRAME

	rts

		