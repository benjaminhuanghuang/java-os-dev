
# Hello OS
[实现基于FAT12文件系统的dir命令](https://blog.csdn.net/tyler_download/article/details/68926904)


https://www.bilibili.com/video/BV1hJ411n7rs?p=46

每个存储在FAT12系统上的文件都有一个文件目录，用于存储文件的基本信息，这个目录的数据结构如下：
```
struct FILEINFO {
    unsigned char name[8], ext[3], type;
    char  reserve[10];
    unsigned short time, date, clustno;
    unsigned int  size;
};
```
type
```
0x01 只读文件
0x02 隐藏文件
0x04 系统文件
0x08 非文件信息
0x10 目录
```