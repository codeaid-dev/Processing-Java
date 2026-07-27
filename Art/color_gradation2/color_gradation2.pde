void setup() {
  size(500,500);
  noStroke();
}

void draw() {
  background(255);
  for (int i=width; i>0; i-=2) {
    float c = map(i,0,width,0,255);
    fill(c);
    ellipse(width/2,height/2,i,i);
  }
}
