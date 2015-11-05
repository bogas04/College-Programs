%{
/* need this for the call to atof() below */
#include <math.h>
%}

WHITESPACE    [ \t]*
TYPE          "int"|"char"|"float"|"double"|"void"
OPERATOR      "+"|"-"|"<"|">"|"*"|"/"|"="
DIGIT         [0-9]
LETTER        [a-zA-Z]
NUMBER        {DIGIT}+(\.{DIGIT}+)?(e[+\-]?{DIGIT}+)?
IDENTIFIER    [a-zA-Z_$][a-zA-Z_$0-9]*
JUMP          break|return|continue|goto

%%
{TYPE}                printf("A data type: %s\n", yytext);
{DIGIT}+              printf("An integer: %s (%d)\n", yytext, atoi(yytext));
{DIGIT}+"."{DIGIT}*   printf("A floating constant: %s (%g)\n", yytext, atof(yytext));
{JUMP}                printf("An jump statement: %s\n",yytext );
{IDENTIFIER}          printf("An identifier: %s\n", yytext);
{OPERATOR}            printf("An operator: %s\n",yytext );
%%

int main(void) {
  yyin = stdin;
  yylex();
  return 0;
}
