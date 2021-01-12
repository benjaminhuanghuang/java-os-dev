
# Hello OS
[进程间的消息通讯](https://blog.csdn.net/tyler_download/article/details/59057617)


https://www.bilibili.com/video/BV1hJ411n7rs?p=42


为每个进程准备了一个接收信息的队列，因此进程间相互发送消息是，可以把消息放入到接收方的队列中，
当接收方从队列中获取数据时，就能收到其他进程发送过来的信息，进而及时处理。
```
#define  PROC_RESUME   0x57
#define  PROC_PAUSE    0x58

void send_message(struct TASK *sender, struct TASK *receiver, int msg);
```