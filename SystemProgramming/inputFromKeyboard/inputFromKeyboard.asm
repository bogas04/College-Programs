; Assembly program that reads a character from the keyboard and writes the character on the screen.
global start ; making start visible externally

; uninitialized data goes to bss section
section .bss
input resb 2

; initialized data goes to data section
section .data
msg db 'Enter a character and press enter after it: '
msgLen equ $ - msg

; code section
section .text
start:
  call _prompt ; print welcome msg

  ; read (int fileDescriptor, void* buff, size_t count)
  push dword 1        ; 1 character to be read
  push dword input    ; input buffer
  push dword 0        ; file descriptor number for STDIN in 0
  sub esp, 4          ; unix requriement of extra space in stack

  mov eax, 3          ; system call number for read is 3
  int 0x80            ; system call

  add esp, 16         ; clearing stack (4 bytes x 3 args + 4 extra space)

  ; appending input with carriage return
  mov dword [input + 1], 0xA

  ; write (int fileDescriptor, void* buff, size_t count)
  push dword 2        ; 2 character to be printed
  push dword input    ; write the input
  push dword 1        ; file descriptor number for STDOUT is 1
  sub esp, 4          ; unix requirement of extra space in stack 

  mov eax, 4          ; system call number for write is 4
  int 0x80            ; system call

  add esp, 16         ; clearing stack (4 bytes x 3 args + 4 extra space)

  ; exit (int statusCode)
  push dword 0        ; exit status code
  sub esp, 4          ; unix requirement of extra space in stack

  mov eax, 1          ; system call number for exit is 1
  int 0x80            ; system call

  ; Prints welcome messsage of the program
  _prompt: 
    ; write (int fileDescriptor, void* buff, size_t count)
    push dword msgLen ; length of message
    push dword msg    ; address of message
    push dword 1      ; STDOUT
    sub esp, 4        ; unix requirement of extra space in stack

    mov eax, 4        ; system call number for write is 4
    int 0x80          ; system call

    add esp, 16       ; clearing stack (4 bytes x 3 args + 4 extra space)
    ret
