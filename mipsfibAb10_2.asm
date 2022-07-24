.data
 fibArray: .word 0 : 12
 upperBound: .word 12
 outputPromp: .asciiz "Type in the Fib digit you want (1 - 12 possible): "
 
.text
 lw $t0, upperBound
  
 
 la $a0, outputPromp
 li $v0, 4
 syscall
 
 loop:
  li $v0, 5
  syscall
  ble $v0, $t0, fibCalc
  j loop
 
 fibCalc: 
  move $t5, $v0
  la $t0, fibArray
  li $t2, 1
  
  sw $t2, fibArray ($t3)
  sw $t2, fibArray ($t3)
  
  sub $t1, $t5, 2
  
  
  
  
  
 
 