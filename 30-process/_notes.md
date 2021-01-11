
# Hello OS
[进程初体验及代码其实现1](https://blog.csdn.net/tyler_download/article/details/53817153)


https://www.bilibili.com/video/BV1hJ411n7rs?p=30


TSS(task status segment) TSS也是内存段的一种，需要在GDT中进行定义后使用。
称为一个任务门描述符，是intel X86架构的CPU专门供给的。当发生任务切换时，CPU通过加装上面给定的数据结构，将当前进程的相关信息写入TSS32, 从而实现当前进程的运行环境保护。我们看看里面的相关字段。
```
struct TSS32 {
    int backlink, esp0, ss0, esp1, ss1, esp2, ss2, cr3;
    int eip, eflags, eax, ecx, edx, ebx, esp, ebp, esi, edi;
    int es, cs, ss, ds, fs, gs;
    int ldtr, iomap;
};
```
初始化了TSS32后，在全局描述符表中，需要专门分配一个描述符来指向这块TSS32内存,这种描述符，成为任务门。

全局描述符数据结构的定义：
```
struct SEGMENT_DESCRIPTOR {
    short limit_low, base_low;
    char base_mid, access_right;
    char limit_high, base_high;
};

void set_segmdesc(struct SEGMENT_DESCRIPTOR *sd, unsigned int limit, int base, int ar);

#define AR_TSS32        0x0089
```

当我们初始化好一个TSS32数据结构，同时构造一个全局描述符指向这个TSS32数据块后，然后通过一条CPU指令，把这个描述符加载到CPU中，这条指令是LTR，我们在内核的汇编部分专门封装了这条指令，以便内核的C语言部分调用，代码见(kernel.asm)：
```
load_tr:
    LTR  [esp + 4]
    ret
```

分添加几个描述符用于指向不同的TSS32结构，代码如下(kernel.asm)：
```
LABEL_GDT:
....

LABEL_DESC_6:       Descriptor        0,      0fffffh,       0409Ah

LABEL_DESC_7:       Descriptor        0,      0,       0

LABEL_DESC_8:       Descriptor        0,      0,       0

LABEL_DESC_9:       Descriptor        0,      0,       0

```