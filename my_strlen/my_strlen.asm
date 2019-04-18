global my_strlen

section .text
    my_strlen:
        sub rcx, rcx    ;rcx egal 0
        not rcx         ;We reverse the bits
        push rdi        ;push rdi on the stack
        mov al, 0x0     ;move 0x0 to al
        repne scasb     ;Research for each byte
        pop rsi         ;pop on the stack
        sub rdi, rsi    ;Substraction of rdi and rsi

        dec rdi         ;Decrease for pop the \0
        mov rax, rdi    ;Move rdi to rax
        ret             ;Return rax
