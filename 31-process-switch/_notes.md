
# Hello OS
[进程切换](https://blog.csdn.net/tyler_download/article/details/53840176)


https://www.bilibili.com/video/BV1hJ411n7rs?p=31


进程A就是主入口函数CMain. 要切换进程B,就需要一个描述进程B的TSS结构
```
    int addr_code32 = get_code32_addr();
    // eip指向的是相对于代码段起始地址的偏移
    tss_b.eip =  (task_b_main - addr_code32);  
    tss_b.eflags = 0x00000202; 
    tss_b.eax = 0;
    tss_b.ecx = 0;
    tss_b.edx = 0;
    tss_b.ebx = 0;
    tss_b.esp = 1024;// 让进程把把堆栈指针指向第二个stack的末尾处
    tss_b.ebp = 0;
    tss_b.esi = 0;
    tss_b.edi = 0;
    tss_b.es = tss_a.es;
    tss_b.cs = tss_a.cs;//6 * 8;
    tss_b.ss = tss_a.ss;
    tss_b.ds = tss_a.ds;
    tss_b.fs = tss_a.fs;
    tss_b.gs = tss_a.gs;
```

“JMP FAR”指令的功能是执行far跳转。在JMP FAR指令中，可以指定一个内存地址，CPU会从指定的内存地址中读取4个字节的数据，并将其存入EIP寄存器，再继续读取2个字节的数据，并将其存入CS寄存器。当我们调用这个函数，比如farjmp(eip, cs);，在[ESP+4]这个位置就存放了eip的值，而[ESP+8]则存放了cs的值，这样就可以实现far跳转了。