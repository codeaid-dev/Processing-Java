float x = 300;
float y = 200;
float rad = radians(0);
void setup() {
  size(600,400);
}

void draw() {
    background(0);
    fill(255);
    rectMode(CENTER);
    translate(x,y);
    rad += radians(1);
    rotate(rad);
    rect(0,0,50,50);
}
