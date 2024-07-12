void setup() {
  size(500,500);
}

void draw() {
  strokeWeight(2);
  for (int i=0; i<250; i++) {
    stroke(i);
    line(0,i*2,width,i*2);
  }
}
