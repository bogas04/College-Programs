import java.util.*;

public class TicTacToe {
  static Scanner sc = new Scanner(System.in);

  public static void main (String args[]) {
    Board board = new Board();
    System.out.print("You are X : ");

    while(!board.isFilled()) {
      int x, y;
      System.out.println(board);
      System.out.print("Enter your move's row number : ");
      x = sc.nextInt();
      System.out.print("Enter your move's column number : ");
      y = sc.nextInt();
      
      if (board.isBlank (x, y)) {
        board.putX(x, y);
        // AI move
      }
    }
  }
}
class Board {
  int board[][];
  Board() { board = new int[3][3]; }

  boolean isBlank(int x, int y) { return board[x - 1][y - 1] = 0; }
  boolean isX(int x, int y) { return board[x - 1][y - 1] = 1; }
  boolean isO(int x, int y) { return board[x - 1][y - 1] = -1; }

  void putX(int x, int y) {
    board[x - 1][y - 1] = 1;
  }
  void putO(int x, int y) {
    board[x - 1][y - 1] = -1;
  }
  boolean isOWinner () {
    return isFilled() && !isXWinner();
  }
  boolean isXWinner () {
    return (
        (board[0][0] == 1 && (board[0][0] == board[1][1] && board[1][1] == board[2][2])) ||
        (board[0][2] == 1 && (board[0][2] == board[1][1] && board[1][1] == board[2][0])) ||

        (board[0][0] == 1 && (board[0][0] == board[0][1] && board[0][1] == board[0][2])) ||
        (board[1][0] == 1 && (board[1][0] == board[1][1] && board[1][1] == board[1][2])) ||
        (board[2][0] == 1 && (board[2][0] == board[2][1] && board[2][1] == board[2][2])) ||

        (board[0][0] == 1 && (board[0][0] == board[1][0] && board[1][0] == board[2][0])) ||
        (board[0][1] == 1 && (board[0][1] == board[1][1] && board[1][1] == board[2][1])) ||
        (board[0][2] == 1 && (board[0][2] == board[1][2] && board[1][2] == board[2][2]))
        );
  }
  boolean isFilled () {
    return (
        ((board[0][0] != 0) && (board[0][0] == board[1][1]) && (board[1][1] == board[2][2])) ||
        ((board[0][2] != 0) && (board[0][2] == board[1][1]) && (board[1][1] == board[2][0])) ||

        ((board[0][0] != 0) && (board[0][0] == board[0][1]) && (board[0][1] == board[0][2])) ||
        ((board[1][0] != 0) && (board[1][0] == board[1][1]) && (board[1][1] == board[1][2])) ||
        ((board[2][0] != 0) && (board[2][0] == board[2][1]) && (board[2][1] == board[2][2])) ||

        ((board[0][0] != 0) && (board[0][0] == board[1][0]) && (board[1][0] == board[2][0])) ||
        ((board[0][1] != 0) && (board[0][1] == board[1][1]) && (board[1][1] == board[2][1])) ||
        ((board[0][2] != 0) && (board[0][2] == board[1][2]) && (board[1][2] == board[2][2])) 
        );
  } 
  public String toString () {
    StringBuilder sb = new StringBuilder("");
    for (int i = 0; i < board.length; i++) {
      if(i == 1) sb.append(line (9) + "\n");
      for (int j = 0; j < board.length; j++) sb.append((j == 1 ? "|" : " ") + (board[i][j] == 1 ? "X" : (board[i][j] == -1 ? "O": " ")) + (j == 1 ? "|" : " "));
      if(i == 1) sb.append("\n" + line (9));
      sb.append("\n");
    }
    return sb.toString();
  }
  static String line (int n) {
    StringBuilder s = new StringBuilder("");
    while (n-- > 0) s.append("-");
    return s.toString();
  }
}
