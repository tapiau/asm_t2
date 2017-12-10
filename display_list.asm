DLISTL  = $230 ; display list pointer low byte
DLISTH  = $231 ;                      high byte
COLBG	= $D01A 
COLPF0	= $D016  
COLPF1	= $D017  
COLPF2	= $D018  
COLPF3	= $D019
COLOR0	= $02C4
COLOR1	= $02C5
COLOR2	= $02C6
COLOR3	= $02C7
COLOR4 	= $02C8
SDMCTL  = $022F
DMACTL  = $D400
VDSLST  = $0200
NMEN	= $D40E

	org $3800
antic_1		dta $70,$70,$70
		dta b($4f),a(screen_mem_1)
		:63 dta b($0f)
		dta b($4f),a(screen_mem_1_1)
		:63 dta b($0f)	
		dta b($4f),a(screen_mem_1_2)
		:63 dta b($0f)
		;dta b($c1),a(antic) przerwanie
		dta b($41),a(antic_1)
antic_2		dta $70,$70,$70
		dta b($4f),a(screen_mem_2)
		:63 dta b($0f)
		dta b($4f),a(screen_mem_2_1)
		:63 dta b($0f)	
		dta b($4f),a(screen_mem_2_2)
		:63 dta b($0f)
		;dta b($c1),a(antic) przerwanie
		dta b($41),a(antic_2)

set_mode

	; set screen width to 32 byte
	lda #$fd
	and SDMCTL
	add #1
	sta SDMCTL
	sta DMACTL

	; set colors
	lda #0
	sta COLOR1
	lda #14 ; white
	sta COLOR2
	lda #0
	sta COLOR3
	lda #14
	sta COLOR4
	lda #14
	sta COLBG

	rts

set_screen_1:
	; load display list address to register
	lda <antic_1
	sta DLISTL
	lda >antic_1
	sta DLISTH
	
	rts

set_screen_2:
	; load display list address to register
	lda <antic_2
	sta DLISTL
	lda >antic_2
	sta DLISTH

	rts
		