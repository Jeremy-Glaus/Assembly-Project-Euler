; How it works:
; - Iterates trough all numbers from 0 to 1000
; - Checks if the current number is a multiple of 3 or 5
; - If true, add number to eax
; - Print the sum
; - Exit Program returning 0

; Registers
; r10 is used for the sum
; r8 is used to do the loop

SECTION .data
SECTION .bss
    OutStrLeng:  EQU 8 
    OutStr:      resb OutStrLeng
SECTION .text

global _start

_start:
    ;setup data
    mov r8, 0           ; will be used for the loop
    mov r10, 0          ; contains the sum

    ;performing loop
loop:
    call check_number   ; calls check_number to check the current number in loop
    inc r8              ; increment current number by 1
    cmp r8, 1000        ; Prüft, ob r8 bereits bei 1000 ist
    jne loop            ; Jumps to loop-section if max iterations are not reached

    push r10
    ;mov r10, ecx

    mov qword [OutStr], r10
    ;sys_write sum
    mov rax, 1          ; code for sys_write
    mov rdi, 1          ; stdout
    mov rsi, [rsp]     ; buffer
    mov rdx, 8 ; buffer length                
    syscall

    ;sys_exit
    mov rax, 60         ; code for sys_exit
    mov rdi, 0          ; returning 0 in sys_exit
    syscall             

check_number:
    ;set up division
    mov rax, r8         ; number to be divided
    mov rdx, 0          ; i don't know what this does

    ;check if current number (r8) is a multiple of 3
    mov rbx, 3          ; number to divide number in eax
    div rbx             ; divide. rdx contains remainder, rax contains quotient
    cmp rdx, 0          ; compare remainder with 0. if true, number is multiple of 3
    je add_number

    ;check if current number (r8) is a multiple of 5
    mov rbx, 5          ; number to divide number in eax
    div rbx             ; divide. edx contains remainder, eax contains quotient
    cmp rdx, 0          ; compare remainder with 0. if true, number is multiple of 5
    je add_number
    ret
    
add_number:
    add r10, r8         ; adds the current number to existing sum
    ret