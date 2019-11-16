.data
 array: .word 0, 0, 0,0,0,0,0,0,0,0
 text: .asciiz "The sum of the array: "
 length: .word 10
 newline: .asciiz "\n"
 .text

 	
 main: la $t0, array #load address 
 	li $s0 , 0 #sum = 0
 	lw $s1, length #load i
 	li $t1, 0 #init i = 0
 input: beq $t1, $s1, Exit
 	li $v0, 5
 	syscall 
 	add $s2 , $zero, $v0
 	sw $s2, 0($t0)
 	lw $t3, 0($t0)
 	add $s0, $s0, $t3
 	addi $t0, $t0, 4
 	addi $t1, $t1, 1
 	j input

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
