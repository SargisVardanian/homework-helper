.section .bss

.comm input, 1

.section .text
.globl _start

_start:

read:
	mov $0, %rax
	mov $0, %rdi
	mov $input, %rsi
	mov $1, %rdx
	syscall

	cmp $0, %rax
	je exit
	
write:
	mov $1, %rax
	mov $1, %rdi
	mov $input, %rsi
	mov $1, %rdx
	syscall

	jmp read


exit: 	
	mov $0, %rdi
	mov $60, %rax
	syscall
