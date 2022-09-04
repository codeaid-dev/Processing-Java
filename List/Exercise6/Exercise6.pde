float x[] = new float[3];
float y[] = new float[3];
float dx[] = new float[3];
float dy[] = new float [3];

void setup(){
  size(500, 500);
  for (int i=0; i<3; i++) {
    x[i] = 250;
    y[i] = 250;
    dx[i] = random(1,4);
    dy[i] = random(1,4);
  }
}

void draw(){
  background(0);
  for (int i=0; i<3; i++) {
    x[i] += dx[i];
    y[i] += dy[i];
    if (x[i] > width || x[i] < 0) {
      dx[i] *= -1;
    }
    if (y[i] > height || y[i] < 0) {
      dy[i] *= -1;
    }
    ellipse(x[i], y[i], 30, 30);
  }
}
