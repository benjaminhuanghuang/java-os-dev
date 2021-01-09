
# Hello OS
[消除图层刷新而导致的严重闪烁-1](https://blog.csdn.net/tyler_download/article/details/53390893)


https://www.bilibili.com/video/BV1hJ411n7rs?p=24



一个窗体度是10，那么它刷新时，高度为0到9的窗体根本不需要跟着刷新，如果高度低的窗体跟着刷新，不但产生闪烁的效果，而且是毫无必要的浪费CPU资源，接下来我们的改进就是，当窗体刷新时，只刷新同一层高度或高度更高的图层，因此给sheet_refreshsub添加一个新参数 height
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

