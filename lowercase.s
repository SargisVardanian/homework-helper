.section .bss
.comm   input, 1

.section .text
.globl  _start

_start:
read_loop:
        mov     $0, %rax
        mov     $0, %rdi
        mov     $input, %rsi
        mov     $1, %rdx
        syscall

        cmp     $0, %rax
        je      exit

        movzbl  input(%rip), %ebx
        cmpb    $'A', %bl
        jb      write_out
        cmpb    $'Z', %bl
        ja      write_out
        addb    $32, %bl
        movb    %bl, input(%rip)

write_out:
        mov     $1, %rax
        mov     $1, %rdi
        mov     $input, %rsi
        mov     $1, %rdx
        syscall
        jmp     read_loop

exit:
        mov     $60, %rax
        xor     %rdi, %rdi
        syscall
