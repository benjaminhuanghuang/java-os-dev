#
# Link obj files to elf
#
default :
	make foobar.exe

foo.o : foo.asm Makefile
	nasm foo.asm -f elf32 -o foo.o

bar.o : bar.c Makefile
	gcc -m32 -c -o bar.o bar.c

foobar.exe : foo.o bar.o Makefile
	ld -m elf_i386 -o foobar.exe foo.o bar.o

clean:
	rm *.o
	rm *.exe