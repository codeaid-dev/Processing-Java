float x = 250;
float y = 400;
float s = 50;
void setup() {
    size(500,800);
    noStroke();
}

void draw() {
  background(255);
  fill(0,0,255);
  ellipse(x,y,s,s);

  if (keyPressed) {
    if (keyCode == RIGHT) {
      x += 3;
    }
    if (keyCode == LEFT) {
      x -= 3;
    }
    if (keyCode == UP) {
      y -= 3;
    }
    if (keyCode == DOWN) {
      y += 3;
    }
  }
  if (x < s/2) {
    x += 3;
  }
  if (x > width-s/2) {
    x -= 3;
  }
  if (y < s/2) {
    y += 3;
  }
  if (y > height-s/2) {
    y -= 3;
  }
}
