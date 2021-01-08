#define COL8_000000 0
#define COL8_FF0000 1
#define COL8_00FF00 2
#define COL8_FFFF00 3
#define COL8_0000FF 4
#define COL8_FF00FF 5
#define COL8_00FFFF 6
#define COL8_FFFFFF 7
#define COL8_C6C6C6 8
#define COL8_840000 9
#define COL8_008400 10
#define COL8_848400 11
#define COL8_000084 12
#define COL8_840084 13
#define COL8_008484 14
#define COL8_848484 15

extern void io_hlt(void);
extern void io_sti(void);
extern void io_cli(void);
extern void io_stihlt(void);
extern void io_out8(int port, int data);
extern int io_in8(int port);
extern int io_load_eflags(void);
extern void io_store_eflags(int eflags);

void init_palette(void);
void set_palette(int start, int end, unsigned char *rgb);
void boxfill8(unsigned char *vram, int xsize, unsigned char c, int x, int y, int x0, int y0);

extern char systemFont[];
struct BOOTINFO
{
  unsigned char *vgaRam;
  short screenX, screenY;
};
static struct BOOTINFO bootInfo;

void showFont8(unsigned char *vram, int xsize, int x, int y, char c, char *font);
void showString(unsigned char *vram, int xsize,
                int x, int y, char color,
                unsigned char *s);

void putblock(unsigned char *vram, int vxsize, int pxsize,
              int pysize, int px0, int py0, char *buf, int bxsize);

void intHandlerFromC(char *esp);
void init_mouse_cursor(char *mouse, char b);
static char mcursor[256];
void initBootInfo(struct BOOTINFO *pBootInfo);
//
#define PORT_KEYDAT 0x0060
#define PIC_OCW2 0x20
#define PIC1_OCW2 0xA0

/*
  FIFO
*/
struct FIFO8
{
  unsigned char *buf;
  int p, q, size, free, flags;
};

static struct FIFO8 keyinfo;
static struct FIFO8 mouseinfo;
static unsigned char keybuf[32];
static unsigned char mousebuf[128];

struct MOUSE_DEC
{
  unsigned char buf[3], phase;
  int x, y, btn;
};

static struct MOUSE_DEC mdec;
static int mx = 0, my = 0;
static int xsize = 0, ysize = 0;

void fifo8_init(struct FIFO8 *fifo, int size, unsigned char *buf);
int fifo8_put(struct FIFO8 *fifo, unsigned char data);
int fifo8_get(struct FIFO8 *fifo);
int fifo8_status(struct FIFO8 *fifo);

void init_keyboard(void);

unsigned char charToHexVal(unsigned char c);
unsigned char *charToHexStr(unsigned char c);
static unsigned char keyval[5] = {'0', 'X', 0, 0, 0};

void init_keyboard(void);
void enable_mouse();
void intHandlerForKeyboard(char *esp);
void intHandlerForMouse(char *esp);
void eraseMouse(unsigned char *vram);
void drawMouse(unsigned char *vram);
void computeMousePosition(struct MOUSE_DEC *mdec);
int mouse_decode(struct MOUSE_DEC *mdec, unsigned char dat);
void show_key_info();
void show_mouse_info();
void show_sth();

void CMain(void)
{
  initBootInfo(&bootInfo);
  unsigned char *vram = bootInfo.vgaRam;
  xsize = bootInfo.screenX;
  ysize = bootInfo.screenY;

  fifo8_init(&keyinfo, 32, keybuf);
  fifo8_init(&mouseinfo, 128, mousebuf);

  init_keyboard();

  init_palette();

  //绘制桌面背景
  boxfill8(vram, xsize, COL8_008484, 0, 0, xsize - 1, ysize - 29);
  boxfill8(vram, xsize, COL8_C6C6C6, 0, ysize - 28, xsize - 1, ysize - 28);
  boxfill8(vram, xsize, COL8_FFFFFF, 0, ysize - 27, xsize - 1, ysize - 27);
  boxfill8(vram, xsize, COL8_C6C6C6, 0, ysize - 26, xsize - 1, ysize - 1);

  boxfill8(vram, xsize, COL8_FFFFFF, 3, ysize - 24, 59, ysize - 24);
  boxfill8(vram, xsize, COL8_FFFFFF, 2, ysize - 24, 2, ysize - 4);
  boxfill8(vram, xsize, COL8_848484, 3, ysize - 4, 59, ysize - 4);
  boxfill8(vram, xsize, COL8_848484, 59, ysize - 23, 59, ysize - 5);
  boxfill8(vram, xsize, COL8_000000, 2, ysize - 3, 59, ysize - 3);
  boxfill8(vram, xsize, COL8_000000, 60, ysize - 24, 60, ysize - 3);

  boxfill8(vram, xsize, COL8_848484, xsize - 47, ysize - 24, xsize - 4, ysize - 24);
  boxfill8(vram, xsize, COL8_848484, xsize - 47, ysize - 23, xsize - 47, ysize - 4);
  boxfill8(vram, xsize, COL8_FFFFFF, xsize - 47, ysize - 3, xsize - 4, ysize - 3);
  boxfill8(vram, xsize, COL8_FFFFFF, xsize - 3, ysize - 24, xsize - 3, ysize - 3);

  //鼠标初始位置
  mx = (xsize - 16) / 2;
  my = (ysize - 28 - 16) / 2;

  //初始化存储鼠标形状颜色的数组(16*16)
  init_mouse_cursor(mcursor, COL8_008484);
  //绘制鼠标
  putblock(vram, xsize, 16, 16, mx, my, mcursor, 16);

  io_sti();
  enable_mouse(&mdec);

  int data = 0;
  for (;;)
  {
    io_cli();
    if (fifo8_status(&keyinfo) + fifo8_status(&mouseinfo) == 0)
    {
      io_stihlt();
    }
    else if (fifo8_status(&keyinfo) != 0)
    {
      show_key_info();
    }
    else if (fifo8_status(&mouseinfo) != 0)
    {
      show_mouse_info();
    }
  }
}

void initBootInfo(struct BOOTINFO *pBootInfo)
{
  pBootInfo->vgaRam = (unsigned char *)0xa0000;
  pBootInfo->screenX = 320;
  pBootInfo->screenY = 200;
}

void init_palette(void)
{
  // value of 16 colors
  static unsigned char table_rgb[16 * 3] = {
      0x00, 0x00, 0x00, /*  0:黒 */
      0xff, 0x00, 0x00, /*  1:明るい赤 */
      0x00, 0xff, 0x00, /*  2:明るい緑 */
      0xff, 0xff, 0x00, /*  3:明るい黄色 */
      0x00, 0x00, 0xff, /*  4:明るい青 */
      0xff, 0x00, 0xff, /*  5:明るい紫 */
      0x00, 0xff, 0xff, /*  6:明るい水色 */
      0xff, 0xff, 0xff, /*  7:白 */
      0xc6, 0xc6, 0xc6, /*  8:明るい灰色 */
      0x84, 0x00, 0x00, /*  9:暗い赤 */
      0x00, 0x84, 0x00, /* 10:暗い緑 */
      0x84, 0x84, 0x00, /* 11:暗い黄色 */
      0x00, 0x00, 0x84, /* 12:暗い青 */
      0x84, 0x00, 0x84, /* 13:暗い紫 */
      0x00, 0x84, 0x84, /* 14:暗い水色 */
      0x84, 0x84, 0x84  /* 15:暗い灰色 */
  };

  set_palette(0, 15, table_rgb);
  return;
}

void set_palette(int start, int end, unsigned char *rgb)
{
  int i, eflags;
  // preserve eflags
  eflags = io_load_eflags();
  // disable interupt
  io_cli();
  // write port
  io_out8(0x03c8, start); //set  palette number
  for (i = start; i <= end; i++)
  {
    io_out8(0x03c9, rgb[0] / 4);
    io_out8(0x03c9, rgb[1] / 4);
    io_out8(0x03c9, rgb[2] / 4);

    rgb += 3;
  }
  // recover eflags
  io_store_eflags(eflags);
  return;
}

void boxfill8(unsigned char *vram, int xsize, unsigned char c,
              int x0, int y0, int x1, int y1)
{
  int x, y;
  for (y = y0; y <= y1; y++)
    for (x = x0; x <= x1; x++)
    {
      vram[y * xsize + x] = c;
    }
}

void showFont8(unsigned char *vram, int xsize, int x, int y, char c, char *font)
{
  int i;
  char d;

  for (i = 0; i < 16; i++)
  {
    d = font[i];
    if ((d & 0x80) != 0)
    {
      vram[(y + i) * xsize + x + 0] = c;
    }
    if ((d & 0x40) != 0)
    {
      vram[(y + i) * xsize + x + 1] = c;
    }
    if ((d & 0x20) != 0)
    {
      vram[(y + i) * xsize + x + 2] = c;
    }
    if ((d & 0x10) != 0)
    {
      vram[(y + i) * xsize + x + 3] = c;
    }
    if ((d & 0x08) != 0)
    {
      vram[(y + i) * xsize + x + 4] = c;
    }
    if ((d & 0x04) != 0)
    {
      vram[(y + i) * xsize + x + 5] = c;
    }
    if ((d & 0x02) != 0)
    {
      vram[(y + i) * xsize + x + 6] = c;
    }
    if ((d & 0x01) != 0)
    {
      vram[(y + i) * xsize + x + 7] = c;
    }
  }
}

