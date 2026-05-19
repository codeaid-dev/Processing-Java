int count = 100;
float[] starX = new float[count];
float[] starY = new float[count];
float[] starS = new float[count];
void setup() {
  size(600,400);
  for (int i=0; i<count; i++) {
    starX[i] = random(width);
    starY[i] = random(height);
    starS[i] = random(1,6);
  }
}
void draw() {
  background(0);
  for (int i=0; i<count; i++) {
    noStroke();
    ellipse(starX[i], starY[i], starS[i], starS[i]);
  }
}
