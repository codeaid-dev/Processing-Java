void setup() {
  size(500,500);
}

void draw() {
  float[][] en = {{450,50},{350,150},{250,250},{150,350},{50,450}};
  for (int d=0; d<en.length; d++) {
    ellipse(en[d][0],en[d][1],50,50);
  }
}
