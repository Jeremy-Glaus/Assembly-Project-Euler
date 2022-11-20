all: problem1 problem2 clean

problem1: problem1.o
	ld -o problem1 problem1.o

problem1.o: problem1.asm
	nasm -f elf64 -g -F dwarf problem1.asm -l problem1.lst

problem2: problem2.o
	ld -o problem2 problem2.o

problem2.o: problem2.asm
	nasm -f elf64 -g -F dwarf problem2.asm -l problem2.lst

clean:
	rm -f problem1.o problem1.lst
	rm -f problem2.o problem2.lst