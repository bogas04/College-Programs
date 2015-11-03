#include <stdio.h>
#include "myscanner.h"

extern int yylex ();
extern int yylineno;
extern char* yytext;

int main (void) {
  char* names[] = {"COLON", "TYPE", "NAME", "TABLE_PREFIX", "PORT", "IDENTIFIER", "INTEGER"};
  int ntoken, vtoken;

  while((ntoken = yylex())) {
    printf("Line #%d: %-16s is a %s\n", yylineno, yytext, names[ntoken - 1]);
  }
  
  return 0;
}
