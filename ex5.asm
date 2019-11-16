.data
	array: .word 1,2,3,4,5,6,7,8,9,10
.text
main:
	la $s0, array
	la $s1, array
	li $t1, 0 #init i = 0
	li $t2, 5 #init 5
loop:	beq $t1, $t2, Exit
	lw $t3, 36($s0)
	lw $t4, 0($s1)
	sw $t3, 0($s1)
	sw $t4, 36($s0)
	addi $s0 ,$s0, -4
	addi $s1, $s1, 4
	addi $t1, $t1, 1
	j loop
Exit:	li $t1 , 0
	li $t2, 10
loop2:	beq $t1, $t2, Out
	lw $t5, 20($s0)
	li $v0, 1
	add $a0, $zero, $t5
	syscall
	addi $s0, $s0, 4
	addi $t1, $t1, 1
	j loop2
Out:
	

