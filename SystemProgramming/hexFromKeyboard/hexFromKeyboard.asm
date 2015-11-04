%include "../macros.asm"

global start
; Program to take 4 digit hex input from keyboard and save it in [temp]

section .text
start: 
  print mInput, mInputLength
  read input, 100
  dec eax
  mov dword [inputLength], eax

  call hex2AX

  mov dword [temp], eax
  mov eax, dword [temp]

  call AX2hex

  print mTempContents, mTempContentsLength 
  print input, [inputLength]
  print mNewLine, mNewLineLength 

  exit 0


; Converts ascii hex number string [input] -> [input + inputLength] to hex number in EAX
hex2AX: 
  push ebx                          ; saving BX before overwriting
  push ecx                          ; saving CX before overwriting
  push edx                          ; saving DX before overwriting

  mov eax, 0x0                      ; stores final number
  mov ebx, 0x0
  mov ecx, 0x0                      ; our index variable
  mov edx, dword [inputLength]      ; DX =
  dec edx                           ;      length - 1

  .loop: mul byte [sixteen]         ; AX = AX * 16d 
         mov bl, byte [input + ecx] ; bl = ascii digit
         cmp bl, 64d                ; if bl < 'A'

         jge hex2AX.sub55
           sub bl, 48d              ;   bl = digit (0 - 9)
           jmp hex2AX.addBX

  .sub55 sub bl, 55d                ; else bl = digit (10 -15)
  .addBX add eax, ebx               ; AX = AX + digit

         inc ecx                    ; set index pointer to next digit
         cmp ecx, edx               ; if index pointer points to last digit
         jle hex2AX.loop            ; loop if CX <= DX 

  pop edx                           ; restoring DX after using it
  pop ecx                           ; restoring CX after using it
  pop ebx                           ; restoring BX after using it
  ret

; Converts EAX hex number to ascii hex number string in [input] -> [input + [inputLength]]
AX2hex: 
  push ebx                          ; saving BX before overwriting
  push ecx                          ; saving CX before overwriting

  mov ebx, 0x0                      ; count of digits pushed to stack
  mov ecx, 0x0                      ; holds the digit before pushing to stack

  ; converting to ascii
  .loop: mov edx, 0x0
         div word [sixteen]         ; AX = DXAX / 16d, DX = DXAX % 16d
         mov cl, dl                 ; CL = DL
         cmp cl, 9d                 ; if cl < 9
         jg AX2hex.addA
         add cl, 48d                ; AX % 16d += ascii code for '0'
         jmp AX2hex.pushCX
  .addA: add cl, 55d                ; AX % 16d += ascii code for 'A' - 10
.pushCX: push ecx                   ; push the digit
         inc bl                     ; count of digits in stack
         cmp eax, 0x0               ; loop termination condition
         jne AX2hex.loop

  ; overwrite result over input
  mov ecx, 0
  mov dword [inputLength], ebx
  .loop2: pop dword [input + ecx]   ; Take first digit from stack
          inc ecx                   ; increment index pointer
          cmp ecx, ebx
          jl AX2hex.loop2           ; loop termination condition

  pop ecx                           ; restoring CX after using it
  pop ebx                           ; restoring BX after using it
  ret

section .bss
  temp resd 1
  input resb 100
  inputLength resd 1

section .data
  mInput db 'Enter a 4 digit hex number: 0x'
  mInputLength equ $ - mInput

  mTempContents db '[temp] = 0x'
  mTempContentsLength equ $ - mTempContents

  mNewLine db 0xA
  mNewLineLength equ $ - mNewLine

  sixteen dw 16d
  ten dw 10d
