import java.util.*;
import java.lang.*;

public class Elevator {
  static int currentFloor = 1;
  public static void main (String args[]) {
    requestFromFloor(1);
    requestToFloor(3);
    requestFromFloor(2);
    requestToFloor(3);
    requestFromFloor(2);
    requestToFloor(2);
  }
  private static void gotoFloor(int floor) {
    if(floor != currentFloor) {
      System.out.println("Lift moves from " + currentFloor + " to " + floor);
      sleep(2000 * Math.abs(currentFloor - floor));
      currentFloor = floor;
    }
    System.out.println("Door opens on floor " + currentFloor);
    System.out.println();
  }
  public static void requestToFloor(int floor) {
    System.out.println("Floor " + floor + " pressed!");
    gotoFloor(floor);
  }
  public static void requestFromFloor(int floor) {
    System.out.println();
    System.out.println("Lift requested from floor " + floor);
    gotoFloor(floor);
    System.out.println(">Press the floor button you wish to go to");
    System.out.println();
  }
  public static boolean isValidFloor(int floor) {
    return floor == 1 || floor == 2 || floor == 3;
  }
  public static void sleep(int value) {
    try {
      Thread.sleep(value);
    } catch (InterruptedException e) {
      System.out.println(e.getMessage());
    }
  }
}
