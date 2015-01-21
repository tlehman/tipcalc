%{
#include "y.tab.h"
%}

%%
\$                 return TOKDOLLAR;
%                  return TOKPERCENT;
[0-9]+(\.[0-9]+)*  return NUMBER;
[ \t]+             /* eat whitespace */
[\+\-]             return TOKOP;
%%

