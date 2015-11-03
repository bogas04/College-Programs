import java.util.*;

public class PalindromeTM {
  static Scanner sc = new Scanner (System.in);
  static int currentState = 0;
  static int pointerLocation = 1;
  static StringBuilder input = new StringBuilder(" ");

  public static void main (String args[]) {
    System.out.print ("Enter a string: ");
    input.append(sc.next() + " ");

    System.out.println ( "String is" + (isPalindrome() ? " " : " not ") + "a palindrome");
  }

  static boolean isPalindrome () {
    boolean found = false;
    boolean halt = false;

    System.out.println("\"" + input.toString() + "\" [State " + currentState + "]");
    System.out.println(spaces(pointerLocation) + "^");

    switch (currentState) {
      case 0: // Start State
        switch(input.charAt(pointerLocation)) {
          case '0': currentState = 1; input.setCharAt(pointerLocation, ' '); pointerLocation++; break;
          case '1': currentState = 2; input.setCharAt(pointerLocation, ' '); pointerLocation++; break;
          case ' ': currentState = 5; input.setCharAt(pointerLocation, ' '); pointerLocation--; break;
        }
        break;

      case 1: // Seen a 0, move to right end of input
        switch(input.charAt(pointerLocation)) {
          case '0': currentState = 1; input.setCharAt(pointerLocation, '0'); pointerLocation++; break;
          case '1': currentState = 1; input.setCharAt(pointerLocation, '1'); pointerLocation++; break;
          case ' ': currentState = 3; input.setCharAt(pointerLocation, ' '); pointerLocation--; break;
        }
        break;

      case 2: // Seen a 1, move to right end of input
        switch(input.charAt(pointerLocation)) {
          case '0': currentState = 2; input.setCharAt(pointerLocation, '0'); pointerLocation++; break;
          case '1': currentState = 2; input.setCharAt(pointerLocation, '1'); pointerLocation++; break;
          case ' ': currentState = 4; input.setCharAt(pointerLocation, ' '); pointerLocation--; break;
        }
        break;

      case 3: // Test right end of input for 0
        switch(input.charAt(pointerLocation)) {
          case '0': currentState = 7; input.setCharAt(pointerLocation, ' '); pointerLocation--; break;
          case '1': currentState = 6; input.setCharAt(pointerLocation, '1'); pointerLocation--; break;
          case ' ': currentState = 5; input.setCharAt(pointerLocation, ' '); pointerLocation--; break;
        }
        break;

      case 4: // Test right end of input for 1
        switch(input.charAt(pointerLocation)) {
          case '0': currentState = 6; input.setCharAt(pointerLocation, '0'); pointerLocation--; break;
          case '1': currentState = 7; input.setCharAt(pointerLocation, ' '); pointerLocation--; break;
          case ' ': currentState = 5; input.setCharAt(pointerLocation, ' '); pointerLocation--; break;
        }
        break;

              // Found a palindrome
      case 5: halt = true; found = true; break;

              // Did not find a palindrome
      case 6: halt = true; found = false; break;

      case 7: // Matched a character, move to left end of input
              switch(input.charAt(pointerLocation)) {
                case '0': currentState = 7; input.setCharAt(pointerLocation, '0'); pointerLocation--; break;
                case '1': currentState = 7; input.setCharAt(pointerLocation, '1'); pointerLocation--; break;
                case ' ': currentState = 0; input.setCharAt(pointerLocation, ' '); pointerLocation++; break;
              }
              break;
    }

    return halt ? found : isPalindrome();
  }

  // Helper function to print pointer head properly
  static String spaces (int n) {
    StringBuilder s = new StringBuilder("");
    while (n-- > 0) s.append(" ");
    return s.toString();
  }
}
