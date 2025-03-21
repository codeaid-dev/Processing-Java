float px=0, py=0, ps=0;
float sx=0, sy=0;

void setup() {
  size(600, 500);
  px = width/2;
  py = height/2;
  ps = 30;
}

void draw() {
  background(255);
  fill(0);
  ellipse(px, py, ps, ps);

  if (keyPressed) {
    if (keyCode == UP)
      sy -= 1;
    if (keyCode == DOWN)
      sy += 1;
    if (keyCode == LEFT)
      sx -= 1;
    if (keyCode == RIGHT)
      sx += 1;
  }

  sx *= 0.98;
  sy *= 0.98;
  px += sx;
  py += sy;
}
 
