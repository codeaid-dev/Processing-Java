int xpos=0, ypos=0;
boolean over = false;
int mazew=15,mazeh=15;
int[][] maze = new int[mazeh][mazew];
int start=0;
float passed=0;

void make_maze() {
  int[] dx = {-1,1,0,0};
  int[] dy = {0,0,1,-1};
  for (int y=1; y<mazeh-1; y+=2) {
    for (int x=1; x<mazew-1; x+=2) {
      maze[y][x] = 1;
      int d = int(random(3));
      if (y == 1)
        d = int(random(4));
      maze[y+dy[d]][x+dx[d]] = 1;
    }
  }
}

void set_tresure() {
  while (true) {
    int tresurex = int(random(1,mazew-1));
    int tresurey = int(random(1,mazeh-1));
    if (maze[tresurey][tresurex] == 0) {
      maze[tresurey][tresurex] = 2;
      break;
    }
  }
}

void setup() {
  size(600,600);
  noStroke();
  make_maze();
  set_tresure();
  start = millis();
}

void draw() {
  background(255);
  fill(128);
  for (int y=0; y<mazeh; y++) {
    for (int x=0; x<mazew; x++) {
      if (maze[y][x] == 1
          && x <= xpos+2
          && x >= xpos-2
          && y <= ypos+2
          && y >= ypos-2)
        rect(x*40, y*40, 40, 40);
    }
  }

  if (over)
    fill(255, 0, 0);
  else
    fill(0,255,0);
  ellipse(xpos*40+20, ypos*40+20, 30, 30);

  if (maze[ypos][xpos] == 2) {
    textSize(30);
    textAlign(CENTER);
    text("FIND!!",width/2,height/2);
    if (passed == 0)
      passed = (millis()-start)/1000.0;
    text(passed,width/2,height/2+40);
    over = true;
    return;
  }
}

void keyPressed() {
  if (over)
    return;
  int dx = xpos;
  int dy = ypos;
  if (keyCode == UP)
    dy -= 1;
  if (keyCode == DOWN)
    dy += 1;
  if (keyCode == LEFT)
    dx -= 1;
  if (keyCode == RIGHT)
    dx += 1;
  if (0 <= dx && dx < mazew && 0 <= dy && dy < mazeh) {
    if (maze[dy][dx] != 1) {
      xpos = dx;
      ypos = dy;
    }
  }
}
