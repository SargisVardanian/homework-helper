.section .bss
.comm   input, 1

.section .text
.globl  _start

_start:
        xor     %r8d, %r8d

read_loop:
        mov     $0, %rax
        mov     $0, %rdi
        mov     $input, %rsi
        mov     $1, %rdx
        syscall

        cmp     $0, %rax
        je      eof

        movzbl  input(%rip), %ebx
        cmpb    $'A', %bl
        jb      check_lower
        cmpb    $'Z', %bl
        jbe     is_letter

check_lower:
        cmpb    $'a', %bl
        jb      not_letter
        cmpb    $'z', %bl
        jbe     is_letter

not_letter:
        test    %r8b, %r8b
        jz      read_loop
        movb    $10, input(%rip)
        mov     $1, %rax
        mov     $1, %rdi
        mov     $input, %rsi
        mov     $1, %rdx
        syscall
        xor     %r8d, %r8d
        jmp     read_loop

is_letter:
        mov     $1, %rax
        mov     $1, %rdi
        mov     $input, %rsi
        mov     $1, %rdx
        syscall
        mov     $1, %r8b
        jmp     read_loop

eof:
        test    %r8b, %r8b
        jz      exit
        movb    $10, input(%rip)
        mov     $1, %rax
        mov     $1, %rdi
        mov     $input, %rsi
        mov     $1, %rdx
        syscall

exit:
        mov     $60, %rax
        xor     %rdi, %rdi
        syscall

