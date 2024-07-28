int angle=0;
float radius=1;
float cx,cy;
void setup() {
  size(500,500);
  background(255);
  angle = int(random(360));
  cx = width/2;
  cy = height/2;
}

void draw() {
  float x = cx + radius * cos(angle*PI/180);
  float y = cy + radius * sin(angle*PI/180);
  strokeWeight(5);
  point(x,y);
  if (x<0 || x>width || y<0 || y>height) {
    radius=1;
    cx = x;
    cy = y;
  }
  else radius+=5;
  if (x<0) angle = int(random(-90,90));
  if (x>width) angle = int(random(90,270));
  if (y<0) angle = int(random(0,180));
  if (y>height) angle = int(random(180,360));
}
