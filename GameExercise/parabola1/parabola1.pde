float x=50,y=25;
float dx=3,dy=0;
float gravity=0.1;

void setup(){
  size(500,500);
}

void draw(){
  background(255);
  fill(0);
  noStroke();
  ellipse(x,y,50,50);
  x += dx;
  y += dy;
  dy += gravity;
  if (y>=height-25) {
    y = height-25;
    dx *= 0.98;
    if (abs(dy) < 1.5) {
      dy = 0;
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
