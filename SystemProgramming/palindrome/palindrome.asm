%include "../macros.asm" ; macros.asm contains print, read and exit macros

; Assembly program that tells whether given string is a palindrome or not
global start ; making start visible externally

; code section
section .text
start:
  ; reading string
  print mEnterString, mEnterStringLength
  read input, 100d
  mov dword [inputLength], eax

  ; printing the string
  print mYouEntered, mYouEnteredLength
  print input, dword [inputLength]

  mov eax, -1                             ; -1 index
  mov ebx, dword [inputLength]
  sub ebx, 1                              ; n index

  loop: inc eax                           ; increment start index
        dec ebx                           ; decrement end index
        cmp eax, ebx                      ; compare them
        jge printP                        ; if greater than or equal, string is palindrome
        mov dl, byte [input + eax]        ; else, save input[eax] to dl
        mov dh, byte [input + ebx]        ;       save input[ebx] to dh
        cmp dl, dh                        ;       compare dl and dh
        jne printNP                       ;       if not equal, string isn't palindrome
        je loop                           ;       else, continue

  end: exit 0

  ; print that the string is not a palindrome
  printNP:
    print mIsNotPalindrome, mIsNotPalindromeLength
    jmp end

  ; print that the string is a palindrome
  printP:
    print mIsPalindrome, mIsPalindromeLength
    jmp end

section .bss
  input resb 100d
  inputLength resd 1

section .data
  newLine db 0xA
  mYouEntered db 'You Entered : '
  mYouEnteredLength equ $ - mYouEntered

  mIsNotPalindrome db 'Given string is not a palindrome', 0xA
  mIsNotPalindromeLength equ $ - mIsNotPalindrome

  mIsPalindrome db 'Given string is a palindrome', 0xA
  mIsPalindromeLength equ $ - mIsPalindrome

  mEnterString db 'Enter a String: '
  mEnterStringLength equ $ - mEnterString
