%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
extern int line_num;
%}

%union {
    int ival;
    float fval;
    char *sval;
}

%token <ival> INTEGER
%token <fval> FLOAT
%token <sval> IDENTIFIER
%token INT FLOAT_KW BOOL IF ELSE WHILE PRINT TRUE FALSE
%token LE GE EQ NE LT GT
%token AND OR NOT
%token ASSIGN
%token PLUS MINUS STAR SLASH PERCENT
%token LBRACE RBRACE LPAREN RPAREN SEMI

%%

program:
    /* empty for now */
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Syntax Error at line %d: %s\n", line_num, s);
}

int main() {
    yyparse();
    return 0;
}
