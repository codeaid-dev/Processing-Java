class Ball {
  float x,y,d;
  Ball(float x, float y, float d) {
    this.x = x;
    this.y = y;
    this.d = d;
  }
}
ArrayList<Ball> balls = new ArrayList<Ball>();

void setup() {
  size(500,500);
  noStroke();
  for (int i=0; i<20; i++) {
    Ball b = new Ball(
              random(25,width-25),
              random(25,height-25),
              50);
    balls.add(b);
  }
}

void draw() {
  background(255);
  for (Ball b : balls) {
    drawBall(b.x,b.y,b.d);
  }
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
