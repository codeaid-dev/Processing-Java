void setup() {
  size(300,300);
}
void draw() {
  background(255);
  noStroke();
  int y = 0;
  while (y*30 < height) {
    int x = 0;
    while (x*30 < width) {
      fill(random(255));
      rect(x*30, y*30, 30, 30);
      x += 1;
    }
    y += 1;
  }
}
