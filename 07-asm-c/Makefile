#
# covert obj file to asm file
#
default :
	make foobar.exe

bar.o : bar.c Makefile
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o bar.o bar.c

bar.asm: bar.o Makefile
	../objconv -fnasm bar.o -o bar.asm

foo.o : foo.asm Makefile
	nasm foo.asm -f elf32 -o foo.o

foobar.exe : foo.o bar.o Makefile
	gcc -m32 foo.o -o foobar.exe