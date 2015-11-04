%include "../macros.asm"

global start

section .text
start:
  print mUnsortedArray, mUnsortedArrayLength
  call printArray
  call bubbleSort
  print mSortedArray, mSortedArrayLength
  call printArray
  exit 0

bubbleSort: 
  mov edx, dword [arrayLength]  ; DX contains length
  ; for( i = 0; i < length; i++ )
  mov eax, 0                    ; AX is i
  .outer cmp eax, edx
  jge bubbleSort.end
    ; for ( j = 1; j < length; j++ )
    mov ebx, 1                  ; BX is j
    .inner: cmp ebx, edx
    jge bubbleSort.outEnd
      mov ch, byte [array + ebx - 1d]
      mov cl, byte [array + ebx]
      ; if array[j - 1] > array[j]
      cmp ch, cl
      jle bubbleSort.inEnd
        ; swap a[j - 1] & a[j]
        mov byte [array + ebx], ch
        mov byte [array + ebx - 1], cl
      ; end of if
    ; end of inner loop
    .inEnd: inc ebx
    jmp bubbleSort.inner
  ; end of outer loop
  .outEnd: inc eax
  jmp bubbleSort.outer
.end ret

printArray: 
  mov eax, 0                    ; count of numbers seen yet
  mov edx, 0                    ; count of numbers seen yet * 2
  mov ecx, dword [arrayLength]
  .loop: nop
         mov bl, byte [array + eax]
         add bl, 0x30
         mov byte [output + edx], bl
         mov byte [output + edx + 1], 32d
         add edx, 2
         inc eax
         cmp eax, ecx
         jl printArray.loop

  print output, edx
  print mNewLine, mNewLineLength
  ret

section .bss
  output resb 100

section .data
  ;array db 1, 2, 5, 6, 1, 2, 9, 7
  ;array db 9, 1, 6, 2, 3, 5, 2, 6
  array db 9, 8, 7, 6, 5, 3, 2, 1
  arrayLength dd 8d

  mNewLine db 0xA
  mNewLineLength equ $ - mNewLine

  mSortedArray db 'Sorted Array:   '
  mSortedArrayLength equ $ - mSortedArray

  mUnsortedArray db 'Unsorted Array: '
  mUnsortedArrayLength equ $ - mUnsortedArray
