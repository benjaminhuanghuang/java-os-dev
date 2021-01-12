#include "os.h"

/*
 interupt handler for mouse
 read data and put it to keyboard FIFO buffer
*/
void intHandler2C(int *esp)
{
	unsigned char data;
	io_out8(PIC1_OCW2, 0x64);	/* 通知PIC1 IRQ-12接收完成 */
	io_out8(PIC0_OCW2, 0x62);	/* 通知PIC0 IRQ-02接收完成 */
	data = io_in8(PORT_KEYDAT);
	fifo8_put(&mousefifo, data);
	return;
}


#define KEYCMD_SENDTO_MOUSE		0xd4
#define MOUSECMD_ENABLE			0xf4

void enable_mouse(struct MOUSE_DEC *mdec)
{
	wait_KBC_sendready();
	io_out8(PORT_KEYCMD, KEYCMD_SENDTO_MOUSE);
	wait_KBC_sendready();
	io_out8(PORT_KEYDAT, MOUSECMD_ENABLE);
	mdec->phase = 0; /* 等待鼠标的阶段 0xfa */
	return;
}


void show_mouse_info(unsigned char *vram, int xsize)
{
  unsigned char data = 0;
  io_sti();
  data = fifo8_get(&mousefifo);
  unsigned char *pStr = charToHexStr(data);
  static int showXPos = 0;
  showString(vram, xsize, showXPos, 0, COL8_FFFFFF, pStr);
  showXPos += 32;
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
