.data
	a: .byte 0xa0
	b: .word 0xb1b0
	c: .word 0xc3c2c1c0
	d: .asciiz "The End"
.text
	#add $4, $0, 30
	#add $5, $0, 25
	#add $2, $0, $5
	
	lb $t0, a
main:
	# lh $t1, b
	lui $t1, 0x1001
	ori $t1, $t1, 0x2
	lh $t2, ($t1)
	
	lw $t3, c
	
	
	
	
	
	# if else
	
	addi $4, $0, 30
	addi $5, $0, 25
	add  $2, $0, $5
	
		beq $4, $0, then  #if (r4 == 0) goto (10)
	goto: 	beq $5, $0, then2  #if (r5 == 0) goto (9)
		# bgt $4, $5, then3 <--- Pseudoinstruction ---> this translates to : 
		slt $1, $5, $4
		bne $1, $0, then3 
		j goto
	then3: 	sub $4, $4, $5
		sub $5, $5, $4	
	
	then2:  add $2, $0, $4
	then: 	j then  #(10)
	
