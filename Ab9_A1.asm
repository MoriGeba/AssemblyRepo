.data 
	text1: .asciiz "Geben sie ein Wort ein : "
	

.text
	#ausgabe text
	li $v0, 4
	la $a0, text1			
	syscall	
	
	li $v0, 5
	syscall
	
	#Einlesen:
		
	
				#Verarbeitung:
		
				#Ausgabe:
