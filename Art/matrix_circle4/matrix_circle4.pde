float[] en1_x = new float[81];
float[] en2_x = new float[81];
void setup() {
  size(500,500);
  noStroke();
  for (int i=0; i<81; i++) {
    float x=0;
    x = random(-10,10);
    en1_x[i] = x;
    x = random(-10,10);
    en2_x[i] = x;
  }
}

void draw() {
  background(255);
  for (int i=0; i<81; i++) {
    fill(150,210,250,180);
    ellipse((50+en1_x[i])+(i%9)*50,
            50+(i/9)*50,
            60,60);
  }

  for (int i=0; i<81; i++) {
    fill(60,190,255,180);
    ellipse((50+en2_x[i])+(i%9)*50,
            50+(i/9)*50,
            40,40);
  }
}
