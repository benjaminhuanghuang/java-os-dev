#include "os.h"


void initBootInfo(struct BOOTINFO *pBootInfo);


void CMain(void)
{
  //struct BOOTINFO *binfo = (struct BOOTINFO *) ADR_BOOTINFO;
  struct BOOTINFO bootInfo;
  initBootInfo(&bootInfo);
  struct BOOTINFO *binfo = &bootInfo;
  
	unsigned char s[40], mcursor[256], keybuf[32], mousebuf[128];
  fifo8_init(&keyfifo, 32, keybuf);
  fifo8_init(&mousefifo, 128, mousebuf);
  
  int mx, my, i, j;
  struct MOUSE_DEC mdec;


  init_keyboard();

  init_palette();

  draw_desktop(binfo->vgaRam, binfo->screenX, binfo->screenY);

  //鼠标初始位置
  mx = (binfo->screenX - 16) / 2;
  my = (binfo->screenY - 28 - 16) / 2;

  //初始化存储鼠标形状颜色的数组(16*16)
  init_mouse_cursor(mcursor, COL8_008484);
  //绘制鼠标
  putblock(binfo->vgaRam, binfo->screenX, 16, 16, mx, my, mcursor, 16);

  io_sti();
  enable_mouse(&mdec);

  int data = 0;
  for (;;)
  {
    io_cli();
    if (fifo8_status(&keyfifo) + fifo8_status(&mousefifo) == 0)
    {
      io_stihlt();
    }
    else if (fifo8_status(&keyfifo) != 0)
    {
      show_key_info(binfo->vgaRam, binfo->screenX);
    }
    else if (fifo8_status(&mousefifo) != 0)
    {
      show_mouse_info(binfo->vgaRam, binfo->screenX);
    }
  }
}

void initBootInfo(struct BOOTINFO *pBootInfo)
{
  pBootInfo->vgaRam = (unsigned char *)0xa0000;
  pBootInfo->screenX = 320;
  pBootInfo->screenY = 200;
}


#include "string.c"
#include "graphics.c"
#include "fifo.c"
#include "keyboard.c"
#include "mouse.c"
