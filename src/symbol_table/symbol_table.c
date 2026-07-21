#include<stdio.h>
#include<string.h>
#include<stdlib.h>

#define MAX_SYMBOLS 100

typedef struct {

char name[32] ;
char type[10] ;
int scope_level ;
int line_declared ;
} Symbol ;

Symbol symtab[MAX_SYMBOLS] ;
int symbol_count = 0 ;
int current_scope = 0 ;


int lookup(char *name, int scope){
   int i;
for(i = symbol_count-1;i>=0;i--){
   if(strcmp(symtab[i].name,name)== 0 && symtab[i].scope_level <= scope){
    return i;
}
}

return -1;
}


int insert (char *name,char *type,int scope,int line){
  int i;
  for (i=0;i<symbol_count;i++){
     if(strcmp(symtab[i].name,name)== 0 && symtab[i].scope_level==scope){
    return -1;

}
}
strcpy(symtab[symbol_count].name , name );

strcpy(symtab[symbol_count].type , type );
symtab[symbol_count].scope_level = scope ; 
symtab[symbol_count].line_declared = line ;
symbol_count++ ;
return symbol_count -1  ;
} 

