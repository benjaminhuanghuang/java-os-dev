
# Hello OS
[利用时钟中断实现光标闪烁特效](https://blog.csdn.net/tyler_download/article/details/53503374)


https://www.bilibili.com/video/BV1hJ411n7rs?p=27


1. multiple Timer
```
struct TIMER {
    unsigned int timeout, flags;
    struct FIFO8 *fifo;
    unsigned char data;
};

struct TIMERCTL {
    unsigned int count;

    struct TIMER timer[MAX_TIMER];

};
```