void setup() {
    size(500,500);
    noStroke();
}

void draw() {
  background(255);
  drawBall(width/2,height/2,200);
}

void drawBall(float x, float y, float d) {
  color f = color(255);
  color t = color(0);
  for (float i=d; i>0; i--) {
    float amt = map(i,0,d,0.0,1.0);
    color c = lerpColor(f,t,amt);
    fill(c);
    ellipse(x,y,i,i);
  }
}
