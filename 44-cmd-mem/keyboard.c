
#include "os.h"

/*
 interupt handler for keyboard
 read data and put it to keyboard FIFO buffer
*/
void intHandler21(int *esp)
{
  unsigned char data;
  io_out8(PIC0_OCW2, 0x61);
  data = io_in8(PORT_KEYDAT);
  fifo8_put(&keyfifo, data);
  return;
}

/*
	检查是否可以接收数据
*/
void wait_KBC_sendready(void)
{
  for (;;)
  {
    if ((io_in8(PORT_KEYSTA) & KEYSTA_SEND_NOTREADY) == 0)
    {
      break;
    }
  }
  return;
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

void show_key_info(unsigned char *vram, int xsize)
{
  unsigned char data = 0;

  io_sti();
  data = fifo8_get(&keyfifo);
  unsigned char *pStr = charToHexStr(data);
  static int showXPos = 0;
  showString(vram, xsize, showXPos, 0, COL8_FFFFFF, pStr);
  showXPos += 32;
}
