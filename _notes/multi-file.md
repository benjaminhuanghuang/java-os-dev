## Method 1
Include all .c fine into os.c

16-memory


## Method 2
use ld comman link all obj files into one obj

18-memory-manage
1： 先使用命令编译mem_util.c
gcc -m32 -fno-asynchronous-unwind-tables -s -c -o mem_util.o mem_util.c
gcc -m32 -fno-asynchronous-unwind-tables -s -c -o write_vga_desktop.o write_vga_desktop.c

2：把两个编译好的模块链接成一个模块：
ld -m elf_i386 -r write_vga_desktop.o mem_util.o -o ckernel.o

3：把ckernel.o 反汇编，然后再添加到内核的汇编模块中一起编译：
./objconv -fnasm ckernel.o ckernel.asm