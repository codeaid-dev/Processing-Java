float px=0,py=0;
float psize = 20;
void setup() {
  size(600, 400);
}
void draw() {
  background(0);
  px = mouseX;
  py = mouseY;
  noStroke();
  fill(255);
  ellipse(px,py,psize,psize);
}
