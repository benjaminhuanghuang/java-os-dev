
# Hello OS
[输入文本框和鼠标移动窗体](https://blog.csdn.net/tyler_download/article/details/53611028)


https://www.bilibili.com/video/BV1hJ411n7rs?p=29


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