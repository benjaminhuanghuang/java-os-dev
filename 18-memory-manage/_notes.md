
# Hello OS
[内存管理算法实现](https://blog.csdn.net/tyler_download/article/details/53023313)


https://www.bilibili.com/video/BV1hJ411n7rs?p=18

https://github.com/MingYueRuYa/butterfly_os/blob/show_memory/write_vga_show_memory.c


复杂的是内存释放时的处理逻辑。当有内存释放的时候，我们需要把释放内存的起始地址和大小作为参数传入。

假定释放的内存片起始地址是 0x200, 大小是0x100, 如果内存管理对象中存在着一片可用内存，起始地址是0x100, 长度为0x100, 那么当前释放的内存片就可以跟原有可用内存合并，合并后的内存块就是起始地址为0x100, 长度为0x200的一片内存块。

如果内存还含有起始地址为0x300, 长度为0x100的内存片，三块内存片就可以合并成一块内存，也就是起始地址为0x100, 长度为0x300的一个大块内存片。