
# Hello OS
[实现基于FAT12文件系统的dir命令](https://blog.csdn.net/tyler_download/article/details/69807485)


https://www.bilibili.com/video/BV1hJ411n7rs?p=47

当控制台进程收到回车键后，判断当前输入的命令是不是”type” ，此处我们为什么不适用strcmp 比对字符串呢，这是因为type命令后面会跟着输入参数，所以不适合使用strcmp直接比较。

如果是type 的话接下来获取type 后面跟着的文件名，拿到文件名后遍历文件目录，找到跟给定文件名相同的目录，然后读取该目录的clustno,根据该值我们可以计算出文件内容在内存中的起始位置，根据size,可以得知文件的大小。

FILE_CONTENT_HEAD_ADDR就是文件内存存储的起始地址，也就是0x15800。