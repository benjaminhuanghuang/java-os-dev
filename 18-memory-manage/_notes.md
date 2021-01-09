
# Hello OS
[内存管理算法实现](https://blog.csdn.net/tyler_download/article/details/53023313)


https://www.bilibili.com/video/BV1hJ411n7rs?p=18

https://github.com/MingYueRuYa/butterfly_os/blob/show_memory/write_vga_show_memory.c

```
#define  MEMMAN_FREES  4096

/*
  one memory block
*/
struct FREEINFO {
    unsigned int addr, size;
};

struct MEMMAN {
    int frees, maxfrees, lostsize, losts;
    struct FREEINFO free[MEMMAN_FREES];
};
```

最多可管理 4096 个内存块
MEMMAN结构本身需要  4094 * 8 = 0x8000 = 32768 = 32K 内存空间
可用内存块起始地址为：0x00100000，长度为0x3FEF0000
留出 0x8000 空间给 MEMMAN结构
start = 0x10800
length = 3FEF0000 - 0x8000 = 0x3FEE8000 = 1072594944
3FEE8000 / 1024 / 1024 = 0x3FE = 1022M = 1G

复杂的是内存释放时的处理逻辑。当有内存释放的时候，我们需要把释放内存的起始地址和大小作为参数传入。

假定释放的内存片起始地址是 0x200, 大小是0x100, 如果内存管理对象中存在着一片可用内存，起始地址是0x100, 长度为0x100, 那么当前释放的内存片就可以跟原有可用内存合并，合并后的内存块就是起始地址为0x100, 长度为0x200的一片内存块。

如果内存还含有起始地址为0x300, 长度为0x100的内存片，三块内存片就可以合并成一块内存，也就是起始地址为0x100, 长度为0x300的一个大块内存片。

