float x = 250;
float y = 250;
float dx = 3;
float dy = 2;

void setup(){
  size(500, 500);
}

void draw(){
  background(0);
  x += dx;
  y += dy;
  if (60+x > width || x < 0) {
      dx *= -1;
  }
  if (y > height || y < 0) {
      dy *= -1;
  }

  for (int i=0; i<3; i++) {
      ellipse(i*30+x, y, 30, 30);
  }
}
