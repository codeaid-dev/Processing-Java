float x = 250, y = 400, s = 50;
boolean up, down, left, right;
void setup() {
    size(500,800);
    noStroke();
}

void draw() {
  background(255);
  fill(0,0,255);
  ellipse(x,y,s,s);

  if (keyPressed) {
    if (up) y -= 3;
    if (down) y += 3;
    if (left) x -= 3;
    if (right) x += 3;
  }
  if (x < s/2) x += 3;
  if (x > width-s/2) x -= 3;
  if (y < s/2) y += 3;
  if (y > height-s/2) y -= 3;
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
