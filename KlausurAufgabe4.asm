.data
 inputString1: .asciiz "                                        "
 inputString2: .asciiz "                                        "
 outPromp1: .asciiz " Geben sie ein Wort ein (max. 50 chars): "
 outPromp2: .asciiz " Geben sie ein zweites Wort ein (max. 50 chars) : "
 solvPromp: .asciiz " Die Worte sind bis zu "
 solvPromp2: .asciiz " gleich ! "
 invalid: .asciiz " zu lang !! andere Zeichenkette eingeben !!! "
 maxc: .word 50
 
.text
 # output and input of the Strings
 j start2
 start:
 la $a0, invalid
 li $v0, 4
 syscall
 start2:
 la $a0, outPromp1
 li $v0, 4
 syscall
 
 la $a0, inputString1
 li $a1, 50
 li $v0, 8
 syscall
 
 la $a0, outPromp2
 li $v0, 4
 syscall
 
 la $a0, inputString2
 li $a1, 50
 li $v0, 8
 syscall
 
 li $t0, 0
 loop1:
  lb $t1, inputString1($t0)
  lb $t2, inputString2($t0)
  beq $t1, 10, loopexit
  beq $t2, 10, loopexit
  addi $t0, $t0, 1
  j loop1
 loopexit: 
  lw $t1, maxc 
  bge $t0 , $t1, start
 # Processing of the input's
 
 li $t0, 0 	#setting counter for chars
 li $t1, 0 	#setting itterator
 
 loop2:
  lb $t2, inputString1($t1)
  lb $t3, inputString2($t1)
  
  bleu $t2, 64, next
  bgeu $t2, 91, next
  addi $t2, $t2, 32
  next:
   bleu $t3, 64, next2
   bgeu $t3, 91, next2
   addi $t3, $t3, 32
   next2:
    beq $t2, 10, exit
    beq $t3, 10, exit
    beq $t2, $t3, countup
    bne $t2, $t3, exit
        
   countup:
    addi $t0, $t0, 1
    addi $t1, $t1, 1
    j loop2
    
   exit:
     la $a0, solvPromp
     li $v0, 4
     syscall  
     
     move $a0, $t0
     li $v0, 1
     syscall
     
     la $a0, solvPromp2
     li $v0, 4
     syscall
     