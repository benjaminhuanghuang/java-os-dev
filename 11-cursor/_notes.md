
# Hello OS
[绘制系统内核字体](https://blog.csdn.net/tyler_download/article/details/52636761)


https://www.bilibili.com/video/BV1hJ411n7rs?p=10

## Create font data
用工具 makeFont 将字体文件(text)读入，转换汇编代码(fontData.inc)

代码见 make-font

makeFont程序的逻辑简单，只是把一行一行的文件读入，把一行中的”.”当做0，”*”当做1，然后转换成16进制数写入文件fontData.inc

## 使用
将包含字体数据的fontData.inc文件include到内核文件kernel.asm里，C语言程序中直接使用

在C语言中，明一个外部变量数组:
```
  extern char systemFont[16]
```
要想绘制某个字符，例如字符B,可以使用以下调用
```
  showFont8(vram, xsize, 20, 20, COL8_FFFFFF, systemFont+'A'*16);
```
