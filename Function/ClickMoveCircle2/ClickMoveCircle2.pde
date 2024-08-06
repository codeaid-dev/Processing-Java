float x=0;
float y=0;
int dx=2;
int dy=3;
int status=0;
void setup() {
  size(500, 500);
  x = random(1, 500);
  y = random(1, 500);
}

void draw() {
  background(0);
  if (status == 0) {
    x += dx;
    y += dy;
    if (x > width-20 || x < 20) {
      dx *= -1;
    }
    if (y > height-20 || y < 20) {
      dy *= -1;
    }
  }
  ellipse(x, y, 40, 40);
}

void mousePressed() {
  status = status == 0 ? 1 : 0;
}
