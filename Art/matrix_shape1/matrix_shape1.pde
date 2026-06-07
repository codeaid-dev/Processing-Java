void setup() {
  size(500,500);
  rectMode(CENTER);
}

void draw() {
  background(255);
  stroke(0,155,155);
  for (int y=0; y<9; y++) {
    for (int x=0; x<9; x++) {
      if ((y%2==0 && x%2!=0)
      || (y%2!=0 && x%2==0)) {
        fill(255);
        ellipse(30+x*55,30+y*55,50,50);
      } else if ((y%2==0 && x%2==0)
      || (y%2!=0 && x%2!=0)) {
        if (y==4 || x==4) {
          fill(255,0,0);
        } else {
          fill(255);
        }
        rect(30+x*55,30+y*55,50,50);
      }
    }
  }
}
