default :
	make run

%.bin : %.asm Makefile
	nasm $*.asm -f bin -o $*.bin

myos.img : kernel.bin boot.bin Makefile
	java -classpath ../make-img ImageMaker

run :
	$(MAKE) myos.img
	qemu-system-i386 -fda myos.img -boot a

clean:
	rm *.bin
	rm *.img