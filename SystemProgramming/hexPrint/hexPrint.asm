%include "../macros.asm"

; Program to print hex value in AX register
global start

section .text
start:
  mov eax, 0xB008

  call AX2hex

  print mAXContents, mAXContentsLength
  print input, [inputLength]
  print mNewLine, mNewLineLength

  exit 0

; Converts EAX hex number to ascii hex number string in [input] -> [input + [inputLength]]
AX2hex: 
  push ebx                        ; saving BX before overwriting
  push ecx                        ; saving CX before overwriting

  mov ebx, 0x0                    ; count of digits pushed to stack
  mov ecx, 0x0                    ; holds the digit before pushing to stack

  ; converting to ascii
  .loop: mov edx, 0x0
         div word [sixteen]       ; AX = DXAX / 16d, DX = DXAX % 16d
         mov cl, dl               ; CL = DL
         cmp cl, 9d               ; if cl < 9
         jg AX2hex.addA
         add cl, 48d              ; AX % 16d += ascii code for '0'
         jmp AX2hex.pushCX
  .addA: add cl, 55d              ; AX % 16d += ascii code for 'A' - 10
.pushCX: push ecx                 ; push the digit
         inc bl                   ; count of digits in stack
         cmp eax, 0x0             ; loop termination condition
         jne AX2hex.loop

  ; overwrite result over input
  mov ecx, 0
  mov dword [inputLength], ebx
  .loop2: pop dword [input + ecx] ; Take first digit from stack
          inc ecx                 ; increment index pointer
          cmp ecx, ebx
          jl AX2hex.loop2      ; loop termination condition

  pop ecx                         ; restoring CX after using it
  pop ebx                         ; restoring BX after using it
  ret

section .bss
  input resb 100
  inputLength resd 1

section .data
  mAXContents db 'AX = 0x'
  mAXContentsLength equ $ - mAXContents
  
  mNewLine db 0xA
  mNewLineLength equ $ - mNewLine

  sixteen dw 16d
