
# Hello OS
[开发一个MessageBox](https://blog.csdn.net/tyler_download/article/details/53318745)


https://www.bilibili.com/video/BV1hJ411n7rs?p=22


```
void make_window8(unsigned char *buf, int xsize, int ysize, char *title)
```


Call make_window8
```
void message_box(struct SHTCTL *shtctl,  char *title) {
    struct SHEET *sht_win;
    unsigned char *buf_win;

    sht_win = sheet_alloc(shtctl);
    buf_win = (unsigned char *)memman_alloc_4k(memman, 160 * 68);
    sheet_setbuf(sht_win, buf_win, 160, 68, -1);

    make_window8(shtctl, sht_win, title);

    showString(shtctl, sht_win, 24, 28, COL8_000000, "Welcome to");
    showString(shtctl, sht_win, 24, 44, COL8_000000, "MyOS");

    sheet_slide(shtctl, sht_win, 80, 72);
    sheet_updown(shtctl, sht_win, 1);
}
```