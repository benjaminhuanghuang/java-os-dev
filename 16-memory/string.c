#include "os.h"
static unsigned char keyval[5] = {'0', 'X', 0, 0, 0};
  
unsigned char charToHexVal(unsigned char c)
{
  if (c >= 10)
  {
    return 'A' + c - 10;
  }

  return '0' + c;
}

unsigned char *charToHexStr(unsigned char c)
{
  int i = 0;
  char mod = c % 16;
  keyval[3] = charToHexVal(mod);
  c = c / 16;
  keyval[2] = charToHexVal(c);

  return keyval;
}

