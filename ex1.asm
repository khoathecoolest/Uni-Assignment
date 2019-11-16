.data
 array: .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
 text: .asciiz "The sum of the array: "
 length: .word 10
 newline: .asciiz "\n"
 .text
 main: la $t0 array #load address 
 	li $s0 , 0 #sumodd = 0
 	li $s2 , 0
 	lw $s1, length #load i
 	li $t1, 0 #init i = 0
 loop: beq $t1, $s1, Exit
 	lw $t3, 0($t0)
 	addi $t0, $t0, 4
 	add $s0, $s0, $t3
 	addi $t1, $t1, 1
 	j loop
 Exit:
 	li $v0, 4
 	la $a0, text
 	syscall
 	li $v0, 1
 	add $a0, $zero, $s0
 	syscall
 	li $v0, 4
 	la $a0, newline
 	syscall
 	
 	
 	
 	
