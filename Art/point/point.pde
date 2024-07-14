void setup() {
  size(500,500);
  noLoop();
}
void draw() {
  background(255);
  strokeWeight(10);
  float x,y;
  for (int i=0; i<360; i++) {
    x = width/2 + 200 * cos(radians(i));
    y = height/2 + 200 * sin(radians(i));
    point(x,y);
  }
  for (int i=0; i<180; i++) {
    x = width/2 + 150 * cos(radians(i));
    y = height/2 + 150 * sin(radians(i));
    point(x,y);
  }

  noStroke();
  fill(0);
  ellipse(width/2-50,height/2-50,50,100);
  ellipse(width/2+50,height/2-50,50,100);
}
