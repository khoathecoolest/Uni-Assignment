.data
array: .word 0,1,2,3,4,5,6,13,14,15,16
.text
main: 
	la $t0, array
	li $t1, 10
	li $t4, 10
	li $s0, 0
stack:
	add $sp, $sp, -8
	lw $a0, 0($t0)
	sw $ra, 4($sp)
	sw $a0, 0($sp)
	
#base
	slti $t2, $t1, 2
	beq $t2, $zero, recurr
	jr $ra
#stack
recurr:
	addi $t1, $t1, -1
	addi $t0, $t0, 4
	jal stack
	lw $t3, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	add $s1, $s1, $t3
	addi $t4, $t4, -1
	beqz $t4, out
	jr $ra
out:
	li $v0, 1
	add $a0, $zero, $s1
	syscall
