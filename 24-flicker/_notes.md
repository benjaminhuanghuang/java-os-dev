
# Hello OS
[消除图层刷新而导致的严重闪烁-1](https://blog.csdn.net/tyler_download/article/details/53390893)


https://www.bilibili.com/video/BV1hJ411n7rs?p=24

首先演示一个闪烁的问题
在系统入口函数的主循环中， 增加一个计数，让该计数不断变化，然后把变化后的数值转换为字符串再写到MessboxBox的主窗体里，由于写字符串时，需要更新窗体图层，因此上面的代码会引发图层频繁的更新，这就导致一个非常严重的闪烁现象


一个窗体刷新时，高度小于它到窗体根本不需要跟着刷新，
改进: 当窗体刷新时，只刷新同一层高度或高度更高的图层，因此给sheet_refreshsub添加一个新参数 height, 把当前更新图层所在的高度传进去。
```
void sheet_refreshsub(struct SHTCTL *ctl, int vx0, int vy0, int vx1, int vy1, int height) {
    ....
    for (h = height; h <= ctl->top; h++) {
       .....
    } 

    .....
}
```
for 循环不再从0开始，而是从height开始，也就是从当前图层的高度往上进行刷新。

