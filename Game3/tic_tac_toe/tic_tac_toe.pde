PVector[] tiles = new PVector[9];
char[] piece = new char[9];
boolean turn = true; //true:O, false:X
int[][] wins = {
        {0,1,2},
        {3,4,5},
        {6,7,8},
        {0,3,6},
        {1,4,7},
        {2,5,8},
        {0,4,8},
        {2,4,6}
        };
int[] winner;

void setup() {
  size(450,450);
  textSize(75);
  textAlign(CENTER);
  strokeWeight(3);
  line(width/3,0,width/3,height);
  line(width/3*2,0,width/3*2,height);
  line(0,height/3,width,height/3);
  line(0,height/3*2,width,height/3*2);
  for (int i=0; i<9; i++)
      tiles[i] = new PVector(75+i%3*150,75+i/3*150);
}

void draw() {
  for (int i=0; i<9; i++) {
    if (piece[i] != 0) {
      boolean found = false;
      if (winner != null) {
        for (int num : winner) {
          if (num == i) {
            found = true;
            break;
          }
        }
      }
      if (found)
        fill(255,0,0);
      else
        fill(0);
      text(piece[i],tiles[i].x,tiles[i].y+30);
    }
  }
}

void mousePressed() {
  float x = mouseX;
  float y = mouseY;
  for (int i=0; i<9; i++) {
    if (tiles[i].x-75<x && x<tiles[i].x+75
      && tiles[i].y-75<y && y<tiles[i].y+75) {
      if (piece[i] == 0) {
        if (turn) {
          piece[i] = 'O';
          turn = false;
        } else {
          piece[i] = 'X';
          turn = true;
        }
      }
    }
  }
  if (winner == null)
    check();
}

void check() {
  for (int i=0; i<wins.length; i++) {
    int a = wins[i][0];
    int b = wins[i][1];
    int c = wins[i][2];
    if (piece[a]!=0
      && piece[a]==piece[b]
      && piece[a]==piece[c])
      winner = wins[i];
  }
}
