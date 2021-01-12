
# Hello OS
[实现切换窗口后的键盘输入](https://blog.csdn.net/tyler_download/article/details/54782484)


https://www.bilibili.com/video/BV1hJ411n7rs?p=39



实现的思路: 为每个任务配置一个输入队列，当窗口被激活时，一旦有键盘输入，主进程首先会把键盘数据获取到，
然后判断当前被激活的是哪个窗口，然后找到运行窗口所对应的进程对象，通过进程对象获得其对应的输入队列，于是把键盘传过来的信息放入到输入队列中，然后激活对应的进程对象。

```
struct TASK {
    int sel, flags;
    int priority;
    int level;
    struct FIFO8 fifo;   /* input for task*/
    struct TSS32 tss;
};
```

