import java.util.*;

public class Highway {
  public static void main (String args[]) {
    Scanner sc = new Scanner(System.in);
    int choice;

    TrafficLight highway = new TrafficLight(TrafficLightStatus.green);
    TrafficLight westFarm = new TrafficLight(TrafficLightStatus.red);
    TrafficLight eastFarm = new TrafficLight(TrafficLightStatus.red);

    do {
      displayMenu();
      switch (choice = sc.nextInt()) {
        case 1:
          if(highway.currentStatus != TrafficLightStatus.red) {
            System.out.println("Highway light becomes yellow");
            highway.set(TrafficLightStatus.yellow);
            highway.set(TrafficLightStatus.red, 5);
          }
          System.out.println("Highway light becomes red");
          System.out.println("West Farm light becomes green");
          System.out.println("East Farm light becomes red");
          westFarm.set(TrafficLightStatus.green);
          eastFarm.set(TrafficLightStatus.red);
          break;
        case 2:
          if(highway.currentStatus != TrafficLightStatus.red) {
            System.out.println("Highway light becomes yellow");
            highway.set(TrafficLightStatus.yellow);
            highway.set(TrafficLightStatus.red, 5);
          }
          System.out.println("Highway light becomes red");
          System.out.println("West Farm light becomes red");
          System.out.println("East Farm light becomes green");
          westFarm.set(TrafficLightStatus.red);
          eastFarm.set(TrafficLightStatus.green);
          break;
        case 3: 
          if(highway.currentStatus != TrafficLightStatus.red) {
            System.out.println("Highway light becomes yellow");
            highway.set(TrafficLightStatus.yellow);
            highway.set(TrafficLightStatus.red, 5);
          }
          westFarm.set(TrafficLightStatus.red);
          System.out.println("Highway light becomes red");
          System.out.println("West Farm light becomes red");
          System.out.println("East Farm light becomes green");
          eastFarm.set(TrafficLightStatus.green);
          westFarm.set(TrafficLightStatus.green, 20);
          System.out.println("West Farm light becomes green");
          System.out.println("East Farm light becomes red");
          eastFarm.set(TrafficLightStatus.red);
          break;
        case 4: 
          if(highway.currentStatus != TrafficLightStatus.green) {
            System.out.println("Highway light becomes green");
            System.out.println("East Farm light becomes red");
            System.out.println("West Farm light becomes red");
          }
          break;
        case 5: break;
        default: System.out.println("Invalid option. Pick from `1`, `2`, `3`, `4` or `5`");
      }
    } while (choice != 5);
  }
  static void displayMenu () {
    System.out.println("\n========================");
    System.out.println("  Select from the menu  ");
    System.out.println("========================");
    System.out.println("1. Car sensed on west farm.");
    System.out.println("2. Car sensed on east farm.");
    System.out.println("3. Car sensed on both farms.");
    System.out.println("4. No car sensed.");
    System.out.println("5. Exit");
    System.out.println("\n\n");
  }
}
class TrafficLight {
  TrafficLightStatus currentStatus;
  TrafficLight(TrafficLightStatus s) {
    currentStatus = s;
  }
  public void set (TrafficLightStatus newStatus) {
    currentStatus = newStatus;
  }
  public void set (TrafficLightStatus newStatus, int afterTheseManySeconds) {
    try {
      Thread.sleep(1000 * afterTheseManySeconds);
      set(newStatus);
    } catch (InterruptedException e) {
      System.out.println (e.getMessage());
    }
  }
}
enum TrafficLightStatus {
  red, yellow, green
}
