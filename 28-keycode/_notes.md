
# Hello OS
[改进分辨率和按键响应](https://blog.csdn.net/tyler_download/article/details/53610141)


https://www.bilibili.com/video/BV1hJ411n7rs?p=28


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