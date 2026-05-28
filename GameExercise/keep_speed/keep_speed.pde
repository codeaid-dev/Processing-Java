float x,y,dx,dy,radius;
color iro;
void setup() {
  size(500,500);
  x = width/2;
  y = height/2;
  dx = 3;
  dy = 4;
  radius = 20;
  iro = color(0);
  noStroke();
}

void draw() {
  fill(255,30);
  rect(0,0,width,height);
  x += dx;
  y += dy;
  if (x <= radius || x >= width-radius) {
    dx *= -1;
  }
  if (y <= radius || y >= height-radius) {
    dy *= -1;
  }
  fill(iro);
  ellipse(x,y,radius*2,radius*2);
}

void mousePressed() {
  x = mouseX;
  y = mouseY;
  float speed = sqrt(dx*dx + dy*dy);
  float rad = random(TWO_PI);
  dx = speed * cos(rad);
  dy = speed * sin(rad);
  colorMode(HSB,360,100,100);
  iro = color(random(360),90,60);
  colorMode(RGB,255);
}
