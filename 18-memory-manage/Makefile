IMAGE_NAME  = myos18.img
BOOT_NAME  = boot.bin
KERNEL_NAME  = kernel.bin
OBJS = os.o graphics.o string.o fifo.o keyboard.o mouse.o \
			memory.o

default :
	make run

# Need -target x86_64-unknown-linux-gun to create ELF32 format on Mac
%.o : %.c Makefile
	gcc -target x86_64-unknown-linux-gun -m32 -O0 -c -o $*.o $*.c
		
%.bin : %.asm Makefile
	nasm $*.asm -f bin -o $*.bin

# link all obj files to one obj
os1.o : $(OBJS) Makefile
	ld 
	#-m32 -r $(OBJS) -o os1.o

os1.asm : os1.o Makefile
	../objconv -fnasm os1.o os1.asm

# remove the SECTION, global, extern... 
os.asm : os1.asm Makefile
	cat os1.asm | sed -e '/^SECTION/d' | sed -e '/^global/d' | sed -e '/^extern/d' > os.asm

kernel.bin : kernel.asm os.asm Makefile
	nasm kernel.asm -f bin -o kernel.bin

myos.img : kernel.bin boot.bin Makefile
	java -classpath ../make-img ImageMaker $(IMAGE_NAME) $(BOOT_NAME) "" &&\
	mcopy -i $(IMAGE_NAME) $(KERNEL_NAME) ::$(KERNEL_NAME)

run :
	make myos.img
	qemu-system-i386 -fda $(IMAGE_NAME) -boot a

clean:
	rm os1.asm
	rm os.asm
	rm *.bin
	rm *.img
	rm *.o

