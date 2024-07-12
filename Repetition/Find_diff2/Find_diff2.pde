void setup() {
  size(700, 700);
}
void draw() {
  background(255);
  noStroke();
  for (int i=0; i<100; i++) {
    fill(0);
    float x = 55 + 60 * (i % 10);
    float y = 55 + 60 * (i / 10);
    rect(x, y, 50, 50);
  }
}
