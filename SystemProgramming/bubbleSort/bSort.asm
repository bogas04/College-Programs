section .bss
  digit0: resb 1
  digit1: resb 1
  array:  resb 50
  element: resb 1
  num: resb 1
  pos: resb 1
  temp: resb 1
  temp2: resb 1
  temp3: resb 1
  i: resb 1
  j: resb 1


section .data

msg1: db "Enter the number of numbers : "
size1: equ $-msg1
msg2: db "Enter a number:"
size2: equ $-msg2
msg3: db "Sorted Array : "
size3: equ $-msg3
msg_found: db "Element found at position : "
size_found: equ $-msg_found
msg_not: db "Element not found"
size_not: equ $-msg_not
comma: db ","

section .text
  global start

start:
  


;Printing the message to enter the number
  mov eax, 4
  mov ebx, 1
  mov ecx, msg1
  mov edx, size1
  int 80h
  
  ;Reading the number
  mov eax, 3
  mov ebx, 0
  mov ecx, digit1
  mov edx, 1
  int 80h

  mov eax, 3
  mov ebx, 0
  mov ecx, digit0
  mov edx, 1
  int 80h

  mov eax, 3
  mov ebx, 0
  mov ecx, temp
  mov edx, 1
  int 80h

  sub byte[digit1], 30h
  sub byte[digit0], 30h  

  mov al, byte[digit1]
  mov dl, 10
  mul dl
  mov byte[num], al
  mov al, byte[digit0]
  add byte[num], al
  mov al, byte[num]

  mov byte[temp], al
  mov byte[temp2], al
  mov ebx, array
  

reading:
  
  push ebx

  ;Printing the message to enter the numbers
  mov eax, 4
  mov ebx, 1
  mov ecx, msg2
  mov edx, size2
  int 80h
  
  ;Reading the number
  mov eax, 3
  mov ebx, 0
  mov ecx, digit1
  mov edx, 1
  int 80h

  mov eax, 3
  mov ebx, 0
  mov ecx, digit0
  mov edx, 1
  int 80h

  mov eax, 3
  mov ebx, 0
  mov ecx, temp3
  mov edx, 1
  int 80h


  sub byte[digit1], 30h
  sub byte[digit0], 30h  
  mov al, byte[digit1]
  mov dl, 10
  mul dl
  add al, byte[digit0]

  ;al now contains the number
  pop ebx

  mov byte[ebx], al

  add ebx, 1

  dec byte[temp]
  cmp byte[temp], 0

jg reading

  
  
  movzx ecx, byte[num]

  mov ebx, array

  mov byte[i], 0

i_loop:
  mov byte[j], 0
  j_loop:
    mov ebx, array
    movzx eax, byte[j]
    add ebx, eax
    mov eax, ebx
    add eax, 1
    mov dl, byte[ebx]
    mov dh, byte[eax]
    cmp dh, dl
    jl swap
    jmp no_swap
  
    swap:
      mov byte[ebx], dh
      mov byte[eax], dl

no_swap:
    inc byte[j]
    mov al, byte[num]
    sub al, byte[i]
    sub al, 1
    cmp byte[j], al
    jl j_loop

  inc byte[i]
  mov al, byte[num]
  cmp byte[i], al
jl i_loop


;Printing the sorted array....
;To beedited

  mov eax, 4
  mov ebx, 1
  mov ecx, msg3
  mov edx, size3
  int 80h


  mov ebx, array

printing:
  
  push ebx
  mov al, byte[ebx]
  mov byte[pos], al

  movzx ax, byte[pos]
  mov bl, 10
  div bl
  mov byte[digit1], al
  mov byte[digit0], ah

  add byte[digit0], 30h
  add byte[digit1], 30h

  mov eax, 4
  mov ebx, 1
  mov ecx, digit1
  mov edx, 1
  int 80h

  mov eax, 4
  mov ebx, 1
  mov ecx, digit0
  mov edx, 1
  int 80h

  mov eax, 4
  mov ebx, 1
  mov ecx, comma
  mov edx, 1
  int 80h




  ;al now contains the number
  pop ebx

  add ebx, 1

  dec byte[temp2]
  cmp byte[temp2], 0

jg printing




  
exit:
  mov eax, 1
  mov ebx, 0
  int 80h
