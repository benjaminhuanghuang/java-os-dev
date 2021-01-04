IMAGE_NAME  = myos04.img

default :
	make run

HelloOS : HelloOS.java Makefile
	javac HelloOS.java

myos.img : HelloOS Makefile
	java HelloOS

run :
	$(MAKE) myos.img
	qemu-system-i386 -fda myos01.img -boot a

clean:
	rm *.class
	rm *.img
	