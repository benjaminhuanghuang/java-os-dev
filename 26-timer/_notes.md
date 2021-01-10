
# Hello OS
[消除图层刷新而导致的严重闪烁-2](https://blog.csdn.net/tyler_download/article/details/53487885)


https://www.bilibili.com/video/BV1hJ411n7rs?p=26


1. Init PIC in kernel.asm

主PIC的IRQ0对应的就是时钟中断
```
  mov  al, 11111000b ;允许键盘和时钟中断
  out  021h, al
  call io_delay
```
三个0表示打开主8259A的IRQ0, IRQ1, IRQ2三根信号线，IRQ0对应的就是时钟中断，打开IRQ0后，当中断信号发送到CPU时，CPU会调用中断程序

2. Init timer
```
  io_out8(PIT_CTRL, 0x34);
  io_out8(PIT_CNT0, 0x9c);
  io_out8(PIT_CNT0, 0x2e);   
```
将中断周期设定为11932，中断频率就是100Hz，也就是1秒钟会发生100次中断


3. Add Interupt handler
```
LABEL_IDT:
%rep  32
    Gate  SelectorCode32, SpuriousHandler,0, DA_386IGate
%endrep

;响应时钟中断的中断描述符
.020h:
    Gate SelectorCode32, timerHandler,0, DA_386IGate

.021h:
    Gate SelectorCode32, KeyBoardHandler,0, DA_386IGate

%rep  10
    Gate  SelectorCode32, SpuriousHandler,0, DA_386IGate
%endrep
```

每次响应中断信号时，先向8259A发送一个命令，命令的数值是0x60，要求8259A下次继续发送中断信号，如果不这么做，下次芯片就不再发送信号了

``
void intHandlerForTimer(char *esp) {
    io_out8(PIC0_OCW2, 0x20);
    timerctl.count++;
    ...
}

3. Timer
Timer 和 键盘，鼠标一样，需要一个FIFO buffer
```
  static struct FIFO8 timerinfo;
  static char timerbuf[8];
```


4. Main
```
  init_pit();
  fifo8_init(&timerinfo, 8, timerbuf);
  settimer(500, &timerinfo, 1);
  
```