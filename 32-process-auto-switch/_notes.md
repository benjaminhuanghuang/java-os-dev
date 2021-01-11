
# Hello OS
[实现进程自动切换](https://blog.csdn.net/tyler_download/article/details/53909805)


https://www.bilibili.com/video/BV1hJ411n7rs?p=32


增加两个函数和一个定时器指针，他们用来实现进程间的自动切换
```
void mt_init();

struct TIMER *mt_timer;

void mt_taskswitch();
```

mt_init 首先初始化用于进程调度的时钟对象，然后把mt_tr设置为7*8，也就是CMain函数所对应的任务门描述符的下标。

mt_taskswitch 负责 把mt_tr在7*8 和 9*8 直接切换，然后通过调用farjmp 跳转到对应的任务门，下标7对应的是CMain的任务门，9对应的是task_b_main函数的任务门，在这两个任务吗间跳转，就可以实现两个进程的相互切换。


如果跳转不涉及到让CPU更改当前加载的代码段描述符，也就是cs寄存器所存储的描述符下标，那么我们就可以使用近跳转，

如果要改变cs寄存器的内容，也就是要让CPU加载新的描述符，那么我们可以使用远跳转，

如果jmp 指令后面跟着FAR 关键字的话，那么CPU会把当前指定的内存地址处的4字节当做eip的值，然后再连续读入2字节的数据存入cs寄存器。对于调用far(0, 7*8), [esp + 4] 对应的4字节就是数值0，接下来的2字节对应的就是7*8.

```
farjmp:
    jmp FAR [esp + 4]
    ret
```

所以当我们通过调用farjmp(0, 7*8) 的时候，其效果跟我们以前调用taskswitch7是一样的。


时钟中断里进行调用，进而实现进程切换：
```
void intHandlerForTimer(char *esp) {
    if (&timerctl.timer[i] == mt_timer) {
        ts = 1;
    }
    ...

    if (ts != 0) {
        mt_taskswitch();   // Switch
    }
}
```

