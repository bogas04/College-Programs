%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <math.h>
  void yyerror (char *s);
  int symbols[52];
  int getSymbolValue (char symbol);
  void setSymbolValue (char symbol, int val);
%}

%union {int num; char id;}
%start line
// Some #defines
%token print
%token exit_command
// Some #defines with their types
%token <num> number
%token <id>  identifier
%type  <num> line exp exp1 exp2 term
%type  <id>  assignment

%%

/* descriptions of expected inputs    corresponding actions (in C) */

line: assignment ';'                  { ; }
    | exit_command ';'                { exit(EXIT_SUCCESS); }
    | print exp ';'                   { printf("Printing %d\n", $2); }
    | line assignment ';'             { ; }
    | line print exp ';'              { printf("Printing %d\n", $3); }
    | line exit_command ';'           { exit(EXIT_SUCCESS); }
    ;

assignment : identifier '=' exp       { setSymbolValue($1,$3); }
           ;

exp     : term                        { $$ = $1; }
        | exp '+' exp1                { $$ = $1 + $3; }
        | exp '-' exp1                { $$ = $1 - $3; }
        | exp1                        { $$ = $1; }
        ;

exp1    : term                        { $$ = $1; }
        | exp1 '*' exp2               { $$ = $1 * $3; }
        | exp1 '/' exp2               { $$ = $1 / $3; }
        | exp2                        { $$ = $1; }
        ;

exp2    : term                        { $$ = $1; }
        | '(' exp ')'                 { $$ = $2; }
        ;

term    : number                      { $$ = $1; }
        | identifier                  { $$ = getSymbolValue($1); }
        ;

%%
int computeSymbolIndex (char token) {
  int idx = -1;
  if(islower(token)) {
    idx = token - 'a' + 26;
  } else if(isupper(token)) {
    idx = token - 'A';
  }
  return idx;
} 
int getSymbolValue(char symbol) {
  return symbols[computeSymbolIndex(symbol)];
}
void setSymbolValue(char symbol, int val) {
  symbols[computeSymbolIndex(symbol)] = val;
}
int main (void) {
  int i;
  // Initialize symbol table
  for(i=0; i < 52; i++) {
    symbols[i] = 0;
  }
  return yyparse ( );
}
void yyerror (char *s) {
  fprintf (stderr, "%s\n", s);
}
