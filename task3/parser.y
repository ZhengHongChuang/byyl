%{
#include<stdio.h>
%}

%token NUM 
%token ADD 
%% 
cmd : NUM ADD NUM{
printf("%d\n",$1+$3);}
;
%% 
int main() 
{ 
yyparse();
 
} 
yyerror(int s) 
{ 
printf("%d",s); 
}

