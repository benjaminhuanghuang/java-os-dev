# Hello OS
[java开发操作系统内核：由实模式进入保护模式之32位寻址](https://blog.csdn.net/tyler_download/article/details/52021120)

https://www.bilibili.com/video/BV1hJ411n7rs?p=5

https://github.com/wycl16514/OS-Kernel-from-real-to-protected-mode


C编译器通常只能生成32位模式的机器语言。如果一定要生成16位模式机器语言，虽然也不是做不到，但是很费事，还没什么好处。

CPU有16位和32位两种模式。如果以16位模式启动的话，用AX和CX等16位寄存器会非常方便，但反过来，像EAX和ECX等32位的寄存器，使用起来就很麻烦。另外，16位模式和32位模式中，机器语言的命令代码不一样。同样的机器语言，解释的方法也不一样，所以16位模式的机器语言在32位模式下不能运行，反之亦然。

32位模式下可以使用的内存容量远远大于1MB。另外，CPU的自我保护功能（识别出可疑的机器语言并进行屏蔽，以免破坏系统）在16位下不能用，但32位下能用

