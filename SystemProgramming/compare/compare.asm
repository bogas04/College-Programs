%include "../macros.asm"
; Assembly program that compares 2 given strings
global start ; making start visible externally

section .text
start:
  ; reading first string
  print outStr1, outStr1L
  read str1, 100d
  mov dword [str1L], eax

  ; reading second string
  print outStr2, outStr2L
  read str2, 100d
  mov dword [str2L], eax

  ; printing the strings
  print outS1, outS1L
  print str1, dword [str1L]
  print outS2, outS2L
  print str2, dword [str2L]

  ; comparing length
  mov eax, dword [str1L]
  cmp dword [str2L], eax
  jne printLNE

  ; comparing each character
  mov edx, -1
  _loop: inc edx
         cmp edx, dword [str1L]
         jg printE
         mov ebx, dword [str1 + edx]
         cmp ebx, dword [str2 + edx]
         je _loop
         jne printNE

  end: exit 0

  ; print that the two strings are not equal in length
  printLNE:
    print outLNE, outLNEL
    jmp end

  ; print that the two strings are not equal
  printNE:
    print outNE, outNEL
    jmp end

  ; print that the two strings are equal
  printE:
    print outE, outEL
    jmp end

section .bss
  str1 resb 100d
  str2 resb 100d
  str1L resd 1
  str2L resd 1

section .data
  outS1 db 'String 1 : '
  outS1L equ $ - outS1

  outS2 db 'String 2 : '
  outS2L equ $ - outS2

  outLNE db 'Length of given strings not equal', 0xA
  outLNEL equ $ - outLNE

  outNE db 'Given strings are not equal', 0xA
  outNEL equ $ - outNE

  outE db 'Given strings are equal', 0xA
  outEL equ $ - outE

  outStr1 db 'Enter String 1: '
  outStr1L equ $ - outStr1

  outStr2 db 'Enter String 2: '
  outStr2L equ $ - outStr2
