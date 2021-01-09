
# Hello OS
[检测可用内存](https://blog.csdn.net/tyler_download/article/details/52954543)


https://www.bilibili.com/video/BV1hJ411n7rs?p=17

https://github.com/MingYueRuYa/butterfly_os/blob/show_memory/write_vga_show_memory.c


## Main 
```
  struct AddrRangeDesc *memDesc = (struct AddrRangeDesc *)get_adr_buffer();
```

找到其中一块可用的内存
起始地址为：0x00100000，长度为0x3FEF0000
```
4:
BaseAddrL: 0x00100000
BaseAddrH: 0x00000000
lengthLow: 0x3FEF0000
lengthHigh: 0x00000000
type: 0x00000001
```