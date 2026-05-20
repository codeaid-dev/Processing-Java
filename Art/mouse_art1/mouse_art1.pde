float centerX, centerY;
void setup() {
  size(500,500);
  background(0);
  stroke(200);
  centerX = width/2;
  centerY = height/2;
}

void draw() {
  if (mousePressed) {
    float angle = atan2(mouseY-centerY,mouseX-centerX);
    float pd = dist(pmouseX,pmouseY,centerX,centerY);
    float d = dist(mouseX,mouseY,centerX,centerY);
    for (float i=0; i<TWO_PI; i+=TWO_PI/36) {
      float px = centerX+pd * cos(angle+i);
      float py = centerY+pd * sin(angle+i);
      float x = centerX+d * cos(angle+i);
      float y = centerY+d * sin(angle+i);
      line(px,py,x,y);
    }
  }
}