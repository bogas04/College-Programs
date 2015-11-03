%include "../macros.asm" ; contains print, read and exit macros

; Assembly program that reverses given string
global start ; making start visible externally

section .text
start:
  ; Reading string
  print mEnterString, mEnterStringLength
  read input, 100
  mov dword [inputLength], eax

  ; Reversing
  mov ecx, 0
  mov edx, dword [inputLength]
  sub edx, 2                                ; ignoring 0xA from string and fixing 0 indexing 
  mov eax, edx                              ; copy of last index

  ; Traversing input from behind and saving it to reversedInput in forward directon
  loop: mov bl, byte [input + edx]          ; copy last of input to bl
        mov byte [reversedInput + ecx], bl  ; copy bl to first of reversedInput
        inc ecx                             ; increment first of reversedInput
        dec edx                             ; decrement last of input
        cmp ecx, eax                        ; compare first of reversedInput to length of input - 1
        jle loop                            ; if not equal, continue

  ; Print result
  print mReversedString, mReversedStringLength
  print reversedInput, dword [inputLength]
  print mNewLine, mNewLineLength
  
  exit 0

section .bss
  input         resb 100
  reversedInput resb 100
  inputLength   resd 1

section .data
  mEnterString db 'Enter a string: '
  mEnterStringLength equ $ - mEnterString

  mReversedString db 'Reversed string: '
  mReversedStringLength equ $ - mReversedString

  mNewLine db 0xA
  mNewLineLength equ $ - mNewLine
