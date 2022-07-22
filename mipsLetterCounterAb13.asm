.data
 readString: .asciiz "                   "
 inputPromptxt: .asciiz " Put in a Word or a Sentence: "
 inputPrompChar: .asciiz "Put in a Character : "
 outputPromp: .asciiz " occurence (s) "

.text
 # inputPromptxt
 la $a0, inputPromptxt
 li $v0, 4
 syscall
 
 # readString
 la $a0, readString
 li $a1, 40
 li $v0, 8
 syscall
 
 # inputPrompChar
 la $a0, inputPrompChar
 li $v0, 4
 syscall
 
 # readChar
 li $v0, 12
 syscall
 move $t0, $v0
 
 #ncstr
 li $a2, 0 		# initialize the counter for char's
 li $a3, 0		# initialize loop counter 
 ncstr:
  lbu $t1, readString($a3)
  beq $t0, $t1, countUp
  beq $t1, 10, exit
  addi $a3, $a3, 1
  j ncstr
  
 countUp:
  addi $a2, $a2, 1
  addi $a3, $a3, 1
  j ncstr
  
 exit:
  move $a0, $a2
  li $v0, 1
  syscall
  la $a0, outputPromp
  li $v0, 4
  syscall
  
  