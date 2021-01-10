
# Hello OS
[开发一个MessageBox](https://blog.csdn.net/tyler_download/article/details/53318745)


https://www.bilibili.com/video/BV1hJ411n7rs?p=22


```
void make_window8(unsigned char *buf, int xsize, int ysize, char *title)
```


Create a window
```
    unsigned  *buf_win;
    
    buf_win   = (unsigned char *) memman_alloc_4k(memman, 160 * 52);
    sht_win   = sheet_alloc(shtctl);
    sheet_setbuf(sht_win, buf_win, 160, 52, -1);
    make_window8(buf_win, 160, 52, "counter");
    sheet_slide(sht_win, 80, 72);
    sheet_updown(sht_win,   1);

```

create a messagebox 是为了展示 mouse hover on时会产生闪烁