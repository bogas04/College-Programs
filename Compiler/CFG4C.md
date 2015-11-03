Context Free Grammar for C
==========================

# Start 
-TODO
S -> <pre-processor-directives> <function-declarations> <main-function> FUNCTION

<pre-processor-directives> -> #include<L> | #include"S" | #define I M| typdef TI;|
L -> A-Za-z
M -> [0-9]+ | ".*"
S -> \S*

<main-function> -> int main(Z)S
Z -> void | intI, char*I[] | int I,char**I

<function-declarations> -> FUNCTIONDEC

# T - Types
T -> P | P* 
P -> int | char | float | double | void | structI 
## Structures
STRUCT -> struct{T} | structI{T}
T -> D; | T

# I - Identifier
Regex = /[a-zA-Z_$][a-zA-Z_$0-9]*/

# Expressions
## E - Expression
E -> E+F | E-F
F -> F*G | F/G
G -> H++ | ++H | --H | H--
H -> (E) | A | D | R
## Declaration Expressions
D -> TI
## A -> Assigment Expression
A -> I=E | D=E
## R - Relational Expression
R -> E<E | E>E | E>= | E<=E | E!=E | E==E

# Statements
## S - Statement
S -> ; | E;| {S} | L | J | IF | SWITCH | FOR | WHILE | DO | CALL
## C - Case Statements
C -> caseI:S | default:S | C
## L - Labelled Statements
L -> I:S
## J - Jump Statements
J -> return; | returnE; | gotoI | break; | continue;

# Branching Constructs
## if construct
IF -> if(E)SelseS | if(E)S
## switch construct
SWITCH -> switch(E){C}

# Loop Constructs
## for loop construct
FOR -> for(;;)S | for(E;R;)S | for(E;R;E)S 
## while loop construct
WHILE -> while(E)S
## do while loop construct
DO -> do{S}while(E);

# Functions
## Function Declaration
FUNCTIONDEC -> DI(P);
P -> D | D,D
## Function Definition 
FUNCTION -> DI(P)S | I(P)S
P -> D | D,D
## Function Call
CALL -> I(Z);
Z -> I | I,I
