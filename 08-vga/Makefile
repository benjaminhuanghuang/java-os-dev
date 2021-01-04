IMAGE_NAME  = myos08.img
BOOT_NAME  = boot.bin
KERNEL_NAME  = kernel.bin

default :
	make run

%.bin : %.asm Makefile
	nasm $*.asm -f bin -o $*.bin

write_vga.o : write_vga.c Makefile
	gcc -m32 -fno-asynchronous-unwind-tables -c -o write_vga.o write_vga.c

write_vga1.asm : write_vga.o Makefile
	../objconv -fnasm write_vga.o write_vga1.asm

# remove the SECTION, global, extern... 
write_vga.asm : write_vga1.asm Makefile
	cat write_vga1.asm | sed -e '/^SECTION/d' | sed -e '/^global/d' | sed -e '/^extern/d' > write_vga.asm

kernel.bin : kernel.asm write_vga.asm write_vga.c Makefile
	nasm kernel.asm -f bin -o kernel.bin

myos.img : kernel.bin boot.bin Makefile
	java -classpath ../make-img ImageMaker $(IMAGE_NAME) $(BOOT_NAME) "" &&\
	mcopy -i $(IMAGE_NAME) $(KERNEL_NAME) ::$(KERNEL_NAME)

run :
	make myos.img
	qemu-system-i386 -fda $(IMAGE_NAME) -boot a

clean:
	rm *.bin
	rm *.img
	rm *.obj
	rm *.o
	rm write_vag.asm
	rm write_vga1.asm
