.data 
 	input: .space 12 # 12 byte reservierung an der Stelle im speicher an der das .space statement steht
	text1: .asciiz "Geben sie ein Wort ein : "
	text2: .asciiz "Bitte Character eingeben : "
	text3: .asciiz "Anzahl vorkommens : "
	
	

.text
	start:
	#ausgabe Geben sie eine Wort ein
		la $4, text1
		li $2, 4			
		syscall	
		
		lui $4, 0x1001
		ori $a0, 0x0000
		addi $5, $0, 128
		li $2, 8
		syscall
	
		la $4, text2
		li $3, 12
		syscall
	
	#Verarbeitung:
	
		addi $8, $0, 0		# $8 ist unser counter
		addi $9, $2, 0		# $9 ist unser Vergleich Charakter
		la $10, input		# $10 ist die speicheraddresse
	
	loop:
		lb $11, ($10)	#$11 ist unser aktuelle charakter zum Vergleichen
		beqz $11, print
		addi $10, $10, 1
		bne $9, $11, loop
		addi $8, $9, 1
		j loop
	
	print:
		la $4, text3
		li $2, 4
		syscall
		
		move $2, $8
		li $2, 1
		syscall
		j start
	
	
				
		
				#Ausgabe:
