.data 
array: .word 1,13,54,67,43,2,4,5,7,1
text1: .asciiz "Plz input integer number to be found: "
text2: .asciiz "Number does not exist in the array "
text3: .asciiz "The index is: "
text4: .asciiz " "
.text
	la $s0, array
	li $t0, 0 #init i = 0
	li $t5, 0
	li $t2, 10
	li $v0, 4
 	la $a0, text1
 	syscall
 	li $v0, 5
 	syscall
 	add $a0, $zero, $v0
 	addi $s1, $a0, 0 #load value of user
loop:	
	beq $t0, $t2, out
	lw $t1, 0($s0)
	beq  $t1, $s1, exit
	addi $s0, $s0, 4
	addi $t0, $t0, 1
	j loop
exit:	li $t5, 1
	li $v0, 4
 	la $a0, text3
 	syscall
 	li $v0, 1
 	add $a0, $t0, $zero
 	syscall
 	li $v0, 4
 	la $a0, text4
 	syscall
 	addi $s0, $s0, 4
	addi $t0, $t0, 1
 	j loop
 exit1: li $v0, 4
 	la $a0, text2
 	syscall
 	j Out
 out:   beqz $t5, exit1
 Out:
 
