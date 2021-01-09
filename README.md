# Linux操作系统-构建自己的内核
https://www.bilibili.com/video/BV1hJ411n7rs?p=1

https://github.com/MingYueRuYa/butterfly_os


添加新的绘制函数
鼠标从原来坐标点(0,0),移动到坐标点(1,1), 只要重绘区域[(0,0), (16,16)] 和 (1,1), (17,17) 即可。

```
  void sheet_refreshsub(struct SHTCTL *ctl, int vx0, int vy0, int vx1, int vy1)
```
Use it in
```
void sheet_slide(struct SHTCTL *ctl, struct SHEET *sht, int vx0, int vy0)
```


