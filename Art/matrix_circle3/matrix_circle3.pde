float[][] colors = new float[81][3];
void setup() {
  size(500,500);
  noStroke();
  for (int i=0; i<81; i++) {
    colors[i][0] = random(255);
    colors[i][1] = random(255);
    colors[i][2] = random(255);
  }
}

void draw() {
  background(255);
  for (int i=0; i<81; i++) {
    fill(colors[i][0],colors[i][1],colors[i][2]);
    ellipse(50+(i%9)*50,50+(i/9)*50,40,40);
  }
}
