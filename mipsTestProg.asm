.data
 m: .asciiz "         "
.text
 la $t0, m 
 li $a0, 12212
 sw  $a0, 0($t0) 