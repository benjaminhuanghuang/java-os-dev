
# Hello OS
[改进分辨率和按键响应](https://blog.csdn.net/tyler_download/article/details/53610141)


https://www.bilibili.com/video/BV1hJ411n7rs?p=28


1. Change resolution to 480*640 by uing BIOS 0x10
并且显存地址起始地址将不再是0xa00000, 变为0xe0000000.
```
    mov   bx, 0x4101
    mov   ax, 0x4f02
    int   0x10
```
Chang boot info
```
void initBootInfo(struct BOOTINFO *pBootInfo) {
    pBootInfo->vgaRam = (char*)0xe0000000;
    pBootInfo->screenX = 640;
    pBootInfo->screenY = 480;
}
```