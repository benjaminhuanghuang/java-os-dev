

在计算机硬件中，有一个隐含的寄存器叫FLACS, 当BIOS调用出现错误时，FLACS寄存器的 CF 位会置1，同时把错误代码存入AH,
如果没有错，那么FLACS寄存器的CF位会设置为0，所以 
`JC error` 等同于
```
if (FLACS.CF == 1) {
  error();
}
```
