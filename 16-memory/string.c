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

/*
  convert int to 0x string
*/
unsigned char*  intToHexStr(unsigned int d) {
  static unsigned char str[11];
  str[0] = '0';
  str[1] = 'X';
  str[10] = 0;

  int i = 2;
  for(; i < 10; i++) {
      str[i] = '0';
  }

  int p = 9;
  while (p > 1 && d > 0) {
      int e = d % 16;
      d /= 16;
      if (e >= 10) {
          str[p] = 'A' + e - 10;
      } else {
          str[p] = '0' + e;
      } 
      p--;        
  } 

  return str;
}