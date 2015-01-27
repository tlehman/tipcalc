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

%token NUMBER TOKDOLLAR TOKPERCENT LPAREN RPAREN OP_PLUS OP_MINUS;

%%
start:
    binary_expression
    {
        double dollars = $1;
        printf("$%.2f", dollars);
    };

binary_expression:
    dollars OP_PLUS percentage
    {
        double dollars = $1;
        double percentage = ($3)/(100.0);
        $$ = dollars + dollars*percentage;
    }
    |
    dollars OP_MINUS percentage
    {
        double dollars = $1;
        double percentage = ($3)/(100.0);
        $$ = dollars - dollars*percentage;
    }
    |
    LPAREN binary_expression RPAREN OP_PLUS percentage
    {
        double dollars = $2;
        double percentage = ($3)/(100.0);
        $$ = dollars + dollars*percentage;
    }
    |
    LPAREN binary_expression RPAREN OP_MINUS percentage
    {
        double dollars = $2;
        double percentage = ($3)/(100.0);
        $$ = dollars - dollars*percentage;
    };


dollars:
    TOKDOLLAR NUMBER
    {
        $$ = $2;
    };

percentage:
    NUMBER TOKPERCENT
    {
        $$ = $1;
    };

%%

