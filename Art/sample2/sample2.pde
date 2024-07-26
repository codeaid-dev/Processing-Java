void setup() {
  size(500,500);
  noLoop();
}
void draw() {
  background(255);
  noStroke();
  for (int y=0; y<9; y++) {
    for (int x=0; x<9; x++) {
      if ((x+y)%2==0) fill(0,0,200,128);
      else fill(200,0,0,70);
      ellipse(50+width/10*x,50+height/10*y,100,100);
    }
  }
}
