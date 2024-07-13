float x = 300;
float y = 200;
int angle = 0, speed = 1;
float rad = radians(0);
void setup() {
  size(600,400);
}

void draw() {
    background(0);
    fill(255);
    rectMode(CENTER);
    translate(x,y);
    angle += speed;
    if (angle>90 || angle<-90)
      speed *= -1;
    rad += radians(speed);
    rotate(rad);
    rect(0,0,50,50);
}
