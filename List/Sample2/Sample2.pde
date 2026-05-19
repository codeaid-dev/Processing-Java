void setup() {
    size(500, 500);
}
void draw() {
  background(255);
  float[] x = {200,350,450,150};
  float[] y = {100,400,200,300};
  float[] s = {30,100,50,200};
  for (int i=0; i<4; i++) {
    fill(0);
    ellipse(x[i], y[i], s[i], s[i]);
  }
}
