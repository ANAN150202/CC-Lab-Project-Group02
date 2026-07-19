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

"int"           { printf("KEYWORD: int\n"); }
"float"         { printf("KEYWORD: float\n"); }
"bool"          { printf("KEYWORD: bool\n"); }
"if"            { printf("KEYWORD: if\n"); }
"else"          { printf("KEYWORD: else\n"); }
"while"         { printf("KEYWORD: while\n"); }
"print"         { printf("KEYWORD: print\n"); }
"true"          { printf("KEYWORD: true\n"); }
"false"         { printf("KEYWORD: false\n"); }

[a-zA-Z_][a-zA-Z0-9_]*   { printf("IDENTIFIER: %s\n", yytext); }

[0-9]+\.[0-9]+  { printf("FLOAT: %s\n", yytext); }

[0-9]+          { printf("INTEGER: %s\n", yytext); }

"<="            { printf("RELOP: <=\n"); }
">="            { printf("RELOP: >=\n"); }
"=="            { printf("RELOP: ==\n"); }
"!="            { printf("RELOP: !=\n"); }
"<"             { printf("RELOP: <\n"); }
">"             { printf("RELOP: >\n"); }

"&&"            { printf("LOGOP: &&\n"); }
"||"            { printf("LOGOP: ||\n"); }
"!"             { printf("LOGOP: !\n"); }

"+"             { printf("OP: +\n"); }
"-"             { printf("OP: -\n"); }
"*"             { printf("OP: *\n"); }
"/"             { printf("OP: /\n"); }
"%"             { printf("OP: %%\n"); }
"="             { printf("ASSIGN: =\n"); }

"{"             { printf("DELIM: {\n"); }
"}"             { printf("DELIM: }\n"); }
"("             { printf("DELIM: (\n"); }
")"             { printf("DELIM: )\n"); }
";"             { printf("DELIM: ;\n"); }

.               { fprintf(stderr, "Lexical Error at line %d: unexpected character '%s'\n", line_num, yytext);} 
%%

int main() {
    yylex();
    return 0;
}
