.data
text1: .asciiz "Plz input integer number: "
text2: .asciiz "Plz input case: "
text3: .asciiz "please input an another case numbers: \n"
.text 
	li $t0, 0
	li $t1, 1
	li $t2, 2
	li $v0, 4
 	la $a0, text1
 	syscall
 	li $v0, 5
 	syscall
 	add $a0, $zero, $v0
 	addi $s0, $a0, 0 #load value of b
 	li $v0, 4
 	la $a0, text1
 	syscall
 	li $v0, 5
 	syscall
 	add $a0, $zero, $v0
 	addi $s1, $a0, 0 #load value of c
 	li $v0, 4
 	la $a0, text2
 	syscall
 again:	li $v0, 5
 	syscall
 	add $a0, $zero, $v0
 	beq $a0, $t0, case0
 	beq $a0, $t1, case1
 	beq $a0, $t2, case2
 	j def
 case0:
 	add $s2, $s0, $s1
 	li $v0, 1
 	add $a0, $s2, $zero
 	syscall
 	j exit
 case1:
 	sub $s2, $s0, $s1
 	li $v0, 1
 	add $a0, $s2, $zero
 	syscall
 	j exit
 case2:
 	sub $s2, $s1, $s0
 	li $v0, 1
 	add $a0, $s2, $zero
 	syscall
 	j exit
 def:
 	li $v0, 4
 	la $a0, text3
 	syscall
 	j again
 exit: