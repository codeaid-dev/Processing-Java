int[][] maze = new int[15][15];
int xpos = 0, ypos = 0;
int bombX = (int)random(3,15);
int bombY = (int)random(3,15);
boolean over = false;
float timer = 600;

void setup() {
  noStroke();
  size(600, 600);
  for (int y = 0; y < 15; y++) {
    for (int x = 0; x < 15; x++) {
      if (x % 2 == 1 && y % 2 == 1) {
        maze[y][x] = 1;
        int d;
        if (y == 1) {
          d = (int)random(4);
        } else {
          d = (int)random(3);
        }
        switch(d) {
        case 0:
          maze[y][x-1] = 1; 
          break;  // left
        case 1:
          maze[y][x+1] = 1; 
          break;  // right
        case 2:
          maze[y+1][x] = 1; 
          break;  // down  
        case 3:
          maze[y-1][x] = 1; 
          break;  // up
        }
      }
    }
  }

  while(true){
    bombX = (int)random(3,15);
    bombY = (int)random(3,15);
    if (maze[bombY][bombX] == 0) {
      maze[bombY][bombX] = 2;
      break;
    }
  }
}

void keyPressed() {
  int dx = xpos, dy = ypos;
  if (over) {
    return;
  }
  if (keyCode == UP) {
    dy += -1;
  } else if (keyCode == DOWN) {
    dy += 1;
  } else if (keyCode == LEFT) {
    dx += -1;
  } else if (keyCode == RIGHT) {
    dx += 1;
  }
  if (dx >=0 && dx < 15 && dy >=0 && dy < 15) {
    if (maze[dy][dx] != 1) {
      xpos = dx;
      ypos = dy;
    }
  }
}

void draw() {
  background(128);
  fill(255);
  for (int y = 0; y < 15; y++) {
    for (int x = 0; x < 15; x++) {
      if (maze[y][x] == 1) {
        rect(x*40, y*40, 40, 40);
      }
    }
  }

  if (over) {
    fill(255, 0, 0);
  } else {
    fill(0, 255, 0);
  }
  ellipse(xpos*40+20, ypos*40+20, 30, 30);

  if (maze[ypos][xpos] == 2) {
    textSize(30);
    textAlign(CENTER);
    text("FIND!!", width/2, height/2);
    over = true;
    return;
  }

  fill(255,0,0,128);
  rect(0,0,timer,20);
  timer -= 0.1;
  if (timer < 0) {
    textSize(30);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
    over = true;
    return;
  }
}
