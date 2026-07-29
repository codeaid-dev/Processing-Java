void setup() {
  size(300,300);
}

void draw() {
  background(255);
  color f = color(255,0,0);
  color t = color(255,255,0);
  for (int i=0; i<width; i++) {
    float amt = map(i,0,width,0.0,1.0);
    color inter = lerpColor(f,t,amt);
    stroke(inter);
    line(i,0,i,height);
  }
}
