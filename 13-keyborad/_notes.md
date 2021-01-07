
# Hello OS
[内核键盘中断处理进阶](https://blog.csdn.net/tyler_download/article/details/52770376)


https://www.bilibili.com/video/BV1hJ411n7rs?p=13

键按下时，键盘会发送一个中断信号给CPU,与此同时，键盘会在指定端口(0x60) 输出一个数值，这个数值对应按键的扫描码(make code)，
当按键弹起时，键盘又给端口输出一个数值，这个数值叫断码(break code).
以按键’A’为例，当按键’A’按下时，键盘给端口0x60发出的扫描码是0X1E, 当按键’A’弹起时，键盘会给端口0x60发送断码0x9E。

```
#define PORT_KEYDAT 0x0060
#define PIC_OCW2    0x20

void intHandlerFromC(char* esp) {
    char*vram = bootInfo.vgaRam;
    int xsize = bootInfo.screenX, ysize = bootInfo.screenY;
    io_out8(PIC_OCW2, 0x21);
    unsigned char data = 0;
    data = io_in8(PORT_KEYDAT);
    char* pStr = charToHexStr(data);
    static int showPos = 0;
    showString(vram, xsize, showPos, 0, COL8_FFFFFF, pStr);
    showPos += 32;
}
```
其中PIC_OCW2 的值是0x20, 也就是主PIC芯片的控制端口，0x21对应的是键盘的中断向量。当键盘中断被CPU执行后，下次键盘再向CPU发送信号时，CPU就不会接收，要想让CPU再次接收信号，必须向主PIC的端口再次发送键盘中断的中断向量号。


## Buffer
中断实际上是将CPU当前正在执行的任务给打断，让CPU先处理中断任务，然后再返回处理原先的任务，问题是如果中断处理过久，就会对CPU原来的任务造成负面影响。

以键盘中断为例，处理键盘中断要获取按键的扫描码和断码的数值，同时将数值转换为字符串，最后再将字符串的每一个字符绘制到界面上。这一系列其实是很耗时的计算。假设这时候有网络数据抵达系统，但是CPU忙于处理键盘中断，不能及时接收网络数据，这样，系统便会丢失网络数据。

所以，对于中断要尽可能快的处理，然后把控制器交还给原来的任务。


对于键盘中断，我们可以把键盘发送的扫描码和断码数值缓存起来，然后把控制器交换给原来任务，等到CPU稍微空闲时再处理键盘事件。因此我们为键盘中断设置一个缓冲区
```
struct KEYBUF {
    unsigned char key_buf[32];
    int next_r, next_w, len;
};

struct KEYBUF keybuf;
```
键盘中断接收到数据时，从next_w指向的位置开始写入，len用来表示当前缓冲区中的有效数据长度

每次键盘中断，中断处理函数只将相应的扫描码和断码写入缓冲区，如果缓冲区写满后，也就是next_w的值达到32，那么通过一次求余，next_w会重新设置为0，也就是说一旦缓冲区写满后，下次写入将从头开始。

在Main函数中对缓冲区进行读取，处理
