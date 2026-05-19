void setup() {
    size(500, 500);
}
void draw() {
  background(255);
  float[][] pos = {{125,250,375},{250,250,250}};
  for (int i=0; i<3; i++) {
    fill(0);
    ellipse(pos[0][i],pos[1][i],100,100);
  }
}
