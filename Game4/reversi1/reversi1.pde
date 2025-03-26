int GRID_SIZE = 8;
int CELL_SIZE = 100;
int EMPTY = 0;
int BLACK = 1;
int WHITE = 2;
int[][] board = new int[GRID_SIZE][GRID_SIZE];

void setup() {
  size(800,800);
//  size(GRID_SIZE*CELL_SIZE, GRID_SIZE*CELL_SIZE);
  noLoop();
  board[3][3] = WHITE;
  board[4][4] = WHITE;
  board[3][4] = BLACK;
  board[4][3] = BLACK;
}

void draw() {
  draw_board();
  draw_pieces();
}

void draw_board() {
  background(0,128,0);
  stroke(0);
  strokeWeight(2);
  for (int i=0; i<GRID_SIZE+1; i++) {
    line(i*CELL_SIZE, 0, i*CELL_SIZE, height);
    line(0, i*CELL_SIZE, width, i*CELL_SIZE);
  }
}

void draw_pieces() {
  for (int i=0; i<GRID_SIZE; i++) {
    for (int j=0; j<GRID_SIZE; j++) {
      if (board[i][j] == BLACK) {
        fill(0);
        ellipse(i*CELL_SIZE+CELL_SIZE/2,
                j*CELL_SIZE+CELL_SIZE/2,
                CELL_SIZE-10, CELL_SIZE-10);
      } else if (board[i][j] == WHITE) {
        fill(255);
        ellipse(i*CELL_SIZE+CELL_SIZE/2,
                j*CELL_SIZE+CELL_SIZE/2,
                CELL_SIZE-10, CELL_SIZE-10);
      }
    }
  }
}
