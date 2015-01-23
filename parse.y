%{
#define YYSTYPE double
#include <stdio.h>
#include <stdlib.h>

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

%token NUMBER TOKDOLLAR TOKPERCENT OP_PLUS OP_MINUS;

%%
start:
    dollars OP_PLUS percentage
    {
        double dollars = $1;
        double percentage = ($3)/(100.0);
        double total = dollars + dollars*percentage;
        printf("$%.2f", total);
    }
    |
    dollars OP_MINUS percentage
    {
        double dollars = $1;
        double percentage = ($3)/(100.0);
        double total = dollars - dollars*percentage;
        printf("$%.2f", total);
    };


dollars:
    TOKDOLLAR NUMBER
    {
        $$ = $2;
    }

percentage:
    NUMBER TOKPERCENT
    {
        $$ = $1;
    }

%%

