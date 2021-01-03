# Hello OS
[用java做操作系统内核：软盘读写](https://blog.csdn.net/tyler_download/article/details/51815483)

https://www.bilibili.com/video/BV1hJ411n7rs?p=3


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