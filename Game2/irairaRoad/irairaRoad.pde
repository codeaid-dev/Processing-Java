float x=0, y=0;
float w=30, h=30;
float sx=0, sy=0;
boolean over = false;
boolean clear = false;
float count = 400;

void setup() {
  size(600, 400);
  x = 60;
  y = 60;
  w = 30;
  h = 30;
}

void draw() {
  background(255);
  noStroke();

  fill(255, 183, 0);
  rect(0, 0, 30, count);
  count -= 0.1;

  fill(#FF0000);
  rect(125, 0, 200, 100);
  rect(325, 0, 150, 250);
  rect(125, 150, 150, 250);
  rect(275, 300, 200, 100);

  fill(#0000FF);
  rect(515, 50, 50, 50);

  if (mousePressed && !over) {
    x = mouseX;
    y = mouseY;
  }
  fill(0);
  ellipse(x, y, w, h);

  if (over) {
    textSize(50);
    textAlign(CENTER);
    text("GAME OVER", 300, 200);
    return;
  }

  if (clear) {
    textSize(50);
    textAlign(CENTER);
    text("CLEAR", 300, 200);
    return;
  }

  if (keyPressed) {
    if (keyCode == UP)
      sy -= 0.1;
    if (keyCode == DOWN)
      sy += 0.1;
    if (keyCode == LEFT)
      sx -= 0.1;
    if (keyCode == RIGHT)
      sx += 0.1;
  }

  sx *= 0.98;
  sy *= 0.98;
  x += sx;
  y += sy;

  if (x < w/2 || x > (width - w/2) || y < h/2 || y > (height - h/2))
    over = true;

  if ((x >= 125-w/2 && x <= 475+w/2 && y <= 100+h/2)
      || (x >= 325-w/2 && x <= 475+w/2 &&  y <= 250+h/2)
      || (x >= 125-w/2 && x <= 475+w/2 && y >= 300-h/2)
      || (x >= 125-w/2 && x <= 275+w/2 && y >= 150-h/2)
      || count < 0)
    over = true;

  if (x >= 515+w/2 && x <= 565-w/2 && y >= 50+w/2 && y <= 100-w/2)
    clear = true;
}
