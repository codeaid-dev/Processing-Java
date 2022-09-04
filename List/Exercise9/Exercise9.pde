float[][] ens = new float[50][2];
int count = 0;
void setup(){
  size(600, 400);
}

void draw(){
  background(0);
  for (int p=0; p<ens.length; p++) {
    if (ens[p][0] >= 10) {
      ens[p][0] += 1;
      noStroke();
      ellipse(ens[p][0], ens[p][1], 20, 20);
    }
  }
}
void mousePressed() {
  if (count < 50) {
    float[] en = {10,random(height)};
    ens[count] = en;
    count += 1;
  }
}
