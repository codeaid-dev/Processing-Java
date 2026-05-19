void setup() {
    size(600, 300);
}
void draw() {
  background(255);
  float[] data = {135,253,90,52};
  float[] iro = {128,80,100,200};
  float x = 35;
  for (int i=0; i<4; i++) {
    fill(iro[i]);
    rect(x, height/2-25, data[i], 50);
    x += data[i];
  }
}
