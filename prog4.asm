
.data

.text
	addi $4, $0, 30
	addi $5, $0, 25
	add  $2, $0, $5
	
		beqz $4, exit  #if (r4 == 0) goto (10)
	goto: 	beqz $5, then2  #if (r5 == 0) goto (9)
		# bgt $4, $5, then3 <--- Pseudoinstruction ---> this translates to : 
		slt $1, $5, $4
		bne $1, $0, then3 
		j goto
	then3: 	sub $4, $4, $5
		sub $5, $5, $4	
	
	then2:  add $2, $0, $4
	#then: 	j then  #(10)
	
	exit:
	li $v0,10
	syscall