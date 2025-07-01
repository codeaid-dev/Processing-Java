float x = 250;
float y = 250;
void setup(){
  size(500,500);
  background(0);
  strokeWeight(5);
}
void draw(){
  float nextX = x + random(-5,5);
  float nextY = y + random(-5,5);
  if (nextX < 0) {
    nextX = 0;
  } else if (nextX > width) {
    nextX = width;
  }
  if (nextY < 0) {
    nextY = 0;
  } else if (nextY > height) {
    nextY = height;
  }
  stroke(0,255,0,100);
  line(x,y,nextX,nextY);
  x = nextX;
  y = nextY;
}
