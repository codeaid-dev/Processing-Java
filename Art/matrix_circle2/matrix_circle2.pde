void setup() {
  size(500,500);
  noStroke();
}

void draw() {
  if (frameCount%60 == 0) {
    background(255);
    for (int i=0; i<9; i++) {
      for (int j=0; j<9; j++) {
        fill(random(255),random(255),random(255));
        ellipse(50+j*50,50+i*50,40,40);
      }
    }
  }
}
