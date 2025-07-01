int angle=0;
float radius = 200;
void setup() {
  size(500,500);
    noStroke();
}

void draw() {
  fill(255,10);
  rect(0,0,width,height);
  angle += 1;
  float x = width/2 + radians(angle)*5 * cos(radians(angle));
  float y = height/2 + radians(angle)*5 * sin(radians(angle));
  fill(0);
  ellipse(x,y,10,10);
}
