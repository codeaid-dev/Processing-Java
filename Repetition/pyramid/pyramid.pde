void setup() {
    size(500,500);
}

void draw() {
  background(200);
  for (int col=0; col<9; col++) {
    for (int row=0; row<col+1; row++) {
          float x = (width/2-(col-row)*25)+row*25;
          float y = col*50+25;
          fill(255);
          ellipse(x,y,50,50);
    }
  }
}
