default :
	make run

HelloOS : HelloOS.java Makefile
	javac HelloOS.java

%.bin : %.asm Makefile
	nasm $*.asm -f bin -o $*.bin

myos.img : HelloOS kernel.bin boot.bin Makefile
	java HelloOS

run :
	$(MAKE) myos.img
	qemu-system-i386 -fda myos.img -boot a

clean:
	rm *.class
	rm *.bin
	rm *.img