float x=0,y=0;
float dx=0,dy=0;
float gravity=0.1;
boolean flying=false;
int angle=60;
int speed=10;

void setup() {
  size(500,500);
  x = 50;
  y = height-25;
}

void draw() {
  background(255);
  String txt = "angle: "+angle+", speed: "+speed;
  textSize(40);
  text(txt,50,50);
  fill(0);
  noStroke();
  ellipse(x,y,50,50);
  if (flying) {
    x += dx;
    y += dy;
    dy += gravity;
    if (y>=height-25) {
      y = height-25;
      dx *= 0.8;
      if (abs(dy) < 1.5) {
        dy = 0;
        flying=false;
        if (abs(dx) < 0.1) {
          dx = 0;
        }
      } else {
        dy *= -0.8;
      }
    }
    if (x<=25 || x>=width-25) {
      dx *= -1;
    }
  }
}

void keyPressed() {
  if (key == ' ' && !flying) {
    dx = speed*cos(radians(angle));
    dy = -speed*sin(radians(angle));
    flying = true;
  }
  if (keyCode == UP) {
    angle += 1;
    if (angle > 90) {
      angle = 90;
    }
  }
  if (keyCode == DOWN) {
    angle -= 1;
    if (angle < 0) {
      angle = 0;
    }
  }
  if (keyCode == RIGHT) {
    speed += 1;
    if (speed > 15) {
      speed = 15;
    }
  }
  if (keyCode == LEFT) {
    speed -= 1;
    if (speed < 1) {
      speed = 1;
    }
  }
}
