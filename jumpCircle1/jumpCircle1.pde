float x, y, g;
int w, h;
float sx=0, sy=0;
boolean gameOver=false;
boolean clear=false;
float count = 400;

void setup() {
  size(600, 400);
  x = 40;
  y = 40;
  g = 1;
  w = 30;
  h = 30;
}

void draw() {
  background(255);

  stroke(0);
  strokeWeight(6);
  line(10, 350, 60, 350);
  line(110, 300, 160, 300);
  line(210, 250, 260, 250);
  line(310, 200, 360, 200);
  line(410, 150, 460, 150);
  stroke(255, 0, 0);
  line(510, 100, 560, 100);

  noStroke();
  fill(0);
  ellipse(x, y, w, h);

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

    if (onBar() == 1) {
      g = 0;
    } else if (onBar() == 2) {
      g = 0;
      clear = true;
    } else {
      g += 0.1;
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
    if (keyCode == 0) {
      if (onBar() == 1) {
        g = -5;
      }
    }
  }

    sx *= 0.98;
    sy *= 0.98;
    x += sx;
    y += sy;
    y += g;

    if (x < w/2 || x > (width - w/2) || y < h/2 || y > (height - h/2)) {
      gameOver = true;
    }
}

int onBar() {
  if (x >= 10 && x <= 60 && y >= 347-w/2
        || x >= 110 && x <= 160 && y >= 293-w/2
        || x >= 210 && x <= 260 && y >= 247-w/2
        || x >= 310 && x <= 360 && y >= 193-w/2
        || x >= 410 && x <= 460 && y >= 147-w/2
        ) {
    return 1;
  } else if (x >= 510 && x <= 560 && y >= 93-w/2) {
    return 2;
  }
  return 0;
}
