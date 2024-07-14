float radius = 0;
float angle = 0;
void setup() {
  size(500,500);
  background(0);
  noStroke();
  radius = width/4;
}

void draw() {
  angle += 0.1;
  float x = width/2 + radius * cos(radians(angle));
  float y = height/2 + radius * sin(radians(angle));
  fill(255);
  ellipse(x,y,5,5);
  float ex = x + radius * cos(radians(angle)*36);
  float ey = y + radius * sin(radians(angle)*36);
  fill(255,0,0);
  ellipse(ex,ey,5,5);
}
