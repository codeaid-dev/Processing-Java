void setup() {
    size(500,500);
}

void draw() {
  background(0);
  stroke(255);
  color f = color(255,0,0);
  color t = color(255,255,0);
  for (int i=0; i<5; i++) {
    float amt = map(i,0,5,0.0,1.0);
    color inter = lerpColor(f,t,amt);
    fill(inter);
    rect(i*100,0,100,height);
  }
}
