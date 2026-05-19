float[][] paints = new float[5][3];
float[] placeX = new float[5];
float[] placeY = new float[5];
void setup() {
  size(500, 500);
  for (int i=0; i<5; i++) {
    for (int j=0; j<3; j++) {
      paints[i][j] = random(256);
    }
    placeX[i] = random(width);
    placeY[i] = random(height);
  }
}
void draw() {
  background(0);
  for (int i=0; i<5; i++) {
    fill(paints[i][0], paints[i][1], paints[i][2]);
    ellipse(placeX[i], placeY[i], 100, 100);
  }
}
