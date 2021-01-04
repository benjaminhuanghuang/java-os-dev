# Hello OS
[C语言结合汇编开发系统内核](https://blog.csdn.net/tyler_download/article/details/52468520)

https://www.bilibili.com/video/BV1hJ411n7rs?p=7

http://pan.baidu.com/s/1kVlmQGn

[objconv](https://github.com/vertis/objconv)

Or
```
$ wget http://www.agner.org/optimize/objconv.zip
$ ./build.sh 
```

在这个例子中，源代码包含两个文件：foo.asm, 和 bar.c.
程序入口在foo.asm 中，程序先从foo.asm中的_start处开始执行，在_start中，调用一个函数叫bar_func, 而bar_func 函数由bar.c模块来实现，
而bar.c实现的bar_func函数中，又调用一个来自foo.asm实现的函数，叫foo_print,


在foo.asm 中 由于需要调用bar.c中的函数，所以开始先要使用extern 声明。
由于_start要导出作为整个可执行程序的入口，因此要用global关键字声明，foo.asm中的foo_print要导出给其他接口使用，也要用global声明


在_start中，在调用bar_func函数前，需要传入参数，C语言的参数传递是通过堆栈实现的，最右边的参数先压入堆栈，
```
  _start:
    mov   eax, dword[arg1]
    push  eax
    mov   eax, dword [arg2]
    push  eax
    call  bar_func
```
代码中，我们先压入arg1, 然后再压入arg2,所以就相当于以如下方式调用来自C语言模块的接口:
```
  bar_func(arg2, arg1);
```

根据C语言的函数调用规则，堆栈的回收由调用者负责，所以在_start中，bar_func调用结束后，需要调整堆栈指针esp, 
```
  add esp ，8 
```
将堆栈指针往下移动8字节，这就将开头压入堆栈的两个4字节参数，arg1,arg2从堆栈上删除了。

在c语言代码中对汇编语言函数的调用为
```
  foo_print("the 1st one\n", 13);
```
在汇编代码中
```
  foo_print:
    mov   edx, [esp + 8]
    mov   ecx, [esp + 4]
    mov   ebx, 1
    mov   eax, 4
    int   0x80
    ret
```
[esp+8] 对应于第二个参数, [esp+4]对应第一个参数。

## 编译
```
nasm -f elf32 -o foo.o foo.asm

gcc -m32 -c -o bar.o bar.c

ld -m elf_i386 -o foobar foo.o bar.o
```

但这种做法有一个问题，就是最终编译成的可执行文件是elf格式，但我们要开发的是系统内核，如果将内核编译成elf格式，就不能直接将内核加载到内存直接执行。

## 编译 2
将C语言编译或的.o模块反汇编，将反汇编的代码贴到foo.asm里面，从而形成单个asm文件，最后编译这个整合在一起的汇编文件，直接生成二进制可执行代码

```
  gcc -m32 -fno-asynchronous-unwind-tables -s -c -o bar.o bar.c

  objconv -fnasm bar.o -o bar.asm
```

