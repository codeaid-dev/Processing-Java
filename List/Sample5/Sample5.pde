void setup() {
    size(500, 500);
}
void draw() {
  background(255);
  float[] x = {50, 100, 150, 200, 250, 300, 350, 400, 450};
  float[] y = {50, 100, 150, 200, 250, 300, 350, 400, 450};
  for (int i=0; i<9; i++) {
    ellipse(x[i], y[i], 20, 20);
  }
}
