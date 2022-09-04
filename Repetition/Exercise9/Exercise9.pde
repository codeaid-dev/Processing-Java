void setup() {
  size(600,300);
}
void draw() {
  background(200);
  for (int i=0; i<5; i++) {
    float x = i*100+50;
    float s = i*50+50;
    fill(i*63);
    ellipse(x,150,s,s);
  }
}
