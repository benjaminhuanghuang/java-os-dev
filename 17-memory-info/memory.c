#include "os.h"

void showMemoryInfo(struct AddrRangeDesc *desc, unsigned char *vram, int page,
                    int xsize, int color)
{
    int x = 0, y = 0, gap = 13*8, strLen = 10 * 8;
    boxfill8(vram, xsize, COL8_008484, 0, 0, xsize, 100);
    //showString(vram, xsize, x, y, color, "page is:");
    char *pPageCnt = intToHexStr(page);
    showString(vram, xsize, gap, y, color, pPageCnt);
    y += 16;
    
    //showString(vram, xsize, x, y, color, "BaseAddrL: ");
    char *pBaseAddrL = intToHexStr(desc->baseAddrLow);
    showString(vram, xsize, gap, y, color, pBaseAddrL);
    y += 16;

    //showString(vram, xsize, x, y, color, "BaseAddrH: ");
    char *pBaseAddrH = intToHexStr(desc->baseAddrHigh);
    showString(vram, xsize, gap, y, color, pBaseAddrH);
    y += 16;

    //showString(vram, xsize, x, y, color, "lengthLow: ");
    char *pLengthLow = intToHexStr(desc->lengthLow);
    showString(vram, xsize, gap, y, color, pLengthLow);
    y += 16;

    //showString(vram, xsize, x, y, color, "lengthHigh: ");
    char *pLengthHigh = intToHexStr(desc->lengthHigh);
    showString(vram, xsize, gap, y, color, pLengthHigh);
    y+= 16;
    //showString(vram, xsize, x, y, color, "type: ");
    char* pType = intToHexStr(desc->type);
    showString(vram, xsize, gap, y, color, pType);
}