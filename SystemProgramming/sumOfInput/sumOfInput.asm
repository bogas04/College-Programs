%include "../macros.asm"

; Program to print sum of N
global start

section .text
start: 
  ; Taking input N
  print mEnterN, mEnterNLength
  read input, 100
  dec eax                  ; ignoring 0xA from length
  mov dword [inputLength], eax
  call dec2AX

  mov ecx, eax             ; count of numbers to process
  mov ebx, 0               ; sum of these numbers 

  ; Inputting N numbers
  .loop: print mEnterNext, mEnterNextLength

         ; Taking ith number 
           read input, 100
           dec eax
           mov dword [inputLength], eax

         call dec2AX    ; Getting ith number in AX

         add ebx, eax      ; Adding to the sum
         dec ecx           ; decrementing numbers to be read
         jnz start.loop    ; loop termination condition

  mov eax, ebx             ; saving result in AX
  call AX2dec           ; getting result in input

  ; Printing result
  print mSum, mSumLength 
  print input, [inputLength] 
  print mNewLine, mNewLineLength

  exit 0

; Converts ascii decimal number string [input] -> [input + inputLength] to hex number in EAX
dec2AX: 
  push ebx                          ; saving BX before overwriting
  push ecx                          ; saving CX before overwriting
  push edx                          ; saving DX before overwriting

  mov eax, 0                        ; stores final number
  mov ebx, 0
  mov ecx, 0                        ; our index variable
  mov edx, dword [inputLength]      ; DX =
  dec edx                           ;      length - 1

  .loop: mul byte [ten]             ; AX = AX * 10d
         mov bl, byte [input + ecx] ; bl = ascii digit
         sub bl, 0x30               ; bl = digit
         add eax, ebx               ; AX = AX + digit
         inc ecx                    ; set index pointer to next digit
         cmp ecx, edx               ; if index pointer points to last digit
         jle dec2AX.loop         ; loop if CX <= DX 

  pop edx                           ; restoring DX after using it
  pop ecx                           ; restoring CX after using it
  pop ebx                           ; restoring BX after using it
  ret

; Converts EAX hex number to ascii decimal number string in [input] -> [input + inputLength]
AX2dec: 
  push ebx                        ; saving BX before overwriting
  push ecx                        ; saving CX before overwriting

  mov ebx, 0x0                    ; count of digits pushed to stack
  mov ecx, 0x0                    ; holds the digit before pushing to stack

  ; converting to ascii
  .loop: mov edx, 0
         div word [ten]           ; AX = DXAX/10, DX = DXAX%10
         mov cl, dl               ; CL = DL
         add cl, 0x30             ; AX%10 += ascii code for '0'
         push ecx                 ; push the digit
         inc bl                   ; count of digits in stack
         cmp eax, 0x0             ; loop termination condition
         jne AX2dec.loop 

  ; overwrite result over input
  mov ecx, 0
  mov dword [inputLength], ebx
  .loop2: pop dword [input + ecx] ; Take first digit from stack
          inc ecx                 ; increment index pointer
          cmp ecx, ebx
          jl AX2dec.loop2      ; loop termination condition

  pop ecx                         ; restoring CX after using it
  pop ebx                         ; restoring BX after using it
  ret

section .bss
  inputLength resd 1 
  input resb 100
  temp resd 1

section .data
  mEnterN db 'Enter a number N: '
  mEnterNLength equ $ - mEnterN

  mEnterNext db 'Enter next positive number: '
  mEnterNextLength equ $ - mEnterNext

  mSum db 'Sum of above N numbers is: '
  mSumLength equ $ - mSum
  
  mNewLine db 0xA
  mNewLineLength equ $ - mNewLine
  
  ten db 0xA
