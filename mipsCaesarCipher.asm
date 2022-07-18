# Caesar cipher

.data
 input: .asciiz "                                    "
 cipher: .asciiz "                                     "
 text1: .asciiz "Geben sie eine Zeichenkette ein (max. 40 chars): "
 text2: .asciiz "Geben sie eien Schlüssel ein (int): "
 outputtxt: .asciiz " Verschlüsseltes wort : \n"
 
.text
 
 # Ausgabe String text1
  la $2, 4
  la $4, text1
  syscall
 
 # Eingabe zu verschlüsselnder Text
  la $2, 8
  la $4, input
  la $5, 40
  syscall
 
 # Ausgabe String text2
  la $2, 4
  la $4, text2
  syscall
 
 # Eingabe Key
  la $2, 5
  syscall
  la $8, ($2)
 
 # Caesar Cipher
  
   la $3, 0		# set $3 to address of the input string
  main:
   lbu $6, input ($3)	# load byte from this address
   beq $6, 92, exit	# branch if equal to 92 ( \ ) 
   add $6, $6, $8	# add the key to the byte
   sb $6, cipher ($3)	#store the byte in the cipher string
   addi $3, $3, 1
   j main
   
  exit:
   la $2, 4
   la $4, outputtxt
   syscall
   la $4, cipher
   syscall
   
   
