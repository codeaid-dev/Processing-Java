float r=0, g=0, b=0;
void setup() {
  size(700, 700);
  r = random(256);
  g = random(256);
  b = random(256);
}
void draw() {
  background(255);
  noStroke();
  for (int i=0; i<100; i++) {
    fill(r, g, b);
    float x = 55 + 60 * (i % 10);
    float y = 55 + 60 * (i / 10);
    rect(x, y, 50, 50);
  }
}
