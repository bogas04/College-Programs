System Programming Lab
==
NASM is used for all programs.

Makefile format
==
```makefile
FILE=programName
all: $(FILE) 

$(FILE): $(FILE).o
	ld -o $(FILE) -e start $(FILE).o

$(FILE).o:
	nasm -f macho $(FILE).asm
``` 

Programs
==

  1. [x] Write an assembly program that reads a character from the keyboard and writes the character on the screen.

  2. [x] Write an assembly program to read a string of characters and print the reverse of this string.

  3. [x] Write an assembly program that compares two strings of characters.

  4. [x] Write an assembly program that checks whether a string is a palindrome or not.

  5. [x] Write an assembly program to find the sum of first n natural numbers.

  6. [x] Write an assembly program to add B numbers and print their sum.

  7. [x] Write an assembly program that sorts N numbers (Bubble Sort).

  8. [x] Write an assembly program makes cursor size bigger

  9. [~] Write an assembly program that saves 4 digit hex number input from keyboard to memory location TEMP.

  10. [x] Write an assembly program that displays the hex number stored in AX register.
