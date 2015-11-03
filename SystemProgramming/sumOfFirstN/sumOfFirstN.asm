%include "../macros.asm"

; Program to print sum of first N natural numbers
global start

section .text
start: 
  ; Taking input
  print mEnterN, mEnterNLength
  read input, 100

    ; for < 4
    ;mov bl, byte [input]
    ;sub bl, 0x30
    ;mov al, bl              ; n
    ;inc al                  ; n + 1
    ;mul bl                  ; n*(n + 1)
    ;shr eax, 1              ; n*(n + 1)/2
    ;add eax, 0x30
    ;mov dword [temp], eax
    ;print mSum, mSumLength
    ;print temp, 1
    ;print mNewLine, mNewLineLength

  ; for generic cases (ascii -> num && compute && num -> ascii)
  dec eax                    ; ignoring 0xA from length
  mov dword [inputLength], eax

  ; Converting string of digits to hex number
  call ascii2num           ; saves number in eax from hex string in input
  
  ; Computing sum
  mov ebx, eax             ; n in BX
  inc ebx                  ; n + 1 in BX
  mul ebx                  ; n*(n + 1) in DX AX
  shr eax, 1               ; n*(n + 1)/2 in AX
  
  ; Converting sum to ascii string of digits
  call num2ascii           ; saves printable hex string in temp

  ; Printing sum
  print mSum, mSumLength
  print temp, 5            ; for now hardcoded to length of 5
  print mNewLine, mNewLineLength

  exit 0

ascii2num: mov eax, 0                        ; stores final number
           mov ecx, 0                        ; our index variable
           mov edx, dword [inputLength]      ; DX =
           sub edx, 2                        ;     length - 1
           mov bh, 0x0
           .loop: mul byte [ten]             ; AX = AX * 10d
                  mov bl, byte [input + ecx] ; bl = ascii digit
                  sub bl, 0x30               ; bl = digit
                  add eax, ebx               ; AX = AX + digit
                  inc ecx                    ; ecx++
                  cmp ecx, edx
                  jle ascii2num.loop         ; loop if ecx <= DX 
          ; eax has the number
          ret

num2ascii: nop
           
           eax ;0000 0000 0000 0000   0000 0000 1000 1000 
           1     3     6
           0x31 0x33 0x36
           '1'   '3'   '6'
           mov ebx, eax
           and ebx, 0xF000 
           mov ecx, 0xC
           shr ebx, cl
           
            
           and eax, 0xF000 
           ret

section .bss
  ;N     resd 1
  inputLength resd 1 
  input resb 100
  temp resd 1

section .data
  mEnterN db 'Enter a natural number N: '
  mEnterNLength equ $ - mEnterN

  mSum db 'Sum of first N natural numbers is: '
  mSumLength equ $ - mSum
  
  mNewLine db 0xA
  mNewLineLength equ $ - mNewLine
  
  ten db 0xA
