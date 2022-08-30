float x, y;
float dx = 2;
float dy = 3;
int status = 0;
void setup(){
  size(500, 500);
  x = random(1, 500);
  y = random(1, 500);
}

void draw(){
  background(0);
  if (status == 0) {
    x += dx;
    y += dy;
    if (x > width || x < 0) {
        dx *= -1;
    }
    if (y > height || y < 0) {
        dy *= -1;
    }
  }
  ellipse(x, y, 40, 40);
}

void mousePressed() {
  float dst = dist(mouseX, mouseY, x, y);
  if (dst < 20) {
    if (status == 0) {
      status = 1;
    } else {
      status = 0;
    }
  }
}
