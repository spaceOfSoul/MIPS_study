    .data
str1: .asciiz "Enter 2 number : "
str2: .asciiz "sum = "

    .text
    .globl main
main:
    ori $v0, $zero, 4 # load 4 to $v0 for print_string
	lui $a0, 0x1001	# the print_string syscall expects the string address as the argument;
	ori $a0, $a0, 0x00
	syscall # SPIM will now invoke syscall-4 

    ori $v0, $zero, 5 # syscall-5 for read_int
    syscall # syscall-5
    ori $t0, $v0, 0 # $ t0 = input_val

    ori $v0, $zero, 5 # syscall-5 for read_int
    syscall # syscall-5
    ori $t1, $v0, 0 # $t1 = input_val

    add $t0 $t0 $t1

    ori $v0, $zero, 4 # syscall-4 for print_string
    lui $a0, 0x1001
    ori $a0, $a0, 0x12 # str2
    syscall

    ori $v0, $zero, 1 # syscall-1 corresponds to print_int
	or $a0, $t0, $zero # print_int expects the integer as its argument
	syscall

    jr $ra
