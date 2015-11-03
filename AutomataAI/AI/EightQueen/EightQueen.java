import java.util.*;

public class EightQueen {
  static boolean chessBoard[][];

  public static void main (String args[]) {
    chessBoard = new boolean[8][8];

    boolean solution = solveFor(chessBoard, 0);

    System.out.println("Solution" + (solution ? "" : " not") + " found!");

    if(solution) {
      printArray(chessBoard);
    }
  }

  public static boolean solveFor(boolean board[][], int row) {
    boolean solution = row >= board.length;

    if(isStrictlyBetween(row, -1, board.length)) {
      for(int col = 0; !solution && col < board[0].length; col++) {
        if(!board[row][col] && !anythingCuts(board, row, col)) {
          board[row][col] = true;
          board[row][col] = (solution = solveFor(board, row + 1));
        }
      }
    }

    chessBoard = board;
    return solution;
  }

  private static boolean anythingCuts(boolean board[][], int x, int y) {
    boolean doesCut = false;
    for(int i = 0; !doesCut && i < board.length; i++) // column & row
      doesCut = ((board[i][y] && i != x) || (board[x][i] && i != y));

    for(int i = 1; !doesCut && i < board[0].length; i++) // diagonal
      doesCut = ((isStrictlyBetween(x - i, -1, 8) && isStrictlyBetween(y - i, -1, 8) && board[x - i][y - i]) ||
          (isStrictlyBetween(x + i, -1, 8) && isStrictlyBetween(y + i, -1, 8) && board[x + i][y + i]) ||
          (isStrictlyBetween(x + i, -1, 8) && isStrictlyBetween(y - i, -1, 8) && board[x + i][y - i]) ||
          (isStrictlyBetween(x - i, -1, 8) && isStrictlyBetween(y + i, -1, 8) && board[x - i][y + i]));

    return doesCut;
  }

  private static boolean isStrictlyBetween(int x, int from, int to) {
    return x > from && x < to;
  }

  static void printArray(boolean m[][]) {
    System.out.println("The chess board would look like this (Note: there may be rotations/reflections): ");
    StringBuilder sb = null;
    for(boolean n[] : m) {
      sb = new StringBuilder("|");
      for(boolean o: n) sb.append((o ? "  Q  " : "     ")  + "|");
      printLine(sb);
      System.out.println(sb.toString());
    }
    printLine(sb);
  }
  private static void printLine(StringBuilder sb) {
    if(sb != null) 
      for(int i = 0; i < sb.length() - 2; i++)
        System.out.print((i == 0 ? "|" : "") + "-" + (i == sb.length() - 3 ? "|\n" : ""));
  }
}
