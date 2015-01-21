%{
#include <stdio.h>

int yylex();
int yyparse();

void yyerror(const char *str)
{
    fprintf(stderr, "error: %s\n", str);
}

int yywrap()
{
    return 1;
}

int main()
{
    yyparse();
}
%}

%token NUMBER TOKOP TOKDOLLAR TOKPERCENT;

%%
start:
    dollars TOKOP percentage;

dollars:
    TOKDOLLAR NUMBER;

percentage:
    NUMBER TOKPERCENT;

%%

