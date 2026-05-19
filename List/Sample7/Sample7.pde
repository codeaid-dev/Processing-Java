void setup() {
    size(300, 300);
}
void draw() {
  background(255);
  float[][] iro = {{255,0,0},{0,255,0},{0,0,255}};
  for (int i=0; i<iro.length; i++) {
    fill(iro[i][0],iro[i][1],iro[i][2]);
    ellipse(50+i*100, height/2, 50, 50);
  }
}
