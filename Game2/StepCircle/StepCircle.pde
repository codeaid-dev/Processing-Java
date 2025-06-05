float x=0, y=0, g=0;
float w=30, h=30;
float sx=0, sy=0;
boolean over = false;
boolean clear = false;
float count = 400;
boolean up, left, right;

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

  if (over) {
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

  if (10 <= x && x <= 60 && 350 >= y && y >= 347-w/2
      || 110 <= x && x <= 160 && 300 >= y && y >= 293-h/2
      || 210 <= x && x <= 260 && 250 >= y && y >= 247-h/2
      || 310 <= x && x <= 360 && 200 >= y && y >= 193-h/2
      || 410 <= x && x <= 460 && 150 >= y && y >= 147-h/2) {
    g = 0;
  } else if (510 <= x && x <= 560 && 100 >= y && y >= 93-h/2) {
    g = 0;
    clear = true;
  } else {
    g += 0.1;
  }

  if (keyPressed) {
    if (up && g == 0)
      sy -= 7;
    if (left)
      sx -= 0.1;
    if (right)
      sx += 0.1;
  }

  sx *= 0.98;
  sy *= 0.98;
  x += sx;
  y += sy;
  y += g;

  if (x < w/2 || x > (width - w/2) || y < h/2 || y > (height - h/2))
    over = true;
}

void keyPressed() {
  if (keyCode == UP) up = true;
  if (keyCode == LEFT) left = true;
  if (keyCode == RIGHT) right = true;
}

void keyReleased() {
  if (keyCode == UP) up = false;
  if (keyCode == LEFT) left = false;
  if (keyCode == RIGHT) right = false;
}
