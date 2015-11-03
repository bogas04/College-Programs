; Usage: print <stringPtrName> <length>
%macro print 2
  ; write (int fileDescriptor, void* buff, size_t count)
  push dword %2       ; length of input
  push dword %1       ; pointer to the input
  push dword 1        ; file descriptor number for STDOUT is 1
  sub esp, 4          ; unix requirement of extra space in stack 
  mov eax, 4          ; system call number for write is 4
  int 0x80            ; system call
  add esp, 16         ; clearing stack (4 bytes x 3 args + 4 extra space)
%endmacro

; Usage: read <stringPtrName> <length>
%macro read 2
  ; read (int fileDescriptor, void* buff, size_t count)
  push dword %2       ; size of input buffer
  push dword %1       ; pointer to input buffer
  push dword 0        ; file descriptor number for STDIN in 0
  sub esp, 4          ; unix requriement of extra space in stack
  mov eax, 3          ; system call number for read is 3
  int 0x80            ; system call
%endmacro

; Usage:  exit <statusCode>
%macro exit 1
  ; exit (int statusCode)
  push dword %1    ; exit status code
  sub esp, 4      ; unix requirement of extra space in stack
  mov eax, 1      ; system call number for exit is 1
  int 0x80        ; system call
%endmacro

