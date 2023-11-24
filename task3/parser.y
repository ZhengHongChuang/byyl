%{
#include <stdio.h>
int result;
%}

%token NUM ADD

%%
expression : NUM
           | expression ADD expression {
               $$ = $1 + $3;
	       result = $$;
	       $1 = $$;
           }
           ;
%%

int main()
{
    yyparse();
    printf("%d\n",result);
    return 0;
}

int yyerror(char *s)
{
    printf("%s\n", s);
    return 0;
}

