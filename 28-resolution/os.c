#include "os.h"

void initBootInfo(struct BOOTINFO *pBootInfo);

static struct MEMMAN *memman = (struct MEMMAN *)0x100000;

#define COLOR_INVISIBLE 99

void CMain(void)
{
  //struct BOOTINFO *binfo = (struct BOOTINFO *) ADR_BOOTINFO;
  struct BOOTINFO bootInfo;
  initBootInfo(&bootInfo);
  struct BOOTINFO *binfo = &bootInfo;

  unsigned char s[40], mcursor[256], keybuf[32], mousebuf[128];
  io_sti();
  fifo8_init(&keyfifo, 32, keybuf);
  fifo8_init(&mousefifo, 128, mousebuf);

  int mx, my, i, j;

  init_keyboard();
  enable_mouse(&mdec);
  memman_init(memman);
  /*
    memman used 32k = 32 * 1024 = 32768 = 0x8000
    start = 0x10800
    length = 3FEF0000 - 0x8000 = 0x3FEE8000
  */
  memman_free(memman, 0x00108000, 0x3FEE8000);

  // int memTotal = memman_total(memman) / 1024 / 1024;
  // unsigned char *pMemTotal = intToHexStr(memTotal); // 0x3FE = 1022 M
  // showString(binfo->vgaRam, binfo->screenX, 17 * 8, 0, COL8_FFFFFF, pMemTotal);
  init_palette();
  // Setup sheets
  static struct SHTCTL *shtctl;
  shtctl = shtctl_init(memman, binfo->vgaRam, binfo->screenX, binfo->screenY);

  // Sheet -- Desktop
  unsigned char *buf_back = (unsigned char *)memman_alloc_4k(memman, binfo->screenX * binfo->screenY);
  struct SHEET *sht_back = sheet_alloc(shtctl);
  sheet_setbuf(sht_back, buf_back, binfo->screenX, binfo->screenY, COLOR_INVISIBLE);
  draw_desktop(buf_back, binfo->screenX, binfo->screenY);
  sheet_slide(shtctl, sht_back, 0, 0);

  // Sheet -- Mouse
  static unsigned char buf_mouse[256];
  struct SHEET *sht_mouse = sheet_alloc(shtctl);
  sheet_setbuf(sht_mouse, buf_mouse, 16, 16, COLOR_INVISIBLE);
  init_mouse_cursor(buf_mouse, COLOR_INVISIBLE); // draw mouse to buffer
  mx = (binfo->screenX - 16) / 2;                //鼠标初始位置
  my = (binfo->screenY - 28 - 16) / 2;
  sheet_slide(shtctl, sht_mouse, mx, my);

  // Sheet -- Messagebox
  unsigned char *buf_win = (unsigned char *)memman_alloc_4k(memman, 160 * 52);
  struct SHEET *sht_win = sheet_alloc(shtctl);
  sheet_setbuf(sht_win, buf_win, 160, 52, -1);
  static unsigned char win_title[11] = "Hello OS";
  draw_window(buf_win, 160, 52, win_title);
  sheet_slide(shtctl, sht_win, 80, 72);

  //  Set sheets order
  sheet_updown(shtctl, sht_back, 0);
  sheet_updown(shtctl, sht_win, 1);
  sheet_updown(shtctl, sht_mouse, 2);

  sheet_refresh(shtctl, sht_back, 0, 0, 320, 48);
  //-- Timer
  struct TIMER *timer, *timer2, *timer3;
  static struct FIFO8 timerfifo, timerfifo2, timerfifo3;
  static unsigned char timerbuf[8], timerbuf2[8], timerbuf3[8];
  init_pit();

  fifo8_init(&timerfifo, 8, timerbuf);
  timer = timer_alloc();
  timer_init(timer, &timerfifo, 1);
  // Timer 设置为1秒100次中断，500 次中断=5s
  timer_settime(timer, 500);

  fifo8_init(&timerfifo2, 8, timerbuf2);
  timer2 = timer_alloc();
  timer_init(timer2, &timerfifo2, 1);
  timer_settime(timer2, 300);

  fifo8_init(&timerfifo3, 8, timerbuf3);
  timer3 = timer_alloc();
  timer_init(timer3, &timerfifo3, 1);
  // Timer 设置为1秒100次中断，50 次中断=0.5s
  timer_settime(timer3, 50);

  int data = 0;
  for (;;)
  {
    io_cli();
    if (fifo8_status(&keyfifo)         //
            + fifo8_status(&mousefifo) // mouse
            + fifo8_status(&timerfifo) + fifo8_status(&timerfifo2) + fifo8_status(&timerfifo3) ==
        0)
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
        sheet_slide(shtctl, sht_mouse, mx, my);
      }
    }
    else if (fifo8_status(&timerfifo) != 0)
    {
      // Timer done
      io_sti();
      fifo8_get(&timerfifo);
      // draw timer count the messagebox
      unsigned char* s = intToHexStr(timer->timeout);
      boxfill8(buf_win, 160, COL8_C6C6C6, 40, 28, 119, 43);
      showString(buf_win, 160, 40, 28, COL8_000000, s);
      sheet_refresh(shtctl, sht_win, 40, 28, 119, 43);
    }
    else if (fifo8_status(&timerfifo2) != 0)
    {
      // Timer done
      io_sti();
      fifo8_get(&timerfifo2);
      // showString(buf_back, 320, 10, 10, COL8_000000, s);
    }
    else if (fifo8_status(&timerfifo3) != 0)
    {
      // Timer done
      int data = fifo8_get(&timerfifo3);

      if (data != 0)
      {
        timer_init(timer3, &timerfifo3, 0);
        boxfill8(buf_back, 320, COL8_FFFFFF, 8, 96, 15, 111);
      }
      else
      {
        timer_init(timer3, &timerfifo3, 1);
        boxfill8(buf_back, 320, COL8_008484, 8, 96, 15, 111);
      }
      sheet_refresh(shtctl, sht_back, 8, 96, 16, 112);

      timer_settime(timer3, 50);
      io_sti();
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
#include "timer.c"
