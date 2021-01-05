
# Hello OS
[为系统内核建立中断机制](https://blog.csdn.net/tyler_download/article/details/52716839)


https://www.bilibili.com/video/BV1hJ411n7rs?p=12

## PIC(programmable interrupt controller)
外设硬件要给CPU发送信号，需要通过专门的处理芯片，这个芯片叫可编程控制器，俗称8259A

每一个8259A控制器有8根中断信号线，总共可以接入15个外设硬件，

鼠标接入的是`从`8259A所对应的IRQ4这根信号线，鼠标发送信号时，先通过管线IRQ4将信号传递到从8259A,然后通过管线IRQ2传递到主8259A,最后信号再传递给CPU，

键盘产生的中断通过`主`8259A的IRQ1管线向CPU发送信号.

硬件需要初始化后才能使用，要配置这两个控制器，需要对指定端口发送1字节的数据，这个一字节(8 bit)的数据，称之为**ICW(initialization control word)**.

主8259A对应的端口地址是20h,21h, 从8259A对应的端口是A0h和A1h. 对端口发送数据时，顺序是定死的.
1. 往端口20h（主片）或A0h（从片)发送ICW1
2. 往端口21h（主片）或A1h（从片)发送ICW2
3. 往端口21h（主片）或A1h（从片)发送ICW3
4. 往端口20h（主片）或A0h（从片)发送ICW4

每个ICW的结构和意义：

ICW1[0~7]:
```
ICW1[0] 设置为1表示需要发送ICW4,0表示不需要发送ICW4.
ICW1[1] 设置为1表示单个8259, 0表示级联8259
ICW1[2] 设置为1表示4字节中断向量，0表示8字节中断向量
ICW1[3] 设置为1表示中断形式是水平触发，0表示边沿触发
ICW1[4] 必须设置为1
ICW1[5,6,7] 必须设置为0
```
ICW2[0~7]:
```
ICW2[0,1,2] 对于80X86架构必须设置为0
ICW2[3~7]: 80X86中断向量
```

ICW3[0…7](主片)
```
ICW3[0] 设置为1， IR0级联从片，0无从片
ICW3[1] 设置为1， IR1级联从片，0无从片
ICW3[2] 设置为1， IR2级联从片，0无从片
ICW3[3] 设置为1， IR3级联从片，0无从片
ICW3[4] 设置为1， IR4级联从片，0无从片
ICW3[5] 设置为1， IR5级联从片，0无从片
ICW3[6] 设置为1， IR6级联从片，0无从片
ICW3[7] 设置为1， IR7级联从片，0无从片
```
ICW3[0…7](从片)
```
ICW3[0,1,2] 从片连接主片的IR号
ICw3[3…7] 必须是0
```
ICW4[0…7]:
```
ICW4[0] 设置为1，表示x86模式，0表示MCS 80/85模式
ICW4[1] 设置为1，自动EOI；0 正常EOI
ICW4[2,3] 表示主从缓冲模式
ICW4[4] 1表示SFNM模式; 0 sequential 模式
ICW4[5,6,7] 设置为0
```


1. 先向 主 8259A发送ICW1.
```
mov al, 011h
out 020h, al
```
011h 对应的二进制是00010001,对应ICW1的说明，
ICW1[0]= 1表示需要发送ICW4, 
ICW1[1]= 0说明有级联8259A，
ICW1[2]= 0表示用8字节来设置中断向量号，
ICW1[3]= 0表示中断形式是边沿触发，
ICW1[4]必须设置为1，
ICW1[5,6,7]必须是0.

2. 向 从 8259A发送同样的ICW1.
```
out A0h, al
```

3. 向主8259A发送ICW2.
```
mov al, 20h
out 021h, al
```
20h 是 主片 对应的中断向量起始编号, （0～1F 中断 CPU自己留着用）
当主8259A对应的IRQ0管线向CPU发送信号时，CPU根据0x20这个值去查找要执行的代码，IRQ1管线向CPU发送信号时，CPU根据0x21这个值去查找要执行的代码，依次类推。

4. 向从8259A发送ICW2.
```
mov al, 028h
out A1h, al
```
028h 是从片对应的中断向量起始编号

5. 向主8259A发送ICW3
```
mov al, 04h
out 21h, al
```
04h = 100b 表示从8259A通过主IRQ2管线连接到 主8259A控制器

6. 向从8259A 发送 ICW3
```
mov al, 02h
out Alh , al
```
当前从片是从IRQ2管线接入主片。

7. 向主8259A发送ICW4.
```
mov al, 003h
out 021h, al
```
001h 对应的ICW4为，ICW4[0]=1表示当前CPU架构师80X86，ICW4[1]=1表示自动EOI, 如果这位设置成0的话，那么中断响应后，代码要想继续处理中断，就得主动给CPU发送一个信号，如果设置成1，那么代码不用主动给CPU发送信号就可以再次处理中断。

8. 向从8259A发送ICW4,原理同上.
```
out 0A1h, al
```

上面的配置完成后，还需要再向两个芯片分别发送一个字节，叫OCW(operation control word), 一个OCW是一字节数据，也就是8bit,每一bit设置作用是，当OCW[i] = 1 时,屏蔽对应的IRQ(i)管线的信号，例如OCW[0]=1, 那么IRQ0管线的信号将不会被CPU接收，以此类推。配置代码如下.
```
mov al, 11111101b
out 21h, al
```
表示CPU只接收主8259A, IRQ1管线发送的信号，其他管线发送信号一概忽略，IRQ1对应的是键盘产生的中断。
```
mov al, 11111111b
out 0A1h, al
```
上面代码使得CPU忽略所有来自从8259A芯片的信号。


## disable / enable interupt

cli

sti

## 设置中断向量
4 bytes
```
  struct GATE_DESCRIPTOR {
    short offest_low,
    short selector,
    char dw_count,
    char attribute;
    short offset_high;
  }
```
ffset_low 和 offset_high 合在一起作为中断函数在代码执行段中的偏移，selector 用来指向全局描述符表中的某个描述符，中断函数的代码就处于该描述符所指向的段中，dw_count设置为0，attribute设置为08Eh
