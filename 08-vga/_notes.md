
# Hello OS
[利用C语言绘制操作系统图像界面](https://blog.csdn.net/tyler_download/article/details/52523237)

https://www.bilibili.com/video/BV1hJ411n7rs?p=8

https://blog.csdn.net/qq_31567335/article/details/100600709

## 加载 kernel
注意这次的kernel.bin > 512 bytes, 因此要加载两个 sector


由字符模式转入图形模式，需要向显卡发送命令，让其进入图形显示模式，操作硬件需要使用BIOS调用，打开VGA显卡图形模式：
```
  mov  al, 0x13h     # vga mode
  mov  ah, 0x00
  int  0x10
```
其中al 的值决定了要设置显卡的色彩模式，下面是一些常用的模式设置：
1. 0x03, 16色字符模式
2. 0x12, VGA图形模式, 640 * 480 * 4位彩色模式，独特的4面存储模式
3. `0x13`, VGA图形模式, 320 * 200 * 8位彩色模式，调色板模式
4. 0x6a, 扩展VGA图形模式， 800 * 600 * 4彩色模式

我们采用的是0x13模式，其中320*200*8 中，最后的数值8表示的是色彩值得位数，也就是我们可以用8位数值表示色彩，总共可以显示256种色彩。

系统显存的地址是0x000a0000，当我们执行上面几句代码后，向显存地址写入数据，屏幕就会出现相应的变化了

## Boot loader
  注意本节 kernel 代码大于 512 K， 因此需要修改boot.asm 加载 2 个扇区

## ASM code call C code
  C -> obj -> asm -> include into kernel.asm


## ASM code setup stack for C code 
