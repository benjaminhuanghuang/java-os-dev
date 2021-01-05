IMAGE_NAME  = myos06.img
BOOT_NAME  = boot.bin

default :
	make run

%.bin : %.asm Makefile
	nasm $*.asm -f bin -o $*.bin

myos.img : boot.bin Makefile
	java -classpath ../make-img ImageMaker $(IMAGE_NAME) $(BOOT_NAME) ""

run :
	$(MAKE) myos.img
	qemu-system-i386 -fda $(IMAGE_NAME) -boot a

clean:
	rm *.bin
	rm *.img