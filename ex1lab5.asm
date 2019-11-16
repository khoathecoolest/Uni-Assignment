.data
 text1: .asciiz "Plz input integer number: "
 .text
 
 	li $t0, 0
 	li $s0, 0 #init the sum = 0
 main:	li $v0, 4
 	la $a0, text2
 	syscall
 	li $v0, 5
 	syscall
 	add $a0, $zero, $v0
 	slt $t1, $t0, $a0
 	beqz $t1, out
 	add $s0, $s0, $a0
 	j main
 out:
 
 	add $s0, $s0, $a0
 	li $v0, 1
 	add $a0, $s0, $zero
 	syscall
 	
 	
 	
