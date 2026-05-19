void setup() {
    size(500, 500);
}
void draw() {
  background(255);
  float[] data = {135,253,90,52};
  line(125,100,125,380);
  for (int i=0; i<data.length; i++) {
    fill(128);
    rect(125, 125+60*i, data[i], 50);
  }
}
