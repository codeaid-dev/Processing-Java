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
  angle = (angle+2*PI)%(2*PI);
  stroke(0);
  arc(centerX,centerY,50,50,0,angle,OPEN);
  showDegrees(angle);
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

void showDegrees(float r) {
  float d = degrees(r);
  textAlign(CENTER);
  textSize(20);
  text(ceil(d)+" degrees\n"+nf(r,1,2)+" radians",
      centerX,
      centerY+50);
}
