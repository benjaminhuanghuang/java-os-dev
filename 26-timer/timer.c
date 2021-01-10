#include "os.h";

void init_timer(void)
{
  // 将中断周期设定为11932，中断频率就是100Hz，也就是1秒钟会发生100次中断
  io_out8(PIT_CTRL, 0x34);
  io_out8(PIT_CNT0, 0x9c);
  io_out8(PIT_CNT0, 0x2e);

  timerctl.count = 0;     // count ++ 
  timerctl.timeout = 0;   // timeout ==0 时触发中断 
}

void intHandler20(char *esp)
{
  io_out8(PIC0_OCW2, 0x60);
  timerctl.count++;

  if (timerctl.timeout > 0)
  {
    timerctl.timeout--;
    if (timerctl.timeout == 0)
    {
      fifo8_put(timerctl.fifo, timerctl.data);
    }
  }
  return;
}

void settimer(unsigned int timeout, struct FIFO8 *fifo, unsigned char data)
{
  int eflags;
  eflags = io_load_eflags();
  io_cli();                   //暂时停止接收中断信号
  timerctl.timeout = timeout; //设定时间片
  timerctl.fifo = fifo;       //设定数据队列，内核在主循环中将监控这个队列
  timerctl.data = data;
  io_store_eflags(eflags);    //恢复接收中断信号
  return;
}
