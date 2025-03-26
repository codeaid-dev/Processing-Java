int GRID_SIZE = 8;
int CELL_SIZE = 100;
int EMPTY = 0;
int BLACK = 1;
int WHITE = 2;
int[][] board = new int[GRID_SIZE][GRID_SIZE];
int current_player = BLACK;
int[][] DIR8 = {{-1, -1},
        {-1, 0},
        {-1, 1},
        {0, -1},
        {0, 1},
        {1, -1},
        {1, 0},
        {1, 1}};

void setup() {
  size(800,800);
  noLoop();
  reset();
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

void mousePressed() {
  int x = mouseX/CELL_SIZE;
  int y = mouseY/CELL_SIZE;

  if (valid_move(x, y, current_player)) {
    make_move(x, y, current_player);
    current_player =
    current_player==BLACK ? WHITE : BLACK;
    redraw();
  }
}

boolean valid_move(int x,int y, int player) {
  if (board[x][y] != EMPTY)
      return false;

  for (int[] dir : DIR8) {
    int dx = dir[0];
    int dy = dir[1];
    int nx = x+dx;
    int ny = y+dy;
    int side = player==BLACK ? WHITE : BLACK;
    if (on_board(nx,ny)
        && board[nx][ny] == side) {
      while (on_board(nx,ny) && board[nx][ny] != EMPTY) {
        if (board[nx][ny] == player)
          return true;
        nx+=dx;
        ny+=dy;
      }
    }
  }
  return false;
}

boolean on_board(int x,int y) {
  return 0<=x && x<GRID_SIZE && 0<=y && y<GRID_SIZE;
}

void make_move(int x,int y,int player) {
  board[x][y] = player;
  for (int[] dir : DIR8) {
    int dx = dir[0];
    int dy = dir[1];
    flip_pieces(x, y, dx, dy, player);
  }
}

void flip_pieces(int x,int y,int dx,int dy,int player) {
  int nx=x+dx;
  int ny=y+dy;
  ArrayList<int[]> pieces_to_flip = new ArrayList<int[]>();
  int side = player==BLACK ? WHITE : BLACK;
  while (on_board(nx, ny)
        && board[nx][ny] == side) {
    int[] ndir = {nx, ny};
    pieces_to_flip.add(ndir);
    nx+=dx;
    ny+=dy;
  }

  if (on_board(nx, ny)
      && board[nx][ny] == player) {
    for (int[] f : pieces_to_flip) {
      int fx = f[0];
      int fy = f[1];
      board[fx][fy] = player;
    }
  }
}

void keyPressed() {
  if (key == 'r') {
    reset();
    redraw();
  }
}

void reset() {
  current_player = BLACK;
  for (int i=0; i<GRID_SIZE*GRID_SIZE; i++) {
    int x = i%8;
    int y = i/8;
    board[x][y] = 0;
  }
  board[3][3] = WHITE;
  board[4][4] = WHITE;
  board[3][4] = BLACK;
  board[4][3] = BLACK;
}
