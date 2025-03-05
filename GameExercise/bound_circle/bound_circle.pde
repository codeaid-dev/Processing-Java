float x=250,y=25;
float speed = 0;
float gravity = 0.1;

void setup() {
    size(500,500);
}

void draw() {
  background(255);
  fill(0);
  noStroke();
  ellipse(x,y,50,50);
  y += speed;
  speed += gravity;
  if (y>=height-25) {
    speed *= -0.98;
    y = height-25;
  }
}
