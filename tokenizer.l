%{
#define YYSTYPE double
#include "parse.tab.h"
%}

%%
\$                  return TOKDOLLAR;
\%                  return TOKPERCENT;
[0-9]+(\.[0-9]+)*   yylval=atof(yytext); return NUMBER;
[ \t]+              /* eat whitespace */
\(                  return LPAREN;
\)                  return RPAREN;
\+                  return OP_PLUS;
\-                  return OP_MINUS;
%%

