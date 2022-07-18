.data
 fibArray: .space 48
 upperBound: .byte 12
 inputPromt: .asciiz " Geben sie ein welche Fibonacci-Zahl sie haben wollen (1 - 12 möglich): "
 exitPromt: .asciiz " Fetsch !!! "
 
.text 
 # Fib
 
 # setting input promt
 la $4, inputPromt
 li $2, 4
 syscall
 # setting output promt
 la $2, 5
 syscall
 move $5, $2
 
 # Calculation
 addi $5, $5, 1		# adding 1 to whatever is in $5
 la $3, 0		# setting the counter in $3
 lb $6, upperBound
 beq $5, $6, exit		
 main:
  addi $8, $0, 1	# establishing the startlines for the fib calc
  addi $9, $0, 2	# establishing the startlines for the fib calc
  #fib calc
  loop:
  beq $5, $3, exit	# comparison with the input n
  add $10, $8, $9
  sb $10, fibArray ($3)
  lb $8, fibArray ($3)
  addi $3, $3, 1
  j loop
  
  
 exit:
 # exit promt + fib calc solution
 li $2, 4
 la $4, exitPromt
 syscall 
