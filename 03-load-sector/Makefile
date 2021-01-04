default :
	make run

HelloOS : HelloOS.java Makefile
	javac HelloOS.java

boot.bin : boot.asm Makefile
	nasm -o boot.bin boot.asm

myos.img : HelloOS boot.bin Makefile
	java HelloOS

run :
	$(MAKE) myos.img
	qemu-system-i386 -fda myos03.img -boot a

clean:
	rm *.class
	rm *.bin
	rm *.img