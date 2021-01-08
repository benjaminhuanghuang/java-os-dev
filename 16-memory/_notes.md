
# Hello OS
[检测可用内存](https://blog.csdn.net/tyler_download/article/details/52927236)


https://www.bilibili.com/video/BV1hJ411n7rs?p=16


使用15h中断。其具体步骤如下：

1： 将寄存器AX 赋值为 0E820h
2 : 将寄存器EBX 初始化为0，该寄存器的内容会被BIOS修改，修改成什么数值，我们不用关心，但必须保证内存查询过程中，该寄存器不会被修改。
3： es:di 指向一块足够大的内存地址，BIOS会把有关内存的信息写到这个地址，内存信息是一种数据结构，称之为地址范围描述符。
4： ecx 寄存器存储es:di所指向的内存大小，以字节为单位，BIOS最多会填充ecx个字节的数据，通常情况下，无论ecx的数值是多少，BIOS都只填充20字节，有些BIOS直接忽略ecx的值，总是填充20字节。
5： edx寄存器的值设置为0534D4150h, 这个数值其实对应的是字符组合”SMAP”,其作用我们可以暂时忽略。

做完上面的配置后，执行int 15h 中断，中断结果的分析如下：
1： 判断CF位，如果CF位设置为1，则表示出错
2： eax 会被设置为0534D4150h， 也就是字符串’SMAP’
3 : es:di 返回地址范围描述符结构指针，跟输入时相同
4：如果ebx的值为0，表明查询结束，如果不为0，则继续调用15h获取有关内存的信息

```
  struct AddrRangeDesc {
    unsigned int  baseAddrLow ;  //内存基地址的低32位
    unsigned int  baseAddrHigh;  //内存基地址的高32位
    unsigned int  lengthLow;     //内存块长度的低32位
    unsigned int  lengthHigh;    //内存块长度的高32位
    unsigned int  type;          //描述内存块的类型
  }
```
type 等于1，表示当前内存块可以被内核使用。
type 等于2，表示当前内存块已经被占用，系统内核绝对不能使用，
type等于3，保留给未来使用，内核也不能用当前内存块。

## Check memory
```
  MemChkBuf: times 256 db 0
  dwMCRNumber:   dd 0

  ComputeMemory:
     mov   ebx, 0
     mov   di, MemChkBuf
.loop:
     mov   eax, 0E820h
     mov   ecx, 20
     mov   edx, 0534D4150h
     int   15h
     jc    LABEL_MEM_CHK_FAIL
     add   di, 20   
     inc   dword [dwMCRNumber]
     cmp   ebx, 0
     jne   .loop
     jmp   LABEL_MEM_CHK_OK
LABEL_MEM_CHK_FAIL:
    mov    dword [dwMCRNumber], 0
```
MemChkBuf 是256字节的缓冲区，es:di将指向它，BIOS将会把地址范围描述符结构体写入这块内存。
每次调用一次int 15h中断，BIOS成功填充地址描述符后后，我们把dwMCRNumber 这个变量加1.

