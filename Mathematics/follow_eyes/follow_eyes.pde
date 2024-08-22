void setup() {
  size(500,500);
}

void draw() {
  background(255);
  noStroke();
  fill(128,70,70);
  ellipse(width/2,height/2,width,height);
  float leftX = width/2-100;
  float leftY = height/2;
  float rightX = width/2+100;
  float rightY = height/2;
  followEye(leftX,leftY);
  followEye(rightX,rightY);
}

void followEye(float x,float y) {
    fill(255);
    ellipse(x,y,100,100);
    float angle = atan2(mouseY-y,mouseX-x);
    fill(0);
    ellipse(x+cos(angle)*20,
            y+sin(angle)*20,
            50,50);
}
