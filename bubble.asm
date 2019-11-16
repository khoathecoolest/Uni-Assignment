.data
	elems: .word 1,2,3,4,5,6,7,8,-9,-10,11,12,13,45,-100
	nums: .word 13
.text 
main:
	la $t1, elems
	la $t0, nums
	lw $t6 , 0($t0)
	lw $s4 , 0($t0)
	addi $s6, $t6 , -1
	mul $s7 , $s6, -4
bubble:  
	beq $s4 , $0 , outbubble
	beq $t8 , 1, outbubble
	bubbleloop: 
		li $t7 , 0	
		addi $s4, $s4 , -1
		li $t8 , 1				
	loop:	beq $t7 , $s4 , returnadd
		lw $s2 , 0($t1)
		addi $t1 , $t1 , 4 
		lw $s3 , 0($t1)
		slt $t3 , $s2 , $s3 
		addi $t7 , $t7 , 1
		beq $t3 , 1 , swap	
		j loop
swap:
	sw $s3, -4($t1)
	sw $s2, 0($t1)
	li $t8 , 0
	j loop
returnadd:
	add $t1 , $t1 , $s7
	addi $s7 , $s7 , 4
	j bubble	
outbubble:
