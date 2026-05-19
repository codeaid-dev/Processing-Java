float[] xList = new float[4];
float[] yList = new float[4];
void setup() {
  size(600,400);
}

void draw() {
  background(255);
  fill(0);
  for (int i=0; i<4; i++) {
    xList[i] = 40+140*i;
    yList[i] = 150;
    rect(xList[i], yList[i], 100, 100);
  }
}
