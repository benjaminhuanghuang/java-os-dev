void CMain(void)
{
  int i;
  char *p = 0;
  // 0xa0000 is the start of vga in memory
  for (i = 0xa0000; i <= 0xaffff; i++)
  {
    p = i;
    *p = i & 0x0f;
  }

  for (;;)
  {
    io_hlt();
  }
}