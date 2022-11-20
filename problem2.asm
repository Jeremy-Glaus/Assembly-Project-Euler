; How it works:
; Calculates Fibonacci
; check if it exeeds 4 million
; check if even
; if true, add to sum

; Registers
; rdx number 1
; rbp number 2
; rsp sum
; rdi temporary sum for checking 

section .bss

section .data

section .text

global _start

_start:
    mov rax, 1
    mov rbp, 1
    xor rsp, rsp        ;resets rsp

calculate:
    ;new values
    mov rax, rbp        ; old number to rax
    mov rbp, rdi        ; new fibonacci to rbp

    ;calculate fibonacci
    xor rdi, rdi        ;clear rdx (temporary register)
    mov rdi, rax        ;mov first number of sequence to rdx
    add rdi, rbp        ;add second number of sequence. result in rdx

    ;check if sum is even
    test rdi, 1         ;test rdx for first bit. if set, number is even
    jnz calculate       ;restart calculation if number is odd

    ;check if it exeeds 4million
    cmp rdi, 4000000     ;compare rdi with 4 million
    jge exit             ;jump to exit if greater or equal 4 million

    ;saving the sum
    add rsp, rdi        ;saves new sum to rsp
    jmp calculate       ;start again

exit: 
    mov rax, 60         ; code for sys_exit
    mov rdi, 0          ; returning 0 in sys_exit
    syscall     