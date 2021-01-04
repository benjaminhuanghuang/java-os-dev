# Hello OS
[java开发操作系统内核：让内核突破512字节的限制](https://blog.csdn.net/tyler_download/article/details/51970921)

https://www.bilibili.com/video/BV1hJ411n7rs?p=4

kernel.asm 会被编译成 kernel.bin 然后写到 image 的 0Head, 1Cylinder, 2Sec
```
  writeFileToFloppy("kernel.bin", false, 1, 2);
```
boot.asm  会被编译成 boot.bin 然后 写到 image的启动扇区，运行后会从image加载并kernel.bin 

发现一个问题：windows无法读取 image， 说明把kernel.bin 写入 image 破坏了文件系统，
![](../_notes/fat12-boot.png)


因为根目录区从19扇区开始，每个扇区512bytes，因此根目录下第一个文件的目录信息开始于19*512 = 0x2600

数据区开始扇区号 = 根目录开始扇区号+ 目录所占区号 = 19 + 14 = 33

第一个文件的起始位置在 512 * 33 = 0x4200

因此，向一个空软盘保存文件时，
- 文件名会写在0x002600以后的地方；
- 文件的内容会写在0x004200以后的地方。

所以可以将操作系统本身的内容写到名为haribote.sys文件中，再把它保存到磁盘映像里，然后从启动区执行这个haribote.sys

要怎样才能执行磁盘映像上位于0x004200号地址的程序呢？现在的程序是从启动区开始，把磁盘上的内容装载到内存0x8000号地址，所以磁盘0x4200处的内容就应该位于内存0x8000+0x4200=0xc200号地址。

所以 在haribote.nas里加上ORG 0xc200，ipl.nas处理的最后加上JMP 0xc200这个指令。

## ASM
读取软盘的汇编代码
```
mov CH, 1 ;CH 用来存储柱面号
mov DH, 0 ;DH 用来存储磁头号
mov CL, 2 ;CL 用来存储扇区号

mov BX, msg ; ES:BX 数据存储缓冲区

mov AH, 0x02 ; AH = 02 表示要做的是读盘操作
mov AL, 1 ; AL 表示要练习读取几个扇区
mov DL, 0 ;驱动器编号，一般我们只有一个软盘驱动器，所以写死为0
INT 0x13 ;调用BIOS中断实现磁盘读取功能
JC error ; 如果读盘出现错误，跳转到error处执行相应代码
```

在计算机硬件中，有一个隐含的寄存器叫FLACS, 当BIOS调用出现错误时，FLACS寄存器的 CF 位会置1，同时把错误代码存入AH,
如果没有错，那么FLACS寄存器的CF位会设置为0，所以 JC error 的意思是
```
if (FLACS.CF == 1) {
  error();
}
```