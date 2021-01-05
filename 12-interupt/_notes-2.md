
# Hello OS
[为系统内核建立中断机制](https://blog.csdn.net/tyler_download/article/details/52716839)


https://www.bilibili.com/video/BV1hJ411n7rs?p=12

本节需要调整 loader， 加载多个柱面
以前为了简单，只加载 0号柱面 从 33 扇区开始的数据，
这是因为在FAT文件系统中，第一个文件是从0号柱面33扇区开始的，也就是磁盘0x4200处

现在要加载的kernel文件的大小超过一个柱面，因此需要加载多个柱面

为了方便，从0号柱面2扇区开始加载文件，因为0号柱面1扇区是启动扇区已经被加载到了0x7c00处, 
一个扇区512字节=0x200

boot 把磁盘上从第二扇区开始到的内容装载到内存0x8200号地址，
所以磁盘0x4200处的内容就应该位于内存0x8000+0x4200=0xc200号地址。

kernel里加上ORG 0xc200，boot最后 要JMP 0xc200。