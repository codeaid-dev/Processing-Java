float x1=100,y1=100;
float x2=400,y2=400;
float circleX=x1,circleY=y1;
void setup() {
  size(500,500);
}

void draw() {
  background(255);
  strokeWeight(3);
  stroke(200);
  line(x1,y1,x2,y2);

  noStroke();
  fill(0);
  ellipse(circleX,circleY,60,60);
  float dx = x2 - circleX;
  float dy = y2 - circleY;
  float angle = atan2(dy,dx);
  circleX += cos(angle)*2;
  circleY += sin(angle)*2;
}
