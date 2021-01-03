default :
	make run

HelloOS : HelloOS.java Makefile
	javac HelloOS.java


write_vga.o : write_vga.c Makefile
	gcc -m32 -fno-asynchronous-unwind-tables -c -o write_vga.o write_vga.c

write_vga1.asm : write_vga.o Makefile
	../objconv -fnasm write_vga.o write_vag1.asm

write_vga.asm : write_vga1.asm Makefile
	cat write_vga1.asm | sed -e '/^SECTION:/d' > write_vga.asm && \
	cat write_vga.asm | sed -e '/^global CMain: function:/d' > write_vga.asm && \
	cat write_vga1.asm | sed -e '/^extern:/d' > write_vga.asm

%.bin : %.asm Makefile
	nasm $*.asm -f bin -o $*.bin

myos.img : HelloOS boot.bin Makefile
	java HelloOS

run :
	make myos.img
	qemu-system-i386 -fda myos.img -boot a

clean:
	rm *.class
	rm *.bin
	rm *.img
	rm *.objconv