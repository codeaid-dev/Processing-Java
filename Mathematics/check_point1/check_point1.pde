float centerX,centerY;
void setup() {
  size(500,500);
  centerX = width/2;
  centerY = height/2;
}

void draw() {
  background(255);
  drawGuide();
  float angle = atan2(mouseY-centerY, mouseX-centerX);
  float x = centerX+200*cos(angle);
  float y = centerY+200*sin(angle);
  stroke(0);
  line(centerX,centerY,x,y);
  fill(0);
  ellipse(x,y,10,10);
}

void drawGuide() {
  noFill();
  stroke(200);
  ellipse(centerX,centerY,400,400);
  line(centerX,centerY-200,centerX,centerY+200);
  line(centerX-200,centerY,centerX+200,centerY);
}
