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
, ;
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

