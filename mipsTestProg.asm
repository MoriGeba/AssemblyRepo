.data
 m: .asciiz "         "
 m2: .asciiz "gib was ein"
.text

 my_main:
  	la $a0, m2
	li $v0, 4
  	syscall
  
  	la $a0, m
  	li $a1, 10
  	li $v0, 8
  	syscall
  	
  	li $a1, 0
  	 loop:
  	  lbu  $t0, m($a1)
  	  addi $a1, $a1, 1
  	  j loop 
 	 
 	