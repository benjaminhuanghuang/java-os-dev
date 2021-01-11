#include "os.h"
void make_textbox8(struct SHEET *sht, int x0, int y0, int sx, int sy, int c);
void drawStringOnSheet(struct SHEET *sht, int x, int y, int c, int b, unsigned char *s, int l);

// the scean code when key pressed
static char keytable[0x54] = {
    0, 0, '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-', '^', 0, 0,
    'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', '@', '[', 0, 0, 'A', 'S',
    'D', 'F', 'G', 'H', 'J', 'K', 'L', ';', ':', 0, 0, ']', 'Z', 'X', 'C', 'V',
    'B', 'N', 'M', ',', '.', '/', 0, '*', 0, ' ', 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, '7', '8', '9', '-', '4', '5', '6', '+', '1',
    '2', '3', '0', '.'};

void initBootInfo(struct BOOTINFO *pBootInfo);
static unsigned char strBuffer[10];

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
  int cursor_x = 8, cursor_c = COL8_FFFFFF;
  sheet_setbuf(sht_win, buf_win, 160, 52, -1);
  static unsigned char win_title[11] = "Hello OS";
  draw_window(buf_win, 160, 52, win_title);
  make_textbox8(sht_win, 8, 28, 144, 16, COL8_FFFFFF);
  sheet_slide(shtctl, sht_win, 80, 72);

  //  Set sheets order
  sheet_updown(shtctl, sht_back, 0);
  sheet_updown(shtctl, sht_win, 1);
  sheet_updown(shtctl, sht_mouse, 2);

  sheet_refresh(shtctl, sht_back, 0, 0, 320, 48);
  //-- Timer
  struct TIMER *timer;
  static struct FIFO8 timerfifo;
  static unsigned char timerbuf[8];
  init_pit();

  fifo8_init(&timerfifo, 8, timerbuf);
  timer = timer_alloc();
  timer_init(timer, &timerfifo, 1);
  // Timer 设置为1秒100次中断，50 次中断=0.5s
  timer_settime(timer, 50);

  int data = 0;
  for (;;)
  {
    io_cli();
    if (fifo8_status(&keyfifo)         //
            + fifo8_status(&mousefifo) // mouse
            + fifo8_status(&timerfifo) ==
        0)
    {
      io_stihlt();
    }
    else if (fifo8_status(&keyfifo) != 0)
    {
      data = fifo8_get(&keyfifo);
      io_sti();
      if (data < 0x54 && keytable[data] != 0 && cursor_x < 144)
      {
        boxfill8(sht_win->buf, sht_win->bxsize, COL8_FFFFFF, cursor_x, 28, cursor_x + 7, 43);
        sheet_refresh(shtctl, sht_win, cursor_x, 28, cursor_x + 8, 44);

        strBuffer[0] = keytable[data];
        strBuffer[1] = 0;
        // draw timer count the messagebox
        drawStringOnSheet(sht_win, cursor_x, 28, COL8_000000, COL8_FFFFFF, strBuffer, 1);
        cursor_x += 8;
      }
      else if (data == 0x0e)
      {
        strBuffer[0] = ' ';
        strBuffer[1] = 0;
        // draw timer count the messagebox
        drawStringOnSheet(sht_win, cursor_x, 28, COL8_000000, COL8_FFFFFF, strBuffer, 1);
        cursor_x -= 8;
      }
      boxfill8(sht_win->buf, sht_win->bxsize, cursor_c, cursor_x, 28, cursor_x + 7, 43);
      sheet_refresh(shtctl, sht_win, cursor_x, 28, cursor_x + 8, 44);
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

        if ((mdec.btn & 0x01) != 0) // left button is pressed
        {
          sheet_slide(shtctl, sht_win, mx - 80, my - 8);
        }
      }
    }
    else if (fifo8_status(&timerfifo) != 0)
    {
      // Timer done
      int data = fifo8_get(&timerfifo);

      if (data != 0)
      {
        timer_init(timer, &timerfifo, 0);
        cursor_c = COL8_000000;
      }
      else
      {
        timer_init(timer, &timerfifo, 1);
        cursor_c = COL8_FFFFFF;
      }
      timer_settime(timer, 50);
      boxfill8(sht_win->buf, sht_win->bxsize, cursor_c, cursor_x, 28, cursor_x + 7, 43);
      sheet_refresh(shtctl, sht_win, cursor_x, 28, cursor_x + 8, 44);
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

void make_textbox8(struct SHEET *sht, int x0, int y0, int sx, int sy, int c)
{
  int x1 = x0 + sx, y1 = y0 + sy;
  boxfill8(sht->buf, sht->bxsize, COL8_848484, x0 - 2, y0 - 3, x1 + 1, y0 - 3);
  boxfill8(sht->buf, sht->bxsize, COL8_848484, x0 - 3, y0 - 3, x0 - 3, y1 + 1);
  boxfill8(sht->buf, sht->bxsize, COL8_FFFFFF, x0 - 3, y1 + 2, x1 + 1, y1 + 2);
  boxfill8(sht->buf, sht->bxsize, COL8_FFFFFF, x1 + 2, y0 - 3, x1 + 2, y1 + 2);
  boxfill8(sht->buf, sht->bxsize, COL8_000000, x0 - 1, y0 - 2, x1 + 0, y0 - 2);
  boxfill8(sht->buf, sht->bxsize, COL8_000000, x0 - 2, y0 - 2, x0 - 2, y1 + 0);
  boxfill8(sht->buf, sht->bxsize, COL8_C6C6C6, x0 - 2, y1 + 1, x1 + 0, y1 + 1);
  boxfill8(sht->buf, sht->bxsize, COL8_C6C6C6, x1 + 1, y0 - 2, x1 + 1, y1 + 1);
  boxfill8(sht->buf, sht->bxsize, c, x0 - 1, y0 - 1, x1 + 0, y1 + 0);
  return;
}

void drawStringOnSheet(struct SHEET *sht, int x, int y, int c, int b, unsigned char *s, int l)
{
  boxfill8(sht->buf, sht->bxsize, b, x, y, x + l * 8 - 1, y + 15);
  showString(sht->buf, sht->bxsize, x, y, c, s);
  sheet_refresh(sht->ctl, sht, x, y, x + l * 8, y + 16);
  return;
}

#include "string.c"
#include "graphics.c"
#include "fifo.c"
#include "keyboard.c"
#include "mouse.c"
#include "memory.c"
#include "sheet.c"
#include "timer.c"
