.data
 inputString: .asciiz "                                    "
 outputString: .asciiz "                                     "
 inputPrompString: .asciiz "Type in a String (max. 40 characters): "
 inputPrompToto: .asciiz " Type (1) for toupper or (2) for tolower : "
 invalid: .asciiz "invalide input !! \n Try again !!! "
 
 
 
.text
 # outputPrompString
 la $a0, inputPrompString
 li $v0, 4
 syscall
 
 # read inputString
 la $a0, inputString
 li $a1, 40
 li $v0, 8
 syscall
 
  # outputPrompToto
 la $a0, inputPrompToto
 li $v0, 4
 syscall
 
 # read Toto
 li $v0, 5
 syscall
 move $v1, $v0
 Toto:
  beq $v1, 1, toupper
  beq $v1, 2, tolower
  # print invalid statement + loop to Toto
  la $a0, invalid
  li $v0, 4
  syscall
  j Toto
  
 # setting counter variables
 li $t0, 0  # setting t0 to 0	
 
 tolower:
  lbu $t1, inputString ($t0)
  bleu $t1, 65, storeLower
  bgeu $t1, 90, storeLower
  beq $t1, 10, exit
  addi $t1, $t1, 32
  addi $t0, $t0, 1
  j storeLower
   
 toupper:
  lbu $t1, inputString ($t0)
   bleu $t1, 97, storeUpper
   bgeu $t1, 122, storeUpper
   beq $t1, 10, exit
   subi  $t1, $t1, 32
   addi $t0, $t0, 1
  j storeUpper
 
 storeUpper:
  sw $t1, outputString ($t0)
 storeLower:
  sw $t1, outputString ($t0)
  j tolower
   
# loopString:
#  lbu $t1, inputString ($t0)	# fetching input string[$t0] -> char in $t1
#  beq $t1, 10, exit
#  bgt $t1, 64, nextA		# branch if > A
#   toLarge:			
#    bgt $t1, 96, nexta		# branch if > a
#    addi $t0, $t0, 1		# adding 1 to $t0
#    j loopString		
#  nextA:
#   blt $t1, 91, tolower		# branch if < Z
#   j toLarge			
#  nexta:
#   blt $t1, 123, toupper	# branch if < z
#   addi $t0, $t0, 1		# adding 1 to $t0
#   j loopString
# 
# toupper:
#  sub  $t2, $t1, 32
#  sb $t2, outputString ($t0) 	#storing byte in OutputString
#  addi $t0, $t0, 1		#increment counter after uppering
#  
# tolower:
#  addi $t2, $t1, 32
#  sb $t2, outputString ($t0)	#storing byte in OutputString
#  addi $t0, $t0, 1
  
 exit:
  la $a0, outputString
  li $v0, 4
  syscall
  
