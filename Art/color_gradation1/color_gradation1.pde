void setup() {
  size(600,300);
}

void draw() {
  background(0);
  for (int i=0; i<=width; i++) {
    float c = map(i,0,width,0,255);
    stroke(c);
    line(i,0,i,height);
  }
}
