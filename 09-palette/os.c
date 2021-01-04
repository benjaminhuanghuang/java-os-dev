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

void io_hlt(void);
void io_cli(void);
void io_out8(int port, int data);
int  io_load_eflags(void);
void io_store_eflags(int eflags);

struct  BOOTINFO {
    char* vgaRam;
    short screenX, screenY;
};
void initBootInfo(struct BOOTINFO *pBootInfo);
void init_palette(void);
void set_palette(int start, int end, unsigned char *rgb);
void boxfill8(unsigned char *varm, 
                int xsize, 
                unsigned char c, 
                int x, 
                int y, 
                int x0,
                int y0);

void CMain(void)
{
    struct BOOTINFO bootInfo;
    initBootInfo(&bootInfo);
    char* vram = bootInfo.vgaRam;
    int xsize = bootInfo.screenX, ysize = bootInfo.screenY;


    init_palette();

    boxfill8(vram, 320, COL8_FF0000, 20, 20, 120, 120);
    boxfill8(vram, 320, COL8_00FF00, 70, 50, 170, 150);
    boxfill8(vram, 320, COL8_0000FF, 120, 80, 220, 180);
    
    for (;;) {
        io_hlt();
    }

}

void initBootInfo(struct BOOTINFO *pBootInfo) {
    pBootInfo->vgaRam = (char*)0xa0000;
    pBootInfo->screenX = 320;
    pBootInfo->screenY = 200;
}

void init_palette(void) {
    static  unsigned char table_rgb[16 *3] = {
    0x00,  0x00,  0x00,
    0xff,  0x00,  0x00,
    0x00,  0xff,  0x00,
    0xff,  0xff,  0x00,
    0x00,  0x00,  0xff,
    0xff,  0x00,  0xff,
    0x00,  0xff,  0xff,
    0xff,  0xff,  0xff,
    0xc6,  0xc6,  0xc6,
    0x84,  0x00,  0x00,
    0x00,  0x84,  0x00,
    0x84,  0x84,  0x00,
    0x00,  0x00,  0x84,
    0x84,  0x00,  0x84,
    0x00,  0x84,  0x84,
    0x84,  0x84,  0x84,
    };

    set_palette(0, 15, table_rgb);
    return;
}

void set_palette(int start, int end, unsigned char *rgb)
{
    int i, eflags;
    eflags = io_load_eflags();
    io_cli();

    io_out8(0x03c8, start);
    for (i = start; i <= end; ++i) {
        io_out8(0x03c9, rgb[0]);
        io_out8(0x03c9, rgb[1]);
        io_out8(0x03c9, rgb[2]);

        rgb += 3;
    }

    io_store_eflags(eflags);
    return;
}

void boxfill8(unsigned char *varm, 
                int xsize, 
                unsigned char c, 
                int x0, 
                int y0, 
                int x1,
                int y1)
{
    int x, y;
    for (y = y0; y <= y1; ++y) {
        for (x = x0; x <= x1; ++x) {
            varm[y * xsize + x] = c;
        }
    }
}