void showString(unsigned char *vram, int xsize, int x, int y, char color, unsigned char *s)
{
  for (; *s != 0x00; s++)
  {
    showFont8(vram, xsize, x, y, color, systemFont + *s * 16);
    x += 8;
  }
}

void init_mouse_cursor(char *mouse, char bc)
{
  static char cursor[16][16] = {
      "**************..",
      "*OOOOOOOOOOO*...",
      "*OOOOOOOOOO*....",
      "*OOOOOOOOO*.....",
      "*OOOOOOOO*......",
      "*OOOOOOO*.......",
      "*OOOOOOO*.......",
      "*OOOOOOOO*......",
      "*OOOO**OOO*.....",
      "*OOO*..*OOO*....",
      "*OO*....*OOO*...",
      "*O*......*OOO*..",
      "**........*OOO*.",
      "*..........*OO0*",
      "............*OO*",
      ".............***"};

  int x, y;
  for (y = 0; y < 16; y++)
  {
    for (x = 0; x < 16; x++)
    {
      if (cursor[y][x] == '*')
      {
        mouse[y * 16 + x] = COL8_000000;
      }
      if (cursor[y][x] == 'O')
      {
        mouse[y * 16 + x] = COL8_FFFFFF;
      }
      if (cursor[y][x] == '.')
      {
        mouse[y * 16 + x] = bc;
      }
    }
  }
}

void putblock(unsigned char *vram, int vxsize, int pxsize, int pysize, int px0,
              int py0, char *buf, int bxsize)
{
  int x, y;
  for (y = 0; y < pysize; y++)
  {
    for (x = 0; x < pxsize; x++)
    {
      vram[(py0 + y) * vxsize + (px0 + x)] = buf[y * bxsize + x];
    }
  }
}

void intHandlerFromC(char *esp)
{
}

/*
 interupt handler for keyboard
 read data and put it to keyboard FIFO buffer
*/
void intHandlerForKeyboard(char *esp)
{
  io_out8(PIC_OCW2, 0x20);
  unsigned char data = 0;
  data = io_in8(PORT_KEYDAT);
  fifo8_put(&keyinfo, data);
}

/*
 interupt handler for mouse
 read data and put it to mouse FIFO buffer
*/
void intHandlerForMouse(char *esp)
{
  unsigned char data;
  io_out8(PIC1_OCW2, 0x20);
  io_out8(PIC_OCW2, 0x20);

  data = io_in8(PORT_KEYDAT);
  fifo8_put(&mouseinfo, data);
}

unsigned char charToHexVal(unsigned char c)
{
  if (c >= 10)
  {
    return 'A' + c - 10;
  }

  return '0' + c;
}

unsigned char *charToHexStr(unsigned char c)
{
  int i = 0;
  char mod = c % 16;
  keyval[3] = charToHexVal(mod);
  c = c / 16;
  keyval[2] = charToHexVal(c);

  return keyval;
}
#define PORT_KEYSTA 0x0064
#define PORT_KEYCMD 0x0064
#define KEYSTA_SEND_NOTREADY 0x02
#define KEYCMD_WRITE_MODE 0x60
#define KBC_MODE 0x47

// 检查是否可以接收数据
void wait_KBC_sendready()
{
  for (;;)
  {
    if ((io_in8(PORT_KEYSTA) & KEYSTA_SEND_NOTREADY) == 0)
    {
      break;
    }
  }
}
/*
  鼠标控制电路包含在键盘控制电路里，如果键盘控制电路的初始化正常完成，
  鼠标电路控制器的激活也就完成了。
*/
void init_keyboard(void)
{
  wait_KBC_sendready();
  io_out8(PORT_KEYCMD, KEYCMD_WRITE_MODE);
  wait_KBC_sendready();
  // 紧接着向端口0x60发送一个字节的数据0x47, 这个数据要求键盘电路启动鼠标模式，
  // 这样，鼠标硬件所产生的数据信息，都可以通过键盘电路端口0x60读到，
  io_out8(PORT_KEYDAT, KBC_MODE);
}

#define KEYCMD_SENDTO_MOUSE 0xd4
#define MOUSECMD_ENABLE 0xf4

