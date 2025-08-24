void setup() {
  size(500,500);
}

void draw() {
  background(200);
  float x0 = 120.0;
  float y0 = 120.0;
  float x1 = mouseX;
  float y1 = mouseY;

  float x2 = 120.0;
  float y2 = 360.0;
  float x3 = 360.0;
  float y3 = 120.0;

  if (abs(x1-x0) < 0.01) {
    x1 = x0+0.01;
  }
  if (abs(x3-x2) < 0.01) {
    x3 = x2+0.01;
  }

  float t0 = (y1-y0)/(x1-x0);
  float t1 = (y3-y2)/(x3-x2);

  float x = 0;
  float y = 0;
  if (t0 != t1) {
    x = (y2-y0+t0*x0-t1*x2)/(t0-t1);
    y = t0*(x-x0)+y0;
  }

  float r0 = (x-x0)/(x1-x0);
  float r1 = (x-x2)/(x3-x2);
  boolean hit = 0<r0 && r0<1 && 0<r1 && r1<1;
  strokeWeight(3);
  line(x0,y0,x1,y1);
  line(x2,y2,x3,y3);

  if (hit && t0 != t1) {
    strokeWeight(24);
    point(x,y);
  }
}
