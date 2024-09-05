void setup() {
  size(600,600);
  noStroke();
  //noLoop();
}

void draw() {
  background(255);
  fill(0);
  for (int x=0; x<width; x++) {
    float y = height/2+sin((x+mouseX)*0.01)*mouseY;
    ellipse(x,y,2,2);
  }
}
