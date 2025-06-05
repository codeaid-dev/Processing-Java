float x=300,y=300;
boolean up, down, left, right;

void setup() {
  size(600,600);
  noStroke();
}

void draw() {
  background(0);
  if (keyPressed) {
    if (up)
      y -= 5;
    if (down)
      y += 5;
    if (left)
      x -= 5;
    if (right)
      x += 5;
  }
  fill(255,255,0);
  arc(x,y,30,30,radians(45),radians(315));
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
