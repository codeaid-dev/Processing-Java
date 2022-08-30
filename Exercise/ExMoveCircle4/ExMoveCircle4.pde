float[] x = new float[4];
float[] y = new float[4];
float[] dx = {2,2,2,2};
float[] dy = {3,3,3,3};
int[] status = {0,0,0,0};
void setup(){
  size(500, 500);
  for (int i=0; i<x.length; i++) {
    x[i] = random(1, 500);
    y[i] = random(1, 500);
  }
}

void draw(){
  background(0);
  for (int i=0; i<x.length; i++) {
    if (status[i] == 0) {
      x[i] += dx[i];
      y[i] += dy[i];
      if (x[i] > width || x[i] < 0) {
          dx[i] *= -1;
      }
      if (y[i] > height || y[i] < 0) {
          dy[i] *= -1;
      }
    }
  ellipse(x[i], y[i], 40, 40);
  }
}

void mousePressed() {
  for (int i=0; i<x.length; i++) {
    float dst = dist(mouseX, mouseY, x[i], y[i]);
    if (dst < 20) {
      if (status[i] == 0) {
        status[i] = 1;
      } else {
        status[i] = 0;
      }
    }
  }
}
