	org $4000

screen_mem_1 = $4000
screen_mem_1_1 = $4800
screen_mem_1_2 = $5000
	:6144 dta 0
	
	org $5800
screen_mem_2 = $5800
screen_mem_2_1 = $6000
screen_mem_2_2 = $6800
	:6144 dta 0

	org $7000
image_data_zx_font:
	.local graphics
	ins "..\pic\zx_font.fnt"
	.endl
image_data_unicorn:
	.local graphics
	ins "..\pic\unicorn2inv.gr8"
	.endl


