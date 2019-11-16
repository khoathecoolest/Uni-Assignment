.data
array: .word 13,300,2,4,5,12,56,17,100
.text
main:
	la $s0 array
	li $t1, 9
	li $t5, 9
	lw $s1, 0($s0) #init max
stack:
	addi $sp, $sp, -8
	lw $a0, 0($s0)
	sw $ra, 4($sp)
	sw $a0, 0($sp)
#base
	slti $t2, $t1, 2
	beq $t2, $zero, recurr
	lw $t0, 0($s0)
	jr $ra
#stack
recurr:
	addi $t1, $t1, -1
	addi $s0, $s0, 4
	jal stack
	lw $t3, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	slt $t4, $s1, $t3
	beq $t4, 1, setMax
	addi $t5, $t5, -1
	beqz $t5, out
	jr $ra
setMax:
	add $s1, $zero, $t3
	add $t5 ,$t5, -1
	jr $ra
out:
	li $v0, 1
	add $a0, $zero, $s1
	syscall
