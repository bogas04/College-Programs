.model small
.data      
    newline     db 13, 10, '$'
    anykey      db "Press [Enter] to exit...$"

.stack 256

.code
start:
    mov ax, @data
    mov ds, ax
    mov es, ax
    mov ax, @stack
    mov ss, ax    
    
    mov ch, 0
    mov cl, 7
    mov ah, 1
    int 10h      
    
    call exit_program
    
print_newline:
    lea dx, newline
    mov ah, 09h
    int 21h   
    ret    

exit_program:
    call print_newline
    
    lea dx, anykey
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h

    ; exit to operating system.
    mov ah, 4ch
    int 21h 

end start
