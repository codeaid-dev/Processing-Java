void setup() {
  size(600,300);
}

void draw() {
  background(0);
  strokeWeight(2);
  for (int i=0; i<=width/2; i++) {
    float c = map(i,0,width/2,0,255);
    stroke(c);
    line(i*2,0,i*2,height);
  }
}
