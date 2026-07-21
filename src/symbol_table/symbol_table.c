 #include<stdio.h>
#include<string.h>
#include<stdlib.h>

#define MAX_SYMBOLS 100

typedef struct{
   char name[32];
   char type[10]; //"int","float",or"bool"
   int scope_level;
   int line_declared;
}Symbol;

Symbol symtab[MAX_SYMBOLS];
int symbol_count = 0;
int current_scope = 0;  // 0 = global scope
