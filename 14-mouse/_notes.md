
# Hello OS
[让鼠标漫天飞舞：在内核中实现鼠标的中断处理](https://blog.csdn.net/tyler_download/article/details/52779400)


https://www.bilibili.com/video/BV1hJ411n7rs?p=14


## 1. setup PIC 
鼠标发送中断信号的数据线在从8259A芯片的IRQ4信号线，为了接收鼠标中断信号，初始化中断控制芯片时，必须启用该信号线，同时，从8259A芯片是通过主8259A的IRQ2信号线连接在一起的，所以，也必须同时启动主8259A芯片的IRQ2信号线：

```
init8259A:
...
mov  al, 11111001b ;允许键盘中断
out  021h, al
call io_delay

mov  al, 11101111b ;允许鼠标中断
out  0A1h, al
call io_delay

ret
```
mov al, 11111001b 启用了主8259A芯片的IRQ1和IRQ2两根信号线，
mov al, 11101111b 启用了从8259A的IRQ4信号线，这根信号线就是用来发送鼠标信号的。

## 2. Init keyboar and mouse
鼠标电路对应的一个端口是 0x64, 通过读取这个端口的数据来检测鼠标电路的状态，
内核会从这个端口读入一个字节的数据，如果该字节的第二个比特位为0，那表明鼠标电路可以接受来自内核的命令，因此，在给鼠标电路发送数据前，内核需要反复从0x64端口读取数据，并检测读到数据的第二个比特位，知道该比特位为0时，才着手发送控制信息
```
    #define  PORT_KEYDAT  0x0060
    #define  PORT_KEYSTA  0x0064
    #define  PORT_KEYCMD  0x0064
    #define  KEYSTA_SEND_NOTREADY  0x02
    #define  KEYCMD_WRITE_MODE  0x60
    #define  KBC_MODE     0x47

    void  wait_KBC_sendready() {
        for(;;) {
            if ((io_in8(PORT_KEYSTA) & KEYSTA_SEND_NOTREADY) == 0) {
                break;
            }
        }
    }
```

## 中断向量 kernel.asms

将主8259A的初始中断向量设置为0x20,把从8259A的初始中断向量设置为0x28, 由于鼠标中断信号线是从8259A的IRQ4,所以鼠标的中断向量就是0x28 + 4 = 0x2C, 

```
LABEL_IDT:
%rep  33
    Gate  SelectorCode32, SpuriousHandler,0, DA_386IGate
%endrep

.021h:
    Gate SelectorCode32, KeyBoardHandler,0, DA_386IGate

%rep  10
    Gate  SelectorCode32, SpuriousHandler,0, DA_386IGate
%endrep

.2CH:
    Gate SelectorCode32, mouseHandler,0, DA_386IGate
```


## Read data
鼠标数据取得方法与键盘完全相同。
因为键盘控制电路中含有鼠标控制电路，才造成了这种结果。
数据究竟是来自键盘还是鼠标，要靠中断号码来区分。