#t1 > temp farenheit
#t8 > 5
#t9 > 9

main:
	#addi $t8,$t8, 5
	addi $t9,$t9, 9
	#divu $t5, $t8, $t9
	jal print_question
	jal read_int_from_keyboard
	jal math_operations
	jal print_answer
	move $t7,$t1
	jal print_integer
	j end
	
print_question:
	li $v0,4
	la $a0, string
	syscall
	jr $ra
	
read_int_from_keyboard:
	li $v0,5
	syscall
	move $t1,$v0
	jr $ra
	
print_answer:
	li $v0,4
	la $a0,stringb
	syscall
	jr $ra
	
print_integer:
	li $v0,1
	la $a0,($t7)
	syscall
	jr $ra
	
math_operations:
	sub $t1,$t1,32 #subtracts 32 from the original farenheit temperature
	mult $t1,$t8 #multiplies the original farenheit temperature to 5 which is stored in the $t8 register
	div $t1, $t9 #divides the original farenheit temperature by 9 which is stored in the $t9 register
	jr $ra

end:
	li $v0, 10
	syscall

.data
string: .asciiz "What is the current temperature in Fahrenheit?\n"
stringb: .asciiz "The temperature in Celsius would be: \n"
