
# Hello OS
[实现回车键的处理](https://blog.csdn.net/tyler_download/article/details/60573125)


https://www.bilibili.com/video/BV1hJ411n7rs?p=43


按下回车，控制台会启动新的一行，此时如果点击字母按钮，那么字母会出现在新起的一行，同时光标会在新启的一行闪烁。

先定义回车键扫描码的数值`0x1C`, 当回车键按下后，主进程会把扫描码发送给控制台进程的主函数，在控制台进程主函数中，一旦接受到回车键消息时，把cursor_y的值加上16，也就是一个字符的高度，cursor_y将作为新的显示纵坐标，