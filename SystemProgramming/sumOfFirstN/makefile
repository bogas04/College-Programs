FILE=sumOfFirstN
all: $(FILE) 

$(FILE): $(FILE).o
	ld -o $(FILE) -e start $(FILE).o

$(FILE).o:
	nasm -f macho $(FILE).asm
