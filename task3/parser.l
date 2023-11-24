%{ 
#include "y.tab.h" 
extern int yylval; 
%}
%% 
[0-9]+ {yylval=atoi(yytext);return NUM;}

"+" {return ADD;}
[\t] 
\n return 0; 

%% 

int yywrap() 
{ 
return 0; 
}

