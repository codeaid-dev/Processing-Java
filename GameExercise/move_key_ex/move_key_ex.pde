float x  = 250, y = 250;
boolean up, down, left, right;

void setup() {
  size(500,500);
}

void draw() {
  background(255);
  if (up) y -= 5;
  if (down) y += 5;
  if (left) x -= 5;
  if (right) x += 5;
  fill(0,0,255);
  ellipse(x,y,30,30);
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
