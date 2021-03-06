#include "os.h"
void make_textbox8(struct SHEET *sht, int x0, int y0, int sx, int sy, int c);
void drawStringOnSheet(struct SHEET *sht, int x, int y, int c, int b, unsigned char *s, int l);
void task_b_main(void);

void initBootInfo(struct BOOTINFO *pBootInfo);
static unsigned char strBuffer[10];

static struct MEMMAN *memman = (struct MEMMAN *)0x100000;

#define COLOR_INVISIBLE 99

static struct SHTCTL *shtctl;
static struct SHEET *sht_back;
static unsigned char *buf_back;

void CMain(void)
{
  //struct BOOTINFO *binfo = (struct BOOTINFO *) ADR_BOOTINFO;
  struct BOOTINFO bootInfo;
  initBootInfo(&bootInfo);
  struct BOOTINFO *binfo = &bootInfo;

  io_sti();
  memman_init(memman);
  /*
    memman used 32k = 32 * 1024 = 32768 = 0x8000
    start = 0x10800
    length = 3FEF0000 - 0x8000 = 0x3FEE8000
  */
  memman_free(memman, 0x00108000, 0x3FEE8000);
  init_palette();

  // Setup sheets
  shtctl = shtctl_init(memman, binfo->vgaRam, binfo->screenX, binfo->screenY);

  // Sheet -- Desktop
  buf_back = (unsigned char *)memman_alloc_4k(memman, binfo->screenX * binfo->screenY);
  sht_back = sheet_alloc(shtctl);
  sheet_setbuf(sht_back, buf_back, binfo->screenX, binfo->screenY, COLOR_INVISIBLE);
  draw_desktop(buf_back, binfo->screenX, binfo->screenY);
  sheet_slide(shtctl, sht_back, 0, 0);

  //  Set sheets order
  sheet_updown(shtctl, sht_back, 0);
  sheet_refresh(shtctl, sht_back, 0, 0, 320, 48);

  //-- Timer
  struct TIMER *timer;
  static struct FIFO8 timerfifo;
  static unsigned char timerbuf[8];
  init_pit();

  fifo8_init(&timerfifo, 8, timerbuf);
  timer = timer_alloc();
  timer_init(timer, &timerfifo, 1);
  timer_settime(timer, 100); // 1s

  //-- Timer for task switching
  mt_init();

  //-- switch task
  int addr_code32 = get_code32_addr(); // ASM code
  struct SEGMENT_DESCRIPTOR *gdt = (struct SEGMENT_DESCRIPTOR *)get_addr_gdt();

  static struct TSS32 tss_b, tss_a;
  tss_a.ldtr = 0;
  tss_a.iomap = 0x40000000;
  tss_b.ldtr = 0;
  tss_b.iomap = 0x40000000;

  set_segmdesc(gdt + 7, 103, (int)&tss_a, AR_TSS32);
  set_segmdesc(gdt + 8, 103, (int)&tss_a, AR_TSS32);
  set_segmdesc(gdt + 9, 103, (int)&tss_b, AR_TSS32);
  set_segmdesc(gdt + 6, 0xffff, (int)&task_b_main, 0x409a); // 0x409a executable

  load_tr(7 * 8);
  int task_b_esp = memman_alloc_4k(memman, 64 * 1024) + 64 * 1024;
	tss_b.eip = (int) &task_b_main;
	tss_b.eflags = 0x00000202; /* IF = 1; */
	tss_b.eax = 0;
	tss_b.ecx = 0;
	tss_b.edx = 0;
	tss_b.ebx = 0;
	tss_b.esp = task_b_esp;
	tss_b.ebp = 0;
	tss_b.esi = 0;
	tss_b.edi = 0;
	tss_b.es = 1 * 8;
	tss_b.cs = 2 * 8;
	tss_b.ss = 1 * 8;
	tss_b.ds = 1 * 8;
	tss_b.fs = 1 * 8;
	tss_b.gs = 1 * 8;

  *((int *) 0x0fec) = (int) sht_back;

  int data = 0;
  int pos = 8;

  for (;;)
  {
    io_cli();
    if ( fifo8_status(&timerfifo) == 0)
    {
      io_stihlt();
    }
    else if (fifo8_status(&timerfifo) != 0)
    {
      // Timer done
      data = fifo8_get(&timerfifo);
      if (data == 1)
      {
        strBuffer[0] = 'A';
        strBuffer[1] = 0;
        timer_settime(timer, 100);
        drawStringOnSheet(sht_back, pos, 32, COL8_FFFFFF, COL8_008484, strBuffer, 2);
        if (pos < 320 - 10 - 8)
        {
          pos += 8;
        }
      }
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

void drawStringOnSheet(struct SHEET *sht, int x, int y, int c, int b, unsigned char *s, int l)
{
  boxfill8(sht->buf, sht->bxsize, b, x, y, x + l * 8 - 1, y + 15);
  showString(sht->buf, sht->bxsize, x, y, c, s);
  sheet_refresh(sht->ctl, sht, x, y, x + l * 8, y + 16);
  return;
}

void task_b_main()
{
  static struct FIFO8 timerinfo_b;
  static unsigned char timerbuf_b[8];
  static struct TIMER *timer_b = 0;
  int i = 0;

  fifo8_init(&timerinfo_b, 8, timerbuf_b);
  timer_b = timer_alloc();
  timer_init(timer_b, &timerinfo_b, 123);

  timer_settime(timer_b, 100);
  int pos = 0;
  struct SHEET *sht_back;  
  sht_back = (struct SHEET *) *((int *) 0x0fec);  
  for (;;)
  {
    io_cli();
    if (fifo8_status(&timerinfo_b) == 0)
    {
      io_sti();
    }
    else
    {
      i = fifo8_get(&timerinfo_b);
      io_sti();
      if (i == 123)
      {
        strBuffer[0] = 'B';
        strBuffer[1] = 0;
        drawStringOnSheet(sht_back, 0, 48, COL8_FFFFFF, COL8_008484, strBuffer, 2);
        timer_settime(timer_b, 100);
        pos += 8;
      }
    }
  }
}

#include "string.c"
#include "graphics.c"
#include "fifo.c"
#include "keyboard.c"
#include "mouse.c"
#include "memory.c"
#include "sheet.c"
#include "timer.c"
#include "mtask.c"
