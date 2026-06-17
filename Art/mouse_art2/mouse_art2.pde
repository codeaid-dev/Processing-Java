PImage img;
void setup() {
  size(900,400);
  img = loadImage("panda.jpg");
}
void draw() {
}
void mouseDragged() { 
  color c = img.get(mouseX,mouseY);
  noStroke();
  fill(c);
  ellipse(mouseX,mouseY,20,20);
}

void mouseClicked() {
  save("eyecatch.png");
}
