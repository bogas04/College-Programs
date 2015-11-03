import java.util.*;

public class TravellingSalesman {
  static Scanner sc = new Scanner(System.in);
  static boolean visited[];
  static int costOf[][];
  static long totalCost;
  static LinkedList <Integer> route = new LinkedList <Integer> ();

  public static void main (String args[]) {
    int nCities;

    System.out.print("Enter number of cities: ");
    nCities = sc.nextInt(); 

    visited = new boolean [nCities];
    costOf  = new int     [nCities][nCities];

    // Getting undirected graph
    for (int cityA = 0; cityA < nCities; cityA++) { // For each city c1...cN
      for (int cityB = cityA + 1; cityB < nCities; cityB++) { // For each city cj..cN where j = i + 1
        System.out.print("Travelling cost from city " + cityA + " to city " + cityB + ": ");
        costOf[cityA][cityB] = sc.nextInt();
        costOf[cityB][cityA] = costOf[cityA][cityB]; // Undirected graph
      }
    }
    
    // Greedy Solution based on heuristc
    DFS (0);
    
    System.out.println ("Total travelling cost would be: " + totalCost);
    System.out.println ("Route to be taken :" + route.toString());
  }
  
  static void DFS (int cityA) {
    int closestCity = cityA;
    int costToClosestCity = Integer.MAX_VALUE;

    route.addLast (cityA);
    visited[cityA] = true;

    for (int cityB = 0; cityB < visited.length; cityB++) {
      if(!visited[cityB] && costOf[cityA][cityB] < costToClosestCity) {
        closestCity = cityB;
        costToClosestCity = costOf[cityA][cityB];
      }
    }
    
    if (closestCity != cityA) {
      totalCost += costToClosestCity;
      DFS (closestCity);
    }
    
  }
}
