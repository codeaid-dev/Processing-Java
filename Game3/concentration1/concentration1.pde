void setup() {
  size(600,600);
}

void draw() {
  background(255);
  for (int i=0; i<16; i++) {
    ellipse(i%4*150+75,i/4*150+75,150,150);
  }
}
