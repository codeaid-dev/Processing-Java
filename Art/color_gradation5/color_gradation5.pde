void setup() {
    size(500,500);
    noStroke();
}

void draw() {
  background(255);
  color f = color(0);
  color t = color(255);
  for (int i=width; i>0; i--) {
    float amt = map(i,0,width,0.0,1.0);
    color c = lerpColor(f,t,amt);
    fill(c);
    ellipse(width/2,height/2,i,i);
  }
}
