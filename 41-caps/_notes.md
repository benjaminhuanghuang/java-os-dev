
# Hello OS
[实现shift按键效果](https://blog.csdn.net/tyler_download/article/details/56016123)


https://www.bilibili.com/video/BV1hJ411n7rs?p=41


当caps键按下时，键盘给系统发过来的扫描码是0x3a, 当该键弹起后，键盘发送过来的断码为0xba

```
int isSpecialKey(int data) {
    transferScanCode(data);

    if (data == 0x3a || data == 0xba || data == 0x2a || data == 0x36
       || data == 0xaa || data == 0xb6) {
        return 1;
    }

    return 0;
}
```


按键会产生两个数据，一个是按下时发出的扫描码，另一个是按键弹起后发出的断码。所以处理一次按键事件时，必须同时处理扫描码和断码。


