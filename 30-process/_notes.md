
# Hello OS
[进程初体验及代码其实现1](https://blog.csdn.net/tyler_download/article/details/53817153)


https://www.bilibili.com/video/BV1hJ411n7rs?p=30

当你向CPU发出任务切换的指令时，CPU会先把寄存器中的值全部写入内存中，这样做是为了当以后切换回这个程序的时候，可以从中断的地方继续运行。接下来，为了运行下一个程序，CPU会把所有寄存器中的值从内存中读取出来（当然，这个读取的地址和刚刚写入的地址一定是不同的，不然就相当于什么都没变嘛），这样就完成了一次切换。我们前面所说的任务切换所需要的时间，正是对内存进行写入和读取操作所消耗的时间。


TSS(task status segment) TSS也是内存段的一种，需要在GDT中进行定义后使用。
称为一个任务门描述符，是intel X86架构的CPU专门供给的。当发生任务切换时，CPU通过加装上面给定的数据结构，将当前进程的相关信息写入TSS32, 从而实现当前进程的运行环境保护。
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

当我们初始化好一个TSS32数据结构，同时构造一个全局描述符指向这个TSS32数据块后，然后通过一条CPU指令，把这个描述符加载到CPU中，
寄存器TR是作用是让CPU记住当前在运行哪个任务。其存储的值是"当前任务所在的段号*8"
LTR指令只是改变TR的值，不会发生任务切换：
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
## Jump
JMP指令分为两种，只改写EIP的称为near模式，同时改写EIP和CS的称为far模式

CPU执行far模式的JMP指令前，会根据GDT中注册的TSS情况，判断JMP的目标地址是可执行代码还是TSS。如果是可执行代码，那么CPU就认为这只是一个普通的far模式的JMP；如果是TSS，则认为这是一个任务切换指令，会切换到目标地址指定的TSS所记录的任务中，也就是JMP到另一个任务那里去了。

“JMP FAR”指令的功能是执行far跳转。在JMP FAR指令中，可以指定一个内存地址，CPU会从指定的内存地址中读取4个字节的数据，并将其存入EIP寄存器，再继续读取2个字节的数据，并将其存入CS寄存器。当我们调用这个函数，比如farjmp(eip, cs);，在[ESP+4]这个位置就存放了eip的值，而[ESP+8]则存放了cs的值，这样就可以实现far跳转了。