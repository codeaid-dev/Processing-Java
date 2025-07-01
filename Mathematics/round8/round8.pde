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
//  float x = width/2 + radius * cos(radians(angle*3));
  float y = height/2 + radius * sin(radians(angle*4));
  fill(0);
  ellipse(angle,y,10,10);
  if (angle>width) angle=0;
}
