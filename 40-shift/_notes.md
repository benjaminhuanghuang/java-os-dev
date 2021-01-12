
# Hello OS
[实现shift按键效果](https://blog.csdn.net/tyler_download/article/details/55044571)


https://www.bilibili.com/video/BV1hJ411n7rs?p=40

如果key_shift的值不等于0，也就是shift键被按下，到keytable1里面去查找按键对应的字符，
如果key_shift值是0，也就是shift键没有被按下，到 keytable表中去查找按键对应的字符。

无论是控制台窗口还是文本框窗口，在显示字符前，都先调用transferScanCode函数去将键盘发过来的数值进行转换，如果转换的结果不是0，那么将得到的字符显示到窗口中

```
char  transferScanCode(int data) {
    if (data == 0x2a)  {//left shift key down
        key_shift |= 1;
    }

    if (data == 0x36) {
        //right shift key down 
        key_shift |= 2; 
    }

    if (data == 0xaa) {
        //left shift key up
        key_shift &= ~1;
    }

    if (data == 0xb6) {
       //right shift key up
        key_shift &= ~2;
    }

    if (data == 0x2a || data == 0x36 || data == 0xaa || data == 0xb6 || 
        data >= 0x54) {
        return 0;
    }

    char c = 0;

    if (key_shift == 0 && data<0x54 && keytable[data] != 0) {
        c = keytable[data];
    } 
    else if (key_shift != 0 && data < 0x80 && keytable1[data] != 0){
        c = keytable1[data];
    }
    else {
        c = 0;
    }

    return c;
}
```


