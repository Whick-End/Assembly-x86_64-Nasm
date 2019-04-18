; In this program we print all the printable character of the ascii table
; to try the table and the system
;In nasm 64 bits

section .bss
   newLine resb 1

section .data
   char db 32d          ;char egal 32, because the printable characters are from 32 to 126

section	.text
   global _start
	
_start:
   call _nextChar       ;call the function _nextChar
   mov [newLine], rax   ;mov rax in the newLine
   mov rax, 1           ;sys_write
   mov rdi, 1           ;output
   mov rsi, newLine     ;Print newLine
   mov rdx, 1           ;The size is 1 byte
   syscall              ;call kernel

   mov rax, 60          ;sys_exit
   mov rdi, 0           ;return 0
   syscall              ;call kernel
		
_nextChar:
   mov rbx, [char]      ;mov value of char in rbx
   inc rbx              ;Incremente rbx, for change character
   mov [char], rbx      ;mov new ascii character to char

   mov rax, 1           ;sys_write
   mov rdi, 1           ;output
   mov rsi, char        ;print char
   mov rdx, 1           ;The size is 1 byte
   syscall

   cmp rbx, 126         ;Compare rbx to 126
   jle _nextChar        ;If less or egal go to _nextChar
   mov rax, 0xA         ;Return 0xA to create a new line at the end
   
   ret	               ;return
