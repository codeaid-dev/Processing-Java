float[] x = new float[4];
float[] y = new float[4];
int[] dx = new int[4];
int[] dy = new int[4];
int[] status = new int[4];
void setup() {
  size(500, 500);
  for (int i=0; i<4; i++) {
    x[i] = random(1, 500);
    y[i] = random(1, 500);
    dx[i] = int(random(2, 4));
    dy[i] = int(random(2, 4));
    status[i] = 0;
  }
}

void draw() {
  background(0);
  for (int i=0; i<4; i++) {
    if (status[i] == 0) {
      x[i] += dx[i];
      y[i] += dy[i];
      if (x[i] > width-20 || x[i] < 20) {
        dx[i] *= -1;
      }
      if (y[i] > height-20 || y[i] < 20) {
        dy[i] *= -1;
      }
    }
    ellipse(x[i], y[i], 40, 40);
  }
}

void mousePressed() {
  for (int i=0; i<4; i++) {
    float dst = dist(mouseX, mouseY, x[i], y[i]);
    if (dst < 20)
      status[i] = status[i] == 0 ? 1 : 0;
  }
}
