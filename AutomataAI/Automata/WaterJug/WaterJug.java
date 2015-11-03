import java.util.*;

public class WaterJug {
  static State initialState = new State(0, 0, 8);
  static State finalState = new State(0, 4, 4);
  static LinkedList<State> solution = new LinkedList<State>();
  static int status[][] = new int[4][6];
  static final int SOLUTION = 1;
  static final int UNCHECKED = 0;
  static final int CHECKED = -1;

  public static void main (String args[]) {
    System.out.println("Initial State: " + initialState.toString());
    if(solveFrom(initialState)) {
      for(State s: solution) {
        System.out.println((s.equalsTo(finalState) ? "Final State: " : "Next State: ") + s.toString());
      }
    }
  }
  public static boolean solveFrom (State s) {
    boolean foundSolution = false;

    if(status[s._3][s._5] == UNCHECKED) {
      if(status[s._3][s._5] == SOLUTION || s.equalsTo(finalState)) {
        foundSolution = true;
      } else {
        status[s._3][s._5] = CHECKED;
        if(s._3 > 0) {
          foundSolution = solveFrom (new State(s._3 - Math.min(s._3, 5 - s._5), s._5 + Math.min(s._3, 5 - s._5))) 
            || solveFrom (new State(s._3 - Math.min(s._3, 8 - s._8), s._5));
        } 
        if (!foundSolution && s._5 > 0) {
          foundSolution = solveFrom (new State(s._3 + Math.min(s._5, 3 - s._3), s._5 - Math.min(s._5, 3 - s._3))) 
            || solveFrom (new State(s._3, s._5 - Math.min(s._5, 8 - s._8)));
        } 
        if (!foundSolution && s._8 > 0) {
          foundSolution = solveFrom (new State(s._3 + Math.min(s._8, 3 - s._3), s._5)) 
            || solveFrom (new State(s._3, s._5 + Math.min(s._8, 5 - s._5)));
        }
      }

      if(foundSolution) {
        solution.addFirst(s);
        status[s._3][s._5] = SOLUTION;
      }
    }

    return (status[s._3][s._5] == SOLUTION) || foundSolution;
  }
}
class State {
  int _3, _5, _8;
  State(int v3, int v5) {
    this(v3, v5, 8 - v3 - v5);
  }
  State(int v3, int v5, int v8) {
    _3 = v3;
    _5 = v5;
    _8 = v8;
  }
  boolean equalsTo(State s) {
    return s._3 == _3 && s._5 == _5 && s._8 == _8;
  }
  public String toString() {
    return "[" + _3 + ", " + _5 + ", " + _8 + " ]";
  }
}
