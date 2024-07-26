float x,y;
int s;
int dx=4,dy=5;
color c;
void setup() {
  size(500,500);
  x = width/2;
  y = height/2;
  s = 50;
  c = color(random(255),random(255),random(255));
}
void draw() {
  background(255);
  noStroke();
  fill(c);
  ellipse(x,y,50,50);
  x += dx;
  y += dy;
  if (x<s/2 || x>width-s/2) dx *= -1;
  if (y<s/2 || y>width-s/2) dy *= -1;
}
