# Hello OS
[java开发操作系统内核：由实模式进入保护模式之32位寻址](https://blog.csdn.net/tyler_download/article/details/52021120)

https://www.bilibili.com/video/BV1hJ411n7rs?p=5

https://github.com/wycl16514/OS-Kernel-from-real-to-protected-mode

kernel.asm 会被编译成 kernel.bin 然后写到 image 的 0Head, 1Cylinder, 2Sec
```
  writeFileToFloppy("kernel.bin", false, 1, 2);
```
boot.asm  会被编译成 boot.bin 然后 写到 image的启动扇区，运行后会从image加载并kernel.bin 

发现一个问题：windows无法读取 image， 说明把kernel.bin 写入 image 破坏了文件系统，


