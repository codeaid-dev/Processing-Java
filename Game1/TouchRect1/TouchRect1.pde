float px=0, py=0, ps=0;
float sx=0, sy=0;
boolean up, down, left, right;

void setup() {
  size(600, 500);
  px = width/2;
  py = height/2;
  ps = 30;
}

void draw() {
  background(255);
  fill(0);
  ellipse(px, py, ps, ps);

  if (keyPressed) {
    if (up)
      sy -= 1;
    if (down)
      sy += 1;
    if (left)
      sx -= 1;
    if (right)
      sx += 1;
  }

  sx *= 0.98;
  sy *= 0.98;
  px += sx;
  py += sy;
}

void keyPressed() {
  if (keyCode == UP) up = true;
  if (keyCode == DOWN) down = true;
  if (keyCode == LEFT) left = true;
  if (keyCode == RIGHT) right = true;
}

void keyReleased() {
  if (keyCode == UP) up = false;
  if (keyCode == DOWN) down = false;
  if (keyCode == LEFT) left = false;
  if (keyCode == RIGHT) right = false;
}
