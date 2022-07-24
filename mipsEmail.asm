.data
 inputString: .asciiz "                                        "
 outputString: .asciiz "                                        "
 outputPromp: .asciiz " Type in an Email adress : "
   
.text
 #outputPromp
 la $a0, outputPromp
 li $v0, 4
 syscall
 # inputString
 la $a0, inputString
 li $a1, 40
 li $v0, 8
 syscall
 
 # Calc
 li $a2, 0
 la $a3, outputString
 startLoop:
  lbu $t0, inputString ($a2)
  beq $t0, 64, exit
  sb $t0, outputString ($a2)
  addi $a2, $a2, 1
  j startLoop
 
 exit:
  la $a0, outputString
  li $v0, 4
  syscall
  
 
 