void enable_mouse(struct MOUSE_DEC *mdec)
{
  wait_KBC_sendready();
  io_out8(PORT_KEYCMD, KEYCMD_SENDTO_MOUSE);
  wait_KBC_sendready();
  io_out8(PORT_KEYDAT, MOUSECMD_ENABLE);

  mdec->phase = 0;
  return;
}

/**
 *  FIFO 8
 */
void fifo8_init(struct FIFO8 *fifo, int size, unsigned char *buf)
{
  fifo->size = size;
  fifo->buf = buf;
  fifo->free = size;
  fifo->flags = 0;
  fifo->p = 0;
  fifo->q = 0;
  return;
}

#define FLAGS_OVERRUN 0x0001
int fifo8_put(struct FIFO8 *fifo, unsigned char data)
{
  if (fifo->free == 0)
  {
    fifo->flags |= FLAGS_OVERRUN;
    return -1;
  }

  fifo->buf[fifo->p] = data;
  fifo->p++;
  if (fifo->p == fifo->size)
  {
    fifo->p = 0;
  }
  fifo->free--;
  return 0;
}

int fifo8_get(struct FIFO8 *fifo)
{
  int data;
  if (fifo->free == fifo->size)
  {
    return -1;
  }

  data = fifo->buf[fifo->q];
  fifo->q++;
  if (fifo->q == fifo->size)
  {
    fifo->q = 0;
  }
  fifo->free++;
  return data;
}

int fifo8_status(struct FIFO8 *fifo)
{
  return fifo->size - fifo->free;
}

void show_key_info()
{
  unsigned char *vram = bootInfo.vgaRam;
  int xsize = bootInfo.screenX, ysize = bootInfo.screenY;
  unsigned char data = 0;

  io_sti();
  data = fifo8_get(&keyinfo);
  unsigned char *pStr = charToHexStr(data);
  static int showXPos = 0;
  static int showYPos = 0;
  showString(vram, xsize, showXPos, 0, COL8_FFFFFF, pStr);
  showXPos += 32;
}

void show_mouse_info(void)
{
  unsigned char *vram = bootInfo.vgaRam;
  int xsize = bootInfo.screenX, ysize = bootInfo.screenY;

  unsigned char data = 0;

  io_sti();
  data = fifo8_get(&mouseinfo);

  if (mouse_decode(&mdec, data) != 0)
  {
    eraseMouse(vram);
    computeMousePosition(&mdec);
    drawMouse(vram);
  }
}

void show_sth()
{
  unsigned char *vram = bootInfo.vgaRam;
  int xsize = bootInfo.screenX, ysize = bootInfo.screenY;
  showFont8(vram, 320, 20, 20, COL8_FFFFFF, systemFont + 'p' * 16);
}

int mouse_decode(struct MOUSE_DEC *mdec, unsigned char dat)
{
  if (mdec->phase == 0)
  {
    if (dat == 0xfa)
    {
      mdec->phase = 1;
    }

    return 0;
  }

  if (mdec->phase == 1)
  {
    if ((dat & 0xc8) == 0x08)
    {
      mdec->buf[0] = dat;
      mdec->phase = 2;
    }

    return 0;
  }

  if (mdec->phase == 2)
  {
    mdec->buf[1] = dat;
    mdec->phase = 3;
    return 0;
  }

  if (mdec->phase == 3)
  {
    mdec->buf[2] = dat;
    mdec->phase = 1;
    mdec->btn = mdec->buf[0] & 0x07;
    mdec->x = mdec->buf[1];
    mdec->y = mdec->buf[2];
    if ((mdec->buf[0] & 0x10) != 0)
    {
      mdec->x |= 0xffffff00;
    }

    if ((mdec->buf[0] & 0x20) != 0)
    {
      mdec->y |= 0xffffff00;
    }

    mdec->y = -mdec->y;
    return 1;
  }

  return -1;
}

void computeMousePosition(struct MOUSE_DEC *mdec)
{
  mx += mdec->x;
  my += mdec->y;
  if (mx < 0)
  {
    mx = 0;
  }

  if (my < 0)
  {
    my = 0;
  }

  if (mx > xsize - 16)
  {
    mx = xsize - 16;
  }
  if (my > ysize - 16)
  {
    my = ysize - 16;
  }
}

void eraseMouse(unsigned char *vram)
{
  boxfill8(vram, xsize, COL8_008484, mx, my, mx + 15, my + 15);
}

void drawMouse(unsigned char *vram)
{
  putblock(vram, xsize, 16, 16, mx, my, mcursor, 16);
}
