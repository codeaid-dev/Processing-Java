float x, y ;
int w, h;
float sx = 0, sy = 0;
boolean gameOver=false;
boolean rect1=false;
boolean rect2=false;
boolean clear=false;
int count=600;

void setup() {
  size(600, 400);
  x = width/2;
  y = height/2;
  w = 30;
  h = 30;
}

void draw() {
  background(255);

  fill(255,255,0);
  rect(0, 0, count, 30);
  count -= 1;

  if (rect1) {
    fill(255,0,0);
  } else if (x+w/2 >= 50 && x-w/2 <= 50+100
      && y+h/2 >= 50 && y-h/2 <= 50+100) {
    fill(255,0,0);
    rect1 = true;
  } else {
    fill(255);
  }
  rect(50, 50, 100, 100);

  if (rect2) {
    fill(0,0,255);
  } else if (x+w/2 >= 450 && x-w/2 <= 450+100
      && y+h/2 >= 250 && y-h/2 <= 250+100) {
    fill(0,0,255);
    rect2 = true;
  } else {
    fill(255);
  }
  rect(450, 250, 100, 100);

  fill(0);
  ellipse(x, y, w, h);

  if (rect1 && rect2) {
    textSize(50);
    textAlign(CENTER);
    text("CLEAR", 300, 200);
    return;
  }
  if (gameOver || count<0) {
    textSize(50);
    textAlign(CENTER);
    text("GAME OVER", 300, 200);
    return;
  }
  
  if (keyPressed) {
    if (keyCode == UP) {
      sy -= 1;
    }
    if (keyCode == DOWN) {
      sy += 1;
    }
    if (keyCode == LEFT) {
      sx -= 1;
    }
    if (keyCode == RIGHT) {
      sx += 1;
    }
  }

  sy += 0.1;
  sx *= 0.98;
  sy *= 0.98;
  x += sx;
  y += sy;
  
  if (x < w/2 || x > (width - w/2) || y < h/2 || y > (height - h/2)) {
    gameOver = true;
  }
}
