default :
	make run

HelloOS : HelloOS.java Makefile
	javac HelloOS.java


os.o : os.c Makefile
	gcc -m32 -fno-asynchronous-unwind-tables -c -o os.o os.c

os1.asm : os.o Makefile
	../objconv -fnasm os.o os1.asm

# remove the SECTION, global, extern... 
os.asm : os1.asm Makefile
	cat os1.asm | sed -e '/^SECTION/d' | sed -e '/^global/d' | sed -e '/^extern/d' > os.asm

%.bin : %.asm Makefile
	nasm $*.asm -f bin -o $*.bin

kernel.bin : kernel.asm os.asm Makefile
	nasm kernel.asm -f bin -o kernel.bin

myos.img : HelloOS boot.bin kernel.bin Makefile
	java HelloOS

run :
	make myos.img
	qemu-system-i386 -fda myos.img -boot a

clean:
	rm *.class
	rm *.img
	rm os1.asm
	rm os.asm
