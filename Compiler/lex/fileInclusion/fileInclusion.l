%{
#include <ctype.h>
#include <stdio.h>
static void include (char* s);
static char* trim (char* s);
%}
%%
^"#include".*\n { yytext[yyleng - 1] = '\0'; include(yytext + 8);}

%%
static char* trim (char* s) {
  while (*s && isspace(*s)) s++;
  return s;
}
static void include (char* s) {
  FILE* fp;
  int i; 
  char* fileName = trim(s);

  if ((fp = fopen(fileName, "r"))) {
    while ((i = getc(fp)) != EOF) printf("%c", i);
    fclose(fp);
  } else {
    perror(fileName);
  }
  
  return;
}
