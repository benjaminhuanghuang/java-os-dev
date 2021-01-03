default :
	make foobar

foo.o : foo.asm Makefile
	nasm foo.asm -f elf32 -o foo.o

bar.o : bar.c Makefile
	gcc -m32 -c -o bar.o bar.c

foobar : foo.o bar.o Makefile
	ld -m elf32 -o foobar foo.o bar.o