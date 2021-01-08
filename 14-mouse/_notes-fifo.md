## 改进buffer
鼠标激活后，只要稍微有点移动，它都会向CPU发送大量的坐标数据，因此内核要能够把鼠标发送的数据合适的存储起来，以便主进行相应的处理。

定长缓存机制不够灵活，因为缓存空间只限定在32字节，这对鼠标来说是不够用的，

需要一个FIFO buffer
```
struct FIFO8 {
    unsigned char* buf;
    int p, q, size, free, flags;
};

void fifo8_init(struct FIFO8 *fifo, int size, unsigned char *buf) {
    fifo->size = size;
    fifo->buf = buf;
    fifo->free = size;
    fifo->flags = 0;
    fifo->p = 0;
    fifo->q = 0;
    return ;
}

#define FLAGS_OVERRUN 0x0001
int fifo8_put(struct FIFO8 *fifo, unsigned char data) {
    if (fifo->free ==0) {
        fifo->flags |= FLAGS_OVERRUN;
        return -1;
    }

    fifo->buf[fifo->p] = data;
    fifo->p++;
    if (fifo->p == fifo->size) {
        fifo->p = 0;
    }

    fifo->free--;
    return 0;
}

int fifo8_get(struct FIFO8 *fifo) {
    int data;
    if (fifo->free == fifo->size) {
        return -1;
    }

    data = fifo->buf[fifo->q];
    fifo->q++;
    if (fifo->q == fifo->size) {
        fifo->q = 0;
    }

    fifo->free++;
    return data;
}

int fifo8_status(struct FIFO8 *fifo) {
    return fifo->size - fifo->free;
}
```


FIFO buffer可以同时用于keyboard和mouse：
```
    static struct FIFO8 keyinfo;
    static char mousebuf[128];
    
    static struct FIFO8 mouseinfo;
    static char keybuf[32];
```