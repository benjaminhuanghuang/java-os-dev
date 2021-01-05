void io_hlt(void);
void io_cli(void);
void io_out(int port, int data);
int io_load_eflags(void);
void io_store_eflags(int eflags);
void init_palette(void);
void set_palette(int start, int end, unsigned char *rgb);

void CMain(void)
{
    int i;
    char *p = 0; // 初始化调色板
    init_palette();
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
void init_palette(void)
{ // 上面讲到的RGB数组
    static unsigned char table_rgb[16 * 3] = {
        0x00,
        0x00,
        0x00,
        0xff,
        0x00,
        0x00,
        0x00,
        0xff,
        0x00,
        0xff,
        0xff,
        0x00,
        0x00,
        0x00,
        0xff,
        0xff,
        0x00,
        0xff,
        0x00,
        0xff,
        0xff,
        0xff,
        0xff,
        0xff,
        0xc6,
        0xc6,
        0xc6,
        0x84,
        0x00,
        0x00,
        0x00,
        0x84,
        0x00,
        0x84,
        0x84,
        0x00,
        0x00,
        0x00,
        0x84,
        0x84,
        0x00,
        0x84,
        0x00,
        0x84,
        0x84,
        0x84,
        0x84,
        0x84,
    };
    set_palette(0, 15, table_rgb);
    return;
}
void set_palette(int start, int end, unsigned char *rgb)
{
    int i, eflags;             // 首先调用io_load_eflags保持EFLAGS寄存器的值
    eflags = io_load_eflags(); // 然后关中断
    io_cli();
    io_out8(0x03c8, start); // 设置RGB颜色
    for (i = start; i <= end; i++)
    {
        io_out8(0x03c9, rgb[0]);
        io_out8(0x03c9, rgb[1]);
        io_out8(0x03c9, rgb[2]);
        rgb += 3;
    } // 恢复EFLAGS寄存器 
    io_store_eflags(eflags); return; }
