IMAGE_NAME  = myos05.img
BOOT_NAME  = boot.bin
KERNEL_NAME  = kernel.bin

default :
	make run

%.bin : %.asm Makefile
	nasm $*.asm -f bin -o $*.bin

myos.img : kernel.bin boot.bin Makefile
	java -classpath ../make-img ImageMaker $(IMAGE_NAME) $(BOOT_NAME) "" &&\
	mcopy -i $(IMAGE_NAME) $(KERNEL_NAME) ::$(KERNEL_NAME)

run :
	$(MAKE) myos.img
	qemu-system-i386 -fda $(IMAGE_NAME) -boot a

clean:
	rm *.bin
	rm *.img