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
 
 beq $v1, 1, toupper
 beq $v1, 2, tolower
 la $a0, invalid
 li $v0, 4
 syscall
 
 toupper:
 
 tolower:
 
 
 