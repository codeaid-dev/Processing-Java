void setup() {
  size(500,500);
  noLoop();
}
void draw() {
  background(255);
  noStroke();
  fill(200,0,0,128);
  for (int y=0; y<9; y++) {
    for (int x=0; x<9; x++) {
      ellipse(50+width/10*x,50+height/10*y,100,100);
    }
  }
}
