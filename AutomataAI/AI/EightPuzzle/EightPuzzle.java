import java.util.*;

public class EightPuzzle {
  static Scanner sc = new Scanner(System.in);
  public static void main (String args[]) {
    Status s = new Status();
    Status s1 = new Status();
    System.out.print("Enter the problem matrix : ");

    for(int i = 0 ;i < 3; i++) {
      for(int j = 0;j < 3; j++) { 
        s.board[i][j] = sc.nextInt(); 
        if(s.board[i][j] == 0) {
          s.blankX = i;
          s.blankY = j; 
        }
      }
    }

    s.state = 0;
    s1 = Status.solve(s);
    for(int i = 0; i < s1.sol.length(); i++) {
      switch(s1.sol.charAt(i)) { 
        case 'e':
          s.blankY++; 
          s.board[s.blankX][s.blankY-1] = s.board[s.blankX][s.blankY]; 
          s.board[s.blankX][s.blankY] = 0;
          break;
        case 'w' : 
          s.blankY--;
          s.board[s.blankX][s.blankY+1] = s.board[s.blankX][s.blankY];
          s.board[s.blankX][s.blankY] = 0;
          break;
        case 'n' :
          s.blankX--;
          s.board[s.blankX+1][s.blankY] = s.board[s.blankX][s.blankY];
          s.board[s.blankX][s.blankY] = 0;
          break;
        case 's' :
          s.blankX++;
          s.board[s.blankX-1][s.blankY] = s.board[s.blankX][s.blankY];
          s.board[s.blankX][s.blankY] = 0;
          break;
        default : System.out.println("Error");
      }
      System.out.println("\n Next State: ");
      s.printBoard();
    }

  }
}
class Status { 
  int state;
  int board[][];
  int blankX, blankY;
  StringBuilder sol;
  Status() {
    sol = new StringBuilder("");
    board = new int[3][3];
    blankX = blankY = 2;
    board[0][0] = 1; board[0][1] = 2; board[0][2] = 3;
    board[1][0] = 4; board[1][1] = 5; board[1][2] = 6;
    board[2][0] = 7; board[2][1] = 8; board[2][2] = 0;
    state = 0;
  }
  boolean equals (Status s) {
    boolean isEqual = true;
    for(int i = 0; isEqual && i < 3 ;i++)
      for(int j = 0; isEqual && j < 3 ;j++)
        isEqual = (s.board[i][j] == this.board[i][j]);

    return isEqual;
  }
  void printBoard() {
    for(int k = 0; k < 3; k++) {
      for(int j = 0; j < 3; j++) 
        System.out.print(" " + this.board[k][j]);
      System.out.println();
    }
  }
  static Status solve(Status s) { 
    boolean found = false;
    Queue <Status> q = new LinkedList <Status> ();

    Status s1 = new Status();
    Status s2 = new Status();
    Status finalStatus = new Status();

    q.add(s);

    while(!found && !q.isEmpty()) { 

      s1 = q.remove();

      if(s1.equals(finalStatus)) {
        found = true;
      } else { 
        s2 = s1;
        if(s2.state != 2) { 
          s2.state = 1;
          s2.sol.append("s");
          s2.blankX++;
          if((s2.blankX >= 0) && (s2.blankX < 3) && (s2.blankY >= 0) && (s2.blankY < 3)) { 
            s2.board[s2.blankX - 1][s2.blankY] = s2.board[s2.blankX][s2.blankY];
            s2.board[s2.blankX][s2.blankY] = 0;
            q.add(s2);
          } 
        }
        s2 = s1;
        if(s2.state != 1) { 
          s2.state = 2;
          s2.sol.append("n");
          s2.blankX--;
          if((s2.blankX >= 0) && (s2.blankX < 3) && (s2.blankY >= 0) && (s2.blankY < 3)) { 
            s2.board[s2.blankX + 1][s2.blankY] = s2.board[s2.blankX][s2.blankY];
            s2.board[s2.blankX][s2.blankY] = 0; 
            q.add(s2);
          }
        } 
        s2 = s1;
        if(s2.state != 4) { 
          s2.state = 3;
          s2.sol.append("e");
          s2.blankY++; 
          if((s2.blankX >= 0) && (s2.blankX < 3) && (s2.blankY >= 0) && (s2.blankY<3)) {
            s2.board[s2.blankX][s2.blankY - 1] = s2.board[s2.blankX][s2.blankY]; 
            s2.board[s2.blankX][s2.blankY] = 0;
            q.add(s2);
          }
        }
        s2 = s1;
        if(s2.state != 3) {
          s2.state = 4;
          s2.sol.append("w");
          s2.blankY--;
          if((s2.blankX >= 0) && (s2.blankX < 3) && (s2.blankY >= 0) && (s2.blankY < 3)) {
            s2.board[s2.blankX][s2.blankY + 1] = s2.board[s2.blankX][s2.blankY];
            s2.board[s2.blankX][s2.blankY] = 0;
            q.add(s2);
          }
        }
      }
    }
    return s1;
  }
}

