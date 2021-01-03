extern void io_hlt(void);

void CMain(void)
{
  int i;
  char *p = 0;
  // 0xa0000 is the start of vga in memory
  for (i = 0xa0000; i <= 0xaffff; i++)
  {
    p = (char*)i;
    *p = i & 0xf;
  }

  for (;;)
  {
    io_hlt();
  }
}