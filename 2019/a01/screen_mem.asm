	org $4000

screen_mem_1 = $4000
	:2048 dta $AA
screen_mem_1_1 = $4800
	:2048 dta $AA
screen_mem_1_2 = $5000
	:2048 dta $f0
	
	org $5800
screen_mem_2 = $5800
screen_mem_2_1 = $6000
screen_mem_2_2 = $6800
	:6144 dta 0



