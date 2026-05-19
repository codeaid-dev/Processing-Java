void setup() {
    size(600, 300);
}
void draw() {
  background(255);
  float[][] list1 = {{255,0,0},{0,255,0},{0,0,255}};
  for (int i=0; i<12; i++) {
    int c = i%3;
    fill(list1[c][0],list1[c][1],list1[c][2]);
    ellipse(25+i*50, height/2, 50, 50);
  }
}
