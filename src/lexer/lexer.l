%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int line_num = 1;
%}

%%
[ \t]+ {/*skip whtspc */}

\n     {line_num++;}

"//".* {/*skip commnet*/}

"/*"([^*]|\*+[^*/])*\*+"/"   { /* skip block comment */ }

. {printf("CHAR: %s\n", yytext);}
%%

int main() {
    yylex();
    return 0;
}
