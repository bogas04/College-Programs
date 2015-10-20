import java.util.*;

public class TicTacToe {
  public static void main (String args[]) {
    Board board;
    
  }
}
class Board {
  boolean board[][];
  Board() {
    board = new boolean[3][3];
  }
  void putX(int x, int y) {
    board[x - 1][y - 1] = true;
  }
  void putO(int x, int y) {
    board[x - 1][y - 1] = false;
  }
  boolean isOWinner () {
    return isFilled() && !isXWinner();
  }
  boolean isXWinner () {
    return (
        (board[0][0] == true && (board[0][0] == board[1][1] && board[1][1] == board[2][2])) ||
        (board[0][2] == true && (board[0][2] == board[1][1] && board[1][1] == board[2][0])) ||

        (board[0][0] == true && (board[0][0] == board[0][1] && board[0][1] == board[0][2])) ||
        (board[1][0] == true && (board[1][0] == board[1][1] && board[1][1] == board[1][2])) ||
        (board[2][0] == true && (board[2][0] == board[2][1] && board[2][1] == board[2][2])) ||

        (board[0][0] == true && (board[0][0] == board[1][0] && board[1][0] == board[2][0])) ||
        (board[0][1] == true && (board[0][1] == board[1][1] && board[1][1] == board[2][1])) ||
        (board[0][2] == true && (board[0][2] == board[1][2] && board[1][2] == board[2][2]))
        );
  }
  boolean isFilled () {
    return (
        (board[0][0] == board[1][1] && board[1][1] == board[2][2]) ||
        (board[0][2] == board[1][1] && board[1][1] == board[2][0]) ||

        (board[0][0] == board[0][1] && board[0][2]) ||
        (board[1][0] == board[1][1] && board[1][2]) ||
        (board[2][0] == board[2][1] && board[2][2]) ||

        (board[0][0] == board[1][0] && board[2][0]) ||
        (board[0][1] == board[1][1] && board[2][1]) ||
        (board[0][2] == board[1][2] && board[2][2])
        );
  } 
}
