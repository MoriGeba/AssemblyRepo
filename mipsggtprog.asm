.data 


.text
	addi $4, $0, 30		# (1) r4 <-- 30
	addi $5, $0, 25		# (2) r5 <-- 25
	add  $2, $5, $0		# (3) r2 <-- r5
	
	jal ggt
	
	exit:			#damit wird das Programmbeendet
	
		li $2,4
		la $4, ausgabe
		syscall
	
		li $2, 1
		add $4, $zero, $8
		syscall
	
	ggt:
		# Programm zur Berechnung des ggt von zwei zahlen
		# $4 und $5 sind die Input register
		# $0 ist das Ausgaberegister
	
		beq $4, $0, goto10	# if( r4 == 0) goto (10)
	
	start: 
		beq $5, $0, goto9	# if( r5 == 0) goto (9)
	
		bgt $4, $5, then	# if( r4 > r5)  else jumt to then
		sub $4, $4, $5		# r4 <-- r4 - r5
	
	then: 
		sub $5, $5, $4		# r5 <-- r5 - r4
	
		j start			#jump to start
	
	goto9:
		add $2, $0, $4
		
	goto10:
		jr $ra
