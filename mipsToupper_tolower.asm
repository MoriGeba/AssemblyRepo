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
 
 Toto:
  # outputPrompToto
  la $a0, inputPrompToto
  li $v0, 4
  syscall
  # read Toto
  li $v0, 5
  syscall
  move $v1, $v0
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
  beq $t1, 10, exit
  bleu $t1, 64, storeLower
  bgeu $t1, 91, storeLower
  addi $t1, $t1, 32
  j storeLower
   
 toupper:
  lbu $t1, inputString ($t0)
  beq $t1, 10, exit
  bleu $t1, 96, storeUpper
  bgeu $t1, 123, storeUpper
  subi  $t1, $t1, 32
  j storeUpper
 
 storeLower:
  sb $t1, outputString($t0)
  addi $t0, $t0, 1
  j tolower
   
 storeUpper:
  sb $t1, outputString($t0)
  addi $t0, $t0, 1
  j toupper
  
 exit:
  la $a0, outputString
  li $v0, 4
  syscall
