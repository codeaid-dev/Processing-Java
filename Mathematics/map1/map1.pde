void setup() {
  size(600,600);
}

void draw() {
  float r = 255.0 * mouseX / width;
  float b = 255.0 * mouseY / height;
//  float r = map(mouseX,0,width,0,255);
//  float b = map(mouseY,0,height,0,255);
  background(r,0,b);
}
