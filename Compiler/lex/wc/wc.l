%{
int charCount = 0, wordCount = 0, lineCount = 0;
%}

%%
\n        ++charCount, ++lineCount;
[^ \t\n]+ ++wordCount, charCount += yyleng;
.         ++charCount;
%%

int main (void) {
  yylex();
  printf("%d characters\t%d words\t%d lines\n", charCount, wordCount, lineCount);
  return 0;
}
