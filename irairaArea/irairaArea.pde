float x, y;
float pSize;
float sx=0, sy=0;
int wallCount = 54;
float[] wallX = new float[wallCount];
float[] wallY = new float[wallCount];
boolean gameOver=false;
boolean clear=false;
float count = 400;
int goal;

void setup() {
  size(600, 400);
  x = 60;
  y = 60;
  pSize = 30;

  for (int i = 0; i < wallCount; i++) {
    wallX[i] = (pSize+(pSize*2+8)*(i % 9));
    wallY[i] = (pSize+(pSize*2+8)*(i / 9));
  }
  goal = (int)random(wallCount);
}

void draw() {
  background(255);
  noStroke();

  fill(255, 183, 0);
  rect(0, 0, 30, count);
  count -= 0.6;

  for (int i = 0; i <wallCount; i++) {
    if (i == goal) {
      fill(0, 0, 255);
    } else {
      fill(255, 0, 0);
    }
    ellipse(wallX[i], wallY[i], pSize, pSize);
  }

  if (mousePressed && !gameOver) {
    x = mouseX;
    y = mouseY;
  }
  fill(0);
  ellipse(x, y, pSize, pSize);

  if (gameOver) {
    textSize(50);
    textAlign(CENTER);
    text("GAME OVER", 300, 200);
    return;
  }
  if (clear) {
    textSize(50);
    textAlign(CENTER);
    text("CLEAR", 300, 200);
    return;
  }

  if (keyPressed) {
    if (keyCode == UP) {
      sy -= 0.1;
    }
    if (keyCode == DOWN) {
      sy += 0.1;
    }
    if (keyCode == LEFT) {
      sx -= 0.1;
    }
    if (keyCode == RIGHT) {
      sx += 0.1;
    }
  }

  sx *= 0.98;
  sy *= 0.98;
  x += sx;
  y += sy;

  if (x < pSize/2 || x > (width - pSize/2) || y < pSize/2 || y > (height - pSize/2)) {
    gameOver = true;
  }
  if (count < 0) {
    gameOver = true;
  }
  
  for (int i = 0; i < wallCount; i++) {
    int check = isHit(x, y, pSize, wallX[i], wallY[i], pSize, i);
    if (check == 1) {
      clear = true;
    } else if (check == 2) {
      gameOver = true;
    }
  }
}

int isHit(float px, float py, float ps, float ex, float ey, float es, int id){
  float distance = dist(px, py, ex, ey);
  if(distance < ps / 2 + es / 2){
    if (id == goal) {
      return 1;
    } else {
      return 2;
    }
  }
  return 0;
}
