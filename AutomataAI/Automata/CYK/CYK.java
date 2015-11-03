/*
let the input be a string S consisting of n characters: a1 ... an.
let the grammar contain r nonterminal symbols R1 ... Rr.
This grammar contains the subset Rs which is the set of start symbols.
let P[n,n,r] be an array of booleans. Initialize all elements of P to false.
for each i = 1 to n
  for each unit production Rj -> ai
    set P[1,i,j] = true
for each i = 2 to n -- Length of span
  for each j = 1 to n-i+1 -- Start of span
    for each k = 1 to i-1 -- Partition of span
      for each production RA -> RB RC
        if P[k,j,B] and P[i-k,j+k,C] then set P[i,j,A] = true
if any of P[n,1,x] is true (x is iterated over the set s, where s are all the indices for Rs) then
  S is member of language
else
  S is not member of language
*/

public class CYK {
  public static void main (String args[]) {
    Grammar G;
    String input = "";
    boolean table[][][] = new boolean[input.length, input.length, G.nonTerminals.length];

    for (int i = 0; i < input.length; i++) {
      for(Symbol p : G.productions) {
        if(p.isUnitProduction && p.value.size() == 1 && p.value.get(0).equalsTo(input.charAt(i)) {

        }
      }
      
    }
    for (int i = 1; i < input.length; i++) {
      for (int j = 0; j < input.length - i + 1; j++) {
        for (int k = 1; k < i - 1; k++) {
          
          

        }
      }
    }
  }
}
class Grammar {
  LinkedList<Symbol> startSymbols;
  LinkedList<Symbol> nonTerminals;
  LinkedList<Symbol> productions;
  Grammar (LinkedList<Symbol> s, LinkedList<Symbol> n, LinkedList<Symbol> p) {
    startSymbols = s;
    nonTerminals = n;
    productions = p;
  }
}
class Symbol { // key => value1 ... valueN 
  boolean isTerminal;
  String key;   // A 
  String value; // -> B b | C  (Use | for `or` and ` ` for `and`)
  Symbol(boolean i, String k) {
    isTerminal = i;
    key = k;
    if(!isTerminal) {
      value = new LinkedList<Symbol>();
    }
  }
  boolean isUnitProduciton () {
    return value.
    
  }
  LinkedList<Symbol> getValue () {
    return value.split("|");
  }
  boolean equalsTo (Symbol s) {
    return isTerminal == s.isTerminal && key == key;
  }
}
