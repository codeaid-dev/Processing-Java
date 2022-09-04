float[] x = new float[50];
float[] y = new float[50];
int count = 0;
void setup() {
  size(500, 500);
}
void draw() {
  fill(255, 30);
  noStroke();
  rect(0,0,width,height);
  fill(180,240,255);
  for (int i=0; i<y.length; i++) {
    if (y[i] > 0) {
      ellipse(x[i], y[i], 5, 5);
      x[i] = x[i] + random(-1, 1);
      y[i] = y[i] + random(1, 3);
    }
  }
}
void mousePressed() {
  if (count < 50) {
    x[count] = mouseX;
    y[count] = mouseY;
    count += 1;
  }
}
