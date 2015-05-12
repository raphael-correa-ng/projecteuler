#------------------------------------------------------------------------------
# PROJECT EULER
# PROBLEM 2
#------------------------------------------------------------------------------
# Each new term in the Fibonacci sequence is generated by adding the previous 
# two terms. 
# By starting with 1 and 2, the first 10 terms will be:
#
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
#
# By considering the terms in the Fibonacci sequence whose values do not exceed 
# four million, 
# find the sum of the even-valued terms.
#------------------------------------------------------------------------------
# SOLUTION: 4613732
#------------------------------------------------------------------------------
# as -32 2.s -o 2.o
# gcc -m32 2.o -o 2
#------------------------------------------------------------------------------

dec32_format:
    .string "%d\n"

.section .text
.globl main

main:
	pushl	$4000000
	call	find_sum
	pushl	%eax
	call	print32

#------------------------------------------------------------------------------
main_exit:
	xor		%eax, %eax
	incl	%eax
	xor		%ebx, %ebx
	incl	%ebx
	int 	$0x80

#------------------------------------------------------------------------------
.type print32, @ function

print32:
	pushl	4(%esp)
	pushl	$dec32_format
	call	printf
	addl	$8, %esp
	ret		

#------------------------------------------------------------------------------
.type find_sum, @ function

find_sum:
	movl	4(%esp), %edi
	xor		%eax, %eax
	xor		%ebx, %ebx
	xor		%ecx, %ecx
	xor		%edx, %edx
	incl	%edx

find_sum_loop:
	movl	%ecx, %ebx
	movl	%edx, %ecx
	addl	%ebx, %edx
	cmpl	%edi, %edx
	ja		find_sum_exit
	pushl	%edx
	and		$1, %edx
	popl	%edx
	jne		find_sum_loop
	addl	%edx, %eax
	call	find_sum_loop

find_sum_exit:
	addl	$4, %esp
	ret
