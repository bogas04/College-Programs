global start                ; make the main function externally visible

section .data

mymsg db "hello, world", 0xa  ; string with a carriage-return
mylen equ $-mymsg             ; string length in bytes

section .text

start:

; Setting arguments of write(int fileDescriptor, const void* buff, size_t count);
push dword mylen          ; count
push dword mymsg          ; buff 
push dword 1              ; fileDescriptor number for STDOUT is 1

; write System Call
mov eax, 0x4              ; system call number for write is 4
sub esp, 4                ; OS X (and BSD) system calls needs "extra space" on stack
int 0x80                  ; interrupt for system call

; Cleaning stack
add esp, 16               ; 3 args * 4 bytes/arg + 4 bytes extra space = 16 bytes

; exit System Call
push dword 0 ; Setting status code as 0
mov eax, 0x1              ; system call number for exit is 1
sub esp, 4                ; OS X (and BSD) system calls needs "extra space" on stack
int 0x80                  ; interrupt for system call
