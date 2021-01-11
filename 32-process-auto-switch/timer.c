#include "os.h"

#define TIMER_FLAGS_ALLOC 1
#define TIMER_FLAGS_USING 2

static struct TIMERCTL timerctl;
extern struct TIMER *mt_timer;

void init_pit(void)
{
  // 将中断周期设定为11932，中断频率就是100Hz，也就是1秒钟会发生100次中断
  io_out8(PIT_CTRL, 0x34);
  io_out8(PIT_CNT0, 0x9c);
  io_out8(PIT_CNT0, 0x2e);

  timerctl.count = 0;
  int i;
  for (i = 0; i < MAX_TIMER; i++)
  {
    timerctl.timer[i].flags = 0; //not used
  }
}

struct TIMER *timer_alloc(void)
{
  int i;
  for (i = 0; i < MAX_TIMER; i++)
  {
    if (timerctl.timer[i].flags == 0)
    {
      timerctl.timer[i].flags = TIMER_FLAGS_ALLOC;
      return &timerctl.timer[i];
    }
  }

  return 0;
}

void timer_free(struct TIMER *timer)
{
  timer->flags = 0;
  return;
}

void timer_init(struct TIMER *timer, struct FIFO8 *fifo, unsigned char data)
{
  timer->fifo = fifo;
  timer->data = data;
  return;
}

void timer_settime(struct TIMER *timer, unsigned int timeout)
{
  timer->timeout = timeout;
  timer->flags = TIMER_FLAGS_USING;
  return;
}

void intHandler20(char *esp)
{
  io_out8(PIC0_OCW2, 0x60);

  timerctl.count++;
  char ts = 0;
  int i;
  for (i = 0; i < MAX_TIMER; i++)
  {
    if (timerctl.timer[i].flags == TIMER_FLAGS_USING && timerctl.timer[i].timeout > 0)
    {
      timerctl.timer[i].timeout--;
      if (timerctl.timer[i].timeout == 0)
      {
        timerctl.timer[i].flags = TIMER_FLAGS_ALLOC;
        fifo8_put(timerctl.timer[i].fifo, timerctl.timer[i].data);
        // 超时的时钟是否是mt_timer
        if (&timerctl.timer[i] == mt_timer) {
            ts = 1;
        }
      }
      if (ts != 0) {
        mt_taskswitch();
      }
    }
  }

  return;
}
