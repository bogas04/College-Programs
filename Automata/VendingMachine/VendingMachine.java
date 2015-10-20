import java.util.*;

public class VendingMachine {
  public static void main (String args[]) {
    Scanner sc = new Scanner(System.in);
    int currentState = 0;
    int input;

    System.out.println("============================================");
    System.out.println("  Welcome to OneItemVending Machine (OIVM)  ");
    System.out.println("============================================");
    System.out.println("We accept only coins of 1, 2 or 5.");
    System.out.println("And we have only one item of 10 bucks.\n");

    do {

      if(currentState != 0) {
        System.out.println("You've entered Rs. " + currentState + " till now.");
      }

      System.out.print("Enter your coin (`1`, `2` or `5`): ");

      if(isValidInput(input = sc.nextInt())) {
        currentState += input;
      } else {
        System.out.println("Please enter valid coin (`1`, `2` or `5`)");
      }

    } while(currentState < 10);

    if(currentState == 10) {
      System.out.println("Here's your item.");
    } else {
      System.out.println("You have given more money (Rs. " + (currentState - 10) + ") than required!");
      System.out.println("I'll be kind to you so here's your item.");
    }

    System.out.println("*boop beep boop beep*");
    System.out.println(">>>>>>>>>ITEM<<<<<<<<");

  }
  public static boolean isValidInput (int i) {
    return i == 1 || i == 2 || i == 5;
  }
}
