int angle=0;
float px=0,py=0;
float radius = 200;
void setup() {
  size(500,500);
  px = width/2 + radius * cos(radians(angle));
  py = height/2 + radius * sin(radians(angle));
  strokeWeight(10);
}

void draw() {
  angle += 1;
  float x = width/2 + radius * cos(radians(angle));
  float y = height/2 + radius * sin(radians(angle));
  stroke(0);
  line(px,py,x,y);
  px = x;
  py = y;
}
