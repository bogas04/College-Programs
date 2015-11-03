import java.util.*;

public class TravellingSalesman {
  static Scanner sc = new Scanner(System.in);
  boolean visited[];
  int costOf[][];
  long totalCost;
  public static void main (String args[]) {
    int nCities;

    System.out.println("Enter number of cities: ");
    nCities = sc.nextInt(); 

    visited = new boolean [nCities];
    costOf  = new int     [nCities][nCities];

    // Getting undirected graph
    for (int cityA = 0; cityA < nCities; cityA++) { // For each city c1...cN
      for (int cityB = cityA + 1; cityB < nCities; cityB++) { // For each city cj..cN where j = i + 1
        System.out.println("Travelling cost from city " + cityA + " to city " + cityB + ": ");
        costOf[cityA][cityB] = sc.nextInt();
        costOf[cityB][cityA] = costOf[cityA][cityB]; // Undirected graph
      }
    }
  }
}
