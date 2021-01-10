
# Hello OS
[提高窗体图层叠加处理速度](https://blog.csdn.net/tyler_download/article/details/53214634)


https://www.bilibili.com/video/BV1hJ411n7rs?p=21



只要鼠标稍微移动一下，就需要对整个画面进行刷新，也就是重新绘制320*200 = 64000 个像素点，其实只要重新绘制鼠标移动的相关区域就可以了，
例如，鼠标从原来坐标点(0,0),移动到坐标点(1,1), 那么内核只要重绘区域[(0,0), (16,16)] 和 [(1,1), (17,17)] 即可。也就是只需要绘制的像素是256*2=512，这只要64 000 个像素的百分之0.8.

Add function **sheet_refreshsub()**只对每个窗体绘制局部区域，该区域的左上角是(vx0,vy0),右下角是(vx1, vy1).
```
  void sheet_refreshsub(struct SHTCTL *ctl, int vx0, int vy0, int vx1, int vy1) {
    int h, bx, by, vx, vy;
    unsigned char *buf, c, *vram = ctl->vram;
    struct SHEET *sht;
    for (h = 0; h <= ctl->top; h++) {
        sht = ctl->sheets[h];
        buf = sht->buf;
        for (by = 0; by < sht->bysize; by++) {
            vy = sht->vy0 + by;
            for (bx = 0; bx < sht->bxsize; bx++) {
                vx = sht->vx0 + bx;
                if (vx0 <= vx && vx < vx1 && vy0 <= vy && vy < vy1) {
                    c = buf[by * sht->bxsize + bx];
                    if (c != sht->col_inv) {
                        vram[vy * ctl->xsize + vx] = c;
                    }
                }
            }
        }
    }
}
```


Use sheet_refreshsub() in sheet_slide()
```
  void sheet_slide(struct SHTCTL *ctl, struct SHEET *sht, int vx0, int vy0)
```

Add same function to sheet_refersh()
```
  int sheet_refresh(struct SHTCTL *ctl, struct SHEET *sht, int bx0, int by0, int bx1, int by1)
```


Update **sheet_setbuf()** using mew sheet_refersh() 

