.data 
	array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 0
	text: .asciiz "Input an index: "
.text
main:
	li $v0, 4
	la $a0, text
	syscall
	la $t0, array
	li $v0, 5
	syscall
	li $t1, 0 #init i=0
loop:	beq $t1, $v0, Exit
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	j loop
Exit:	lw $s0, 0($t0)
	li $v0, 1
	add $a0, $zero, $s0
	syscall
	
	
	