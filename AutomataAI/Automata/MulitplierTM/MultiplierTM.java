import java.util.*;

public class MultiplierTM {
  static Scanner sc = new Scanner (System.in);
  static int currentState = 0;
  static int pointerLocation = 1;
  static int inputLength = 1;
  static StringBuilder input = new StringBuilder("#");

  public static void main (String args[]) {
    System.out.print ("Enter input tape [eg. 11*111111]: ");
    input.append(sc.next() + "#");
    inputLength = input.length();
    input.append(spaces(1000)); // assuming max product would be 1000

    unaryMultiply();
  }

  static void unaryMultiply () {
    boolean halt = false;

    System.out.println("\"" + input.substring(0, inputLength).toString() + "\" [State " + currentState + "]");
    System.out.println(spaces(pointerLocation + 1) + "^");

    switch (currentState) {
      case 0: // Start State, look for multiplicand
        switch(input.charAt(pointerLocation)) {
          case '1': currentState = 1; input.setCharAt(pointerLocation, ' '); pointerLocation++; break;
          case ' ': currentState = 0; input.setCharAt(pointerLocation, ' '); pointerLocation++; break;
          case '*': currentState = 7; input.setCharAt(pointerLocation, '*'); pointerLocation--; break;
        }
        break;

      case 1: // Multiplicand found, looking for *
        switch(input.charAt(pointerLocation)) {
          case '1': currentState = 1; input.setCharAt(pointerLocation, '1'); pointerLocation++; break;
          case '*': currentState = 2; input.setCharAt(pointerLocation, '*'); pointerLocation++; break;
        }
        break;

      case 2: // Seen a *, looking for multiplier
        switch(input.charAt(pointerLocation)) {
          case '1': currentState = 3; input.setCharAt(pointerLocation, ' '); pointerLocation++; break;
          case ' ': currentState = 2; input.setCharAt(pointerLocation, ' '); pointerLocation++; break;
          case '#': currentState = 4; input.setCharAt(pointerLocation, '#'); pointerLocation--; break;
        }
        break;

      case 3: // Found a multiplier, looking for right most #, end of input
        switch(input.charAt(pointerLocation)) {
          case '#': currentState = 5; input.setCharAt(pointerLocation, '#'); pointerLocation++; break;
          case '1': currentState = 3; input.setCharAt(pointerLocation, '1'); pointerLocation++; break;
        }
        break;

      case 4: // End of multiplier, restore multiplier
        switch(input.charAt(pointerLocation)) {
          case ' ': currentState = 4; input.setCharAt(pointerLocation, '1'); pointerLocation--; break;
          case '1': currentState = 4; input.setCharAt(pointerLocation, '1'); pointerLocation--; break;
          case '*': currentState = 8; input.setCharAt(pointerLocation, '*'); pointerLocation--; break;
        }
        break;

      case 8: // Multiplier restored, go back left most #, start of multiplier
        switch(input.charAt(pointerLocation)) {
          case '#': currentState = 0; input.setCharAt(pointerLocation, '#'); pointerLocation++; break;
          case ' ': currentState = 8; input.setCharAt(pointerLocation, ' '); pointerLocation--; break;
          case '1': currentState = 8; input.setCharAt(pointerLocation, '1'); pointerLocation--; break;
        }
        break;

      case 5: // Found right most #, printing input towards the end
        switch(input.charAt(pointerLocation)) {
          case ' ': currentState = 6; input.setCharAt(pointerLocation, '1'); pointerLocation--; inputLength++; break;
          case '1': currentState = 5; input.setCharAt(pointerLocation, '1'); pointerLocation++; break;
          case '#': currentState = 5; input.setCharAt(pointerLocation, '#'); pointerLocation++; break;
        }
        break;

      case 6: // Printed partial product, looking for first blank at left
        switch(input.charAt(pointerLocation)) {
          case ' ': currentState = 2; input.setCharAt(pointerLocation, ' '); pointerLocation++; break;
          case '1': currentState = 6; input.setCharAt(pointerLocation, '1'); pointerLocation--; break;
          case '#': currentState = 6; input.setCharAt(pointerLocation, '#'); pointerLocation--; break;
        }
        break;

      case 7: // End of multiplicand, restore it and halt
        switch(input.charAt(pointerLocation)) {
          case ' ': currentState = 7; input.setCharAt(pointerLocation, '1'); pointerLocation--; break;
          case '#': halt = true; break;
        }
        break;
    }

    if (!halt) {
      unaryMultiply();
    }
  }

  // Helper function to print pointer head properly
  static String spaces (int n) {
    StringBuilder s = new StringBuilder("");
    while (n-- > 0) s.append(" ");
    return s.toString();
  }

}
