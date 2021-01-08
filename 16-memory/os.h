#ifndef OS_H
#define OS_H
/*
  Boot Infor
*/
struct BOOTINFO
{
  unsigned char *vgaRam;
  int screenX, screenY;
};

#define ADR_BOOTINFO	0x00000ff0

/*
  ASM functions
*/
void io_hlt(void);
void io_sti(void);
void io_cli(void);
void io_stihlt(void);
void io_out8(int port, int data);
int io_in8(int port);
int io_load_eflags(void);
void io_store_eflags(int eflags);

/*
  String utility
*/

unsigned char charToHexVal(unsigned char c);
unsigned char *charToHexStr(unsigned char c);
unsigned char*  intToHexStr(unsigned int d);

/* 
  Graphics
*/
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

void init_palette(void);
void set_palette(int start, int end, unsigned char *rgb);
void boxfill8(unsigned char *vram, int xsize, unsigned char color, int x, int y, int x0, int y0);
void putblock(unsigned char *vram, int vxsize, int pxsize,
              int pysize, int px0, int py0, unsigned char *buf, int bxsize);
void showFont8(unsigned char *vram, int xsize, int x, int y, char color, char *font);
void showString(unsigned char *vram, int xsize,
                int x, int y, char color,
                unsigned char *s);
void init_mouse_cursor(unsigned char *mouse, char bc);       
void draw_desktop(unsigned char *vram, int x, int y);


/*
  Font
*/
extern char systemFont[];

/*
  FIFO
*/
#define FLAGS_OVERRUN 0x0001
struct FIFO8
{
  unsigned char *buf;
  int p, q, size, free, flags;
};

void fifo8_init(struct FIFO8 *fifo, int size, unsigned char *buf);
int fifo8_put(struct FIFO8 *fifo, unsigned char data);
int fifo8_get(struct FIFO8 *fifo);
int fifo8_status(struct FIFO8 *fifo);
/* PIC */
#define PIC0_ICW1		0x0020
#define PIC0_OCW2		0x0020
#define PIC0_IMR		0x0021
#define PIC0_ICW2		0x0021
#define PIC0_ICW3		0x0021
#define PIC0_ICW4		0x0021
#define PIC1_ICW1		0x00a0
#define PIC1_OCW2		0x00a0
#define PIC1_IMR		0x00a1
#define PIC1_ICW2		0x00a1
#define PIC1_ICW3		0x00a1
#define PIC1_ICW4		0x00a1
/*
  Key 
*/
#define PORT_KEYDAT		        0x0060
#define PORT_KEYCMD		        0x0064
#define PORT_KEYSTA				    0x0064
#define KEYSTA_SEND_NOTREADY	0x02
#define KEYCMD_WRITE_MODE	   	0x60
#define KBC_MODE				      0x47
void init_keyboard(void);
void intHandler21(int *esp);
void wait_KBC_sendready(void);
void show_key_info(unsigned char *vram , int xsize);

static struct FIFO8 keyfifo;

/*
  Mouse
*/
struct MOUSE_DEC {
	unsigned char buf[3], phase;
	int x, y, btn;
};
void intHandler2C(int *esp);
void enable_mouse(struct MOUSE_DEC *mdec);
int mouse_decode(struct MOUSE_DEC *mdec, unsigned char dat);
void show_mouse_info(unsigned char *vram , int xsize);

static struct FIFO8 mousefifo;
static struct MOUSE_DEC mdec;


/*
  Memory
*/

struct AddrRangeDesc {
  unsigned int  baseAddrLow ;  //内存基地址的低32位
  unsigned int  baseAddrHigh;  //内存基地址的高32位
  unsigned int  lengthLow;     //内存块长度的低32位
  unsigned int  lengthHigh;    //内存块长度的高32位
  unsigned int  type;          //描述内存块的类型
};
/*
  type 等于1，表示当前内存块可以被内核使用。
  type 等于2，表示当前内存块已经被占用，系统内核绝对不能使用，
  type 等于3，保留给未来使用，内核也不能用当前内存块。
*/

int get_memory_block_count(void);   /* asm func */
char *get_adr_buffer(void);         /* asm func */
void showMemoryInfo(struct AddrRangeDesc *desc, char *vram, int page,
                    int xsize, int color);

#endif