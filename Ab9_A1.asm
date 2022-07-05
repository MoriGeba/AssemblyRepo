.data 
	text1: .asciiz "Geben sie ein Wort ein : "
	

.text
	#ausgabe Geben sie eine Wort ein
	li $v0, 4
	la $a0, text1			
	syscall	
	
	#Einlesen:
	li $v0, 5
	syscall
	
	#Verarbeitung:
	
	
	
				
		
				#Ausgabe:
