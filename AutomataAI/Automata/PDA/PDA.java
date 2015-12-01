import java.util.*;

public class PDA {
  static LinkedList <Character> stack = new LinkedList <Character> ();
  static int currentState = 1;
  public static void main (String args[]) {
    Scanner sc = new Scanner(System.in);
    stack.addFirst ('Z');
    System.out.print("Enter your string: ");
    System.out.println(transit(sc.next(), 0) ? "Accepted" : "Rejected");

  }
  public static boolean transit (String input, int currentIndex) {
    boolean returnValue = false;

    System.out.println("State: " + currentState + "| Index: " + currentIndex + "| Stack: " + stack.toString());

    if ((currentState == 4 || currentState == 7) && input.length() == currentIndex && stack.get(0) == 'Z') { // Accepted by either
      return returnValue = true;
    }
    if (input.length() == currentIndex && currentState < 5) { // Branch 1 couldn't accept
      System.out.println("Trying Branch 2");
      currentState = 5;
      currentIndex = 0;
      stack = new LinkedList <Character> ();
      stack.addFirst ('Z');
      return returnValue = transit (input, currentIndex);
    }
    
    if (input.length() == currentIndex && (currentState != 4 || currentState != 7)) {
      return returnValue = false;
    }

    switch (currentState) {
      case 1:
        currentState = 2;
        returnValue = transit (input, currentIndex);
        break;
      case 2:
        switch (input.charAt(currentIndex))  {
          case 'A':
            currentState = 2;
            stack.addFirst('A');
            returnValue = transit (input, currentIndex + 1);
            break;
          case 'B':
            currentState = 3;
            if (stack.get(0) == 'Z') {
              currentIndex = input.length();
              return transit(input, currentIndex);
            }
            stack.removeFirst();
            returnValue = transit (input, currentIndex + 1);
            break;
        }
        break;
      case 3:
        switch (input.charAt(currentIndex)) {
          case 'B':
            currentState = 3;
            if (stack.get(0) == 'Z') {
              currentIndex = input.length();
              return transit(input, currentIndex);
            }
            stack.removeFirst();
            returnValue = transit (input, currentIndex + 1);
            break;
          case 'C':
            currentState = 4;
            returnValue = transit (input, currentIndex + 1);
            break;
        }
        break;
      case 4:
        switch (input.charAt(currentIndex)) {
          case 'C':
            currentState = 4;
            returnValue = transit (input, currentIndex + 1);
        }
        break;
      case 5:
        switch (input.charAt(currentIndex))  {
          case 'A':
            currentState = 5;
            returnValue = transit (input, currentIndex + 1);
            break;
          case 'B':
            currentState = 6;
            stack.addFirst('B');
            returnValue = transit (input, currentIndex + 1);
            break;
        }
        break;
      case 6:
        switch (input.charAt(currentIndex))  {
          case 'B':
            currentState = 6;
            stack.addFirst('B');
            returnValue = transit (input, currentIndex + 1);
            break;
          case 'C':
            currentState = 7;
            if (stack.get(0) == 'Z') {
              return false;
            }
            stack.removeFirst();
            returnValue = transit (input, currentIndex + 1);
            break;
        }
        break;
      case 7:
        switch (input.charAt(currentIndex))  {
          case 'C':
            currentState = 7;
            if (stack.get(0) == 'Z') {
              return false;
            }
            stack.removeFirst();
            returnValue = transit (input, currentIndex + 1);
            break;
        }
        break;
    }
    return returnValue;
  }
}
