float centerX=0,centerY=0;
float followX=450,followY=450;
void setup() {
  size(500,500);
  centerX = width/2;
  centerY = height/2;
}

void draw() {
  background(255);
  fill(0);
  ellipse(mouseX,mouseY,10,10);

  drawSinCos(mouseX,mouseY);
  followCircle();
}

void drawSinCos(float x,float y) {
  strokeWeight(1);
  stroke(0);
  line(followX,followY,x,y);
  stroke(0,200,0);
  line(followX,followY,followX,y);
  strokeWeight(5);
  point(followX,y);
  strokeWeight(1);
  stroke(255,175,0);
  line(followX,followY,x,followY);
  strokeWeight(5);
  point(x,followY);
}

void showDegrees(float angle) {
  angle = (angle+2*PI)%(2*PI);
  fill(0);
  textSize(30);
  textAlign(CENTER);
  text(str(ceil(degrees(angle)))+" degrees",
       centerX,height-100);
  text(str(int(angle*100)/100.0)+" radians",
       centerX,height-50);
}

void followCircle() {
  float dx = mouseX - followX;
  float dy = mouseY - followY;
  float angle = atan2(dy,dx);
  float distance = dist(followX,followY,
                        mouseX,mouseY);
  if (distance >= 1) {
    followX += cos(angle)*2;
    followY += sin(angle)*2;
  }
  noStroke();
  fill(255,0,0);
  ellipse(followX,followY,20,20);
  showDegrees(angle);
}
