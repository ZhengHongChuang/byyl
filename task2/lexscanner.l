%{
int COMMENT = 0;
%}

id [a-z][a-z0-9]*

%%

int|double|char {
    printf("\n\t%s is a KEYWORD", yytext);
}

"#"[^,]* {
    printf("\n\t%s is a PREPROCESSOR DIRECTIVE", yytext);
}
"=" {
    printf("\n\t%s  is an ASSIGNMENT OPERATOR" ,yytext );
} 
\<|\>  {
    printf("\n\t%s  is an RELATIONAL  OPERATOR" ,yytext );
}
-[0-9]+ {
    printf("\n\t%s is a NUMBER",yytext);
} 
, ;

\".*\" {
    printf("\n\t %s is a STRING",yytext);
}

func\([0-9a-zA-Z]+\) {
    printf("\n\tFUNCTION  %s",yytext);
}
\n ;

%%

int main(int argc, char **argv) {
    if (argc > 1)
        yyin = fopen(argv[1], "r");
    else
        yyin = stdin;

    yylex();

    printf("\n");

    return 0;
}

int yywrap() {
    return 1;
}


