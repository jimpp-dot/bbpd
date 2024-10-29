//
//  str_utils.h
//  sbox
//
//  Created by liqf on 2019/11/29.
//  Copyright © 2019. All rights reserved.
//

#ifndef str_utils_h
#define str_utils_h

#include <stdio.h>

void bytes2hex(unsigned char* src, char* dest, int byteLen);
void Hex2Char(char *szHex, unsigned char *rch);
void HexStr2CharStr(char *pszHexStr, int iSize,  char *pucCharStr);

#endif /* str_utils_h */
