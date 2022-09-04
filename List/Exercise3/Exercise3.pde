float[] x = new float[5];
float[] y = new float[5];
void setup() {
  size(500,500);
  for (int i=0; i<5; i++) {
    x[i] = random(25,width-25);
    y[i] = random(25,height-25);
  }
}

void draw() {
  background(255);
  for (int i=0; i<5; i++) {
    fill(0);
    ellipse(x[i],y[i],50,50);
  }
}
