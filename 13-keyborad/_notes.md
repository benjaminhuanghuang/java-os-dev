
# Hello OS
[内核键盘中断处理进阶](https://blog.csdn.net/tyler_download/article/details/52770376)


https://www.bilibili.com/video/BV1hJ411n7rs?p=13

键按下时，键盘会发送一个中断信号给CPU,与此同时，键盘会在指定端口(0x60) 输出一个数值，这个数值对应按键的扫描码(make code)，
当按键弹起时，键盘又给端口输出一个数值，这个数值叫断码(break code).
以按键’A’为例，当按键’A’按下时，键盘给端口0x60发出的扫描码是0X1E, 当按键’A’弹起时，键盘会给端口0x60发送断码0x9E。


