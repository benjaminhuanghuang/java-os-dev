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

  int memCount = get_memory_block_count();
  struct AddrRangeDesc* memDesc = (struct AddrRangeDesc*)get_adr_buffer();

  int data = 0;
  int count = 0;
  for (;;)
  {
    io_cli();
    if (fifo8_status(&keyfifo) + fifo8_status(&mousefifo) == 0)
    {
      io_stihlt();
    }
    else if (fifo8_status(&keyfifo) != 0)
    {
      //show_key_info(binfo->vgaRam, binfo->screenX);
      io_sti();
      data = fifo8_get(&keyfifo);

      if (data == 0x1C) {
        // Enter key
        showMemoryInfo( memDesc + count, binfo->vgaRam, count, binfo->screenX, COL8_FFFFFF);
        count = (count+1);
        if (count > memCount) {
          count = 0;
        }
      }
    }
    else if (fifo8_status(&mousefifo) != 0)
    {
      data = fifo8_get(&mousefifo);
      io_sti();

      if (mouse_decode(&mdec, data) != 0)
      {
        //show_mouse_info(binfo->vgaRam, binfo->screenX);
        // erease the mosue
        boxfill8(binfo->vgaRam, binfo->screenX, COL8_008484, mx, my, mx + 15, my + 15);
        mx += mdec.x;
        my += mdec.y;
        if (mx < 0)
        {
          mx = 0;
        }
        if (my < 0)
        {
          my = 0;
        }
        if (mx > binfo->screenX - 16)
        {
          mx = binfo->screenX - 16;
        }
        if (my > binfo->screenY - 16)
        {
          my = binfo->screenY - 16;
        }
        putblock(binfo->vgaRam, binfo->screenX, 16, 16, mx, my, mcursor, 16);
      }
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
#include "memory.c"
