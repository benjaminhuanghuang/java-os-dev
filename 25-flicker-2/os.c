#include "os.h"

void initBootInfo(struct BOOTINFO *pBootInfo);

static struct MEMMAN *memman = (struct MEMMAN *)0x100000;
static unsigned char *buf_back, buf_mouse[256];

#define COLOR_INVISIBLE 99
static struct SHTCTL *shtctl;
static struct SHEET *sht_back = 0, *sht_mouse = 0;

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

  memman_init(memman);
  /*
    memman used 32k = 32 * 1024 = 32768 = 0x8000
    start = 0x10800
    length = 3FEF000 = 0x800 = 0x3FEE8000
  */
  // memman_free(memman, 0x001008000, 0x3FEE8000);
  memman_free(memman, 0x00001000, 0x0009e000); /* 0x00001000 - 0x0009efff */
	// memman_free(memman, 0x00400000, memtotal - 0x00400000);
  /*
    Setup sheets
  */
  shtctl = shtctl_init(memman, binfo->vgaRam, binfo->screenX, binfo->screenY);
  sht_back = sheet_alloc(shtctl);
  sht_mouse = sheet_alloc(shtctl);
  buf_back = (unsigned char *)memman_alloc(memman, binfo->screenX * binfo->screenY);

  // set buffer to sheet
  sheet_setbuf(sht_back, buf_back, binfo->screenX, binfo->screenY, -1);
  sheet_setbuf(sht_mouse, buf_mouse, 16, 16, COLOR_INVISIBLE);

  draw_desktop(buf_back, binfo->screenX, binfo->screenY);
  //初始化存储鼠标形状颜色的数组(16*16)
  init_mouse_cursor(buf_mouse, COLOR_INVISIBLE);
  sheet_slide(shtctl, sht_back, 0, 0);

  //鼠标初始位置
  mx = (binfo->screenX - 16) / 2;
  my = (binfo->screenY - 28 - 16) / 2;

  sheet_slide(shtctl, sht_mouse, mx, my);
  
  sheet_updown(shtctl, sht_back, 0);
  sheet_updown(shtctl, sht_mouse, 1);

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
      //show_key_info(binfo->vgaRam, binfo->screenX);
      io_sti();
      data = fifo8_get(&keyfifo);
    }
    else if (fifo8_status(&mousefifo) != 0)
    {
      data = fifo8_get(&mousefifo);
      io_sti();

      if (mouse_decode(&mdec, data) != 0)
      {
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
        sheet_refresh(shtctl, sht_back, 0, 0, 80, 16);
        sheet_slide(shtctl, sht_mouse, mx, my);
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
#include "sheet.c"
