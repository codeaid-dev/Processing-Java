void setup() {
  size(400,400);
}

void draw() {
  background(200);
  float x,y;
  x = map(mouseX,0,width,175,225);
  y = map(mouseY,0,height,175,225);
  fill(0,255,255);
  ellipse(x,y,50,50);

  x = map(mouseX,0,width,125,275);
  y = map(mouseY,0,height,125,275);
  fill(0,255,0);
  ellipse(x,y,50,50);

  x = map(mouseX,0,width,75,325);
  y = map(mouseY,0,height,75,325);
  fill(255,255,0);
  ellipse(x,y,50,50);

  x = map(mouseX,0,width,25,375);
  y = map(mouseY,0,height,25,375);
  fill(255);
  ellipse(x,y,50,50);

  x = mouseX;
  if (x < 25) x = 25;
  if (x > 375) x = 375;
  y = mouseY;
  if (y < 25) y = 25;
  if (y > 375) y = 375;
  fill(255,0,0);
  ellipse(x,y,50,50);
}
