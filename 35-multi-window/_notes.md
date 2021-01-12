
# Hello OS
[进程的挂起和恢复](https://blog.csdn.net/tyler_download/article/details/54341261)


https://www.bilibili.com/video/BV1hJ411n7rs?p=35


````
  unsigned char *buf_win_b;
  struct SHEET *sht_win_b[3];
  static struct TASK *task_b[3];
````

````
  for (i = 0; i < 2; i++) {
       sht_win_b[i] = sheet_alloc(shtctl);
       buf_win_b = (unsigned char*)memman_alloc_4k(memman, 144*52);
       char c = 'b' + i;
       taskTitle[4] = c;
       sheet_setbuf(sht_win_b[i], buf_win_b, 144, 52, -1);
       make_window8(shtctl, sht_win_b[i], taskTitle);

       task_b[i] = task_alloc();
       task_b[i]->tss.ldtr = 0;
       task_b[i]->tss.iomap = 0x40000000;
       task_b[i]->tss.eip =  (int)(task_b_main - addr_code32);

       task_b[i]->tss.es = 0;
       task_b[i]->tss.cs = 1*8;//6 * 8;
       task_b[i]->tss.ss = 4*8;
       task_b[i]->tss.ds = 3*8;
       task_b[i]->tss.fs = 0;
       task_b[i]->tss.gs = 2*8;
       task_b[i]->tss.esp -= 4;
       *((int*)(task_b[i]->tss.esp + 4)) = (int)sht_win_b[i];

       task_run(task_b[i]);
    }
    sheet_slide(shtctl,sht_win_b[0], 16, 28);
    sheet_updown(shtctl, sht_win_b[0], 1);

    sheet_slide(shtctl, sht_win_b[1], 160, 28);
    sheet_updown(shtctl, sht_win_b[1], 1);
  ```