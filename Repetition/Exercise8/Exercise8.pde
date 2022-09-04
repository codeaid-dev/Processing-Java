void setup() {
  size(500,500);
}
void draw() {
  background(200);
  float s = width/10;
  for (int y=0; y<10; y++) {
    for (int x=0; x<10; x++) {
      if (y % 2 == 0 && x % 2 == 1) {
        fill(0);
      } else if (y % 2 == 1 && x % 2 == 0) {
        fill(0);
      } else {
        fill(255);
      }
      rect(x*s,y*s,s,s);
    }
  }
}
