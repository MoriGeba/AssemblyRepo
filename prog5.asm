.data

.text
	addi $4, $0, 30
	addi $5, $0, 25
	add $2, $0, $5
	
	
	beqz $4, exit		#if (r4,  == 0 ) branch equals zero --> goto exit
	start:
	beqz $5, goto_9		#if (r5 == 0) branch equals zero --> goto exit
	
	
	bgt $4, $5, then	#
	sub $5, $5, $4		#else subtraktion register 4 von register
	j start			#jump to start
	#label then
	then:
		sub $4, $4, $5	#subtraktion register 5 von register 4
		j start 	# jump to start
	
	#label goto_9
	goto_9:
		add $2, $0, $4
	#label exit
	exit:
		li $v0, 10
		syscall	