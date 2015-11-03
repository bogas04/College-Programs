%%
\n      { yylineno++; printf("\n"); };
^.*$    printf("%d\t%s", yylineno, yytext);  
