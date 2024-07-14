class Rect {
  float x,y,rad;
  int speed;
}

Rect[] rects = new Rect[4];

void setup() {
  size(500,500);
  for (int i=0; i<4; i++) {
    Rect r = new Rect();
    r.x = 125+i%2*250;
    r.y = 125+i/2*250;
    r.speed = 1;
    r.rad = radians(r.speed);
    rects[i] = r;
  }
}

void draw() {
  background(0);
  fill(255);
  rectMode(CENTER);
  for (Rect r : rects) {
    pushMatrix();
    translate(r.x,r.y);
    r.rad += radians(r.speed);
    rotate(r.rad);
    rect(0,0,50,50);
    popMatrix();
  }
}
