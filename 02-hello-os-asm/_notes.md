# Hello OS
[用java做一个最小的操作系统内核2](https://blog.csdn.net/tyler_download/article/details/51761750)

https://www.bilibili.com/video/BV1hJ411n7rs?p=2


用汇编语言写一个程序，编译成bin

Java代码把bin写入二进制文件的起始512字节，这512字节的剩余部分补0，并以55AA结尾


## ASM
在屏幕上输出字符，需要使用bios 0x10中断
把寄存器ah设置为0x0e, 
把要输出的字符的ascii值放入到寄存器al, 
把寄存器设bh的值设置成0，
字符的颜色可以通过寄存器bl的值来设定