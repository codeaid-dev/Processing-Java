float[][] ens = new float[50][2];
float[][] iros = new float[50][3];
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
      fill(iros[p][0],iros[p][2],iros[p][2]);
      ellipse(ens[p][0],ens[p][1],ens[p][2],ens[p][2]);
    }
  }
}
void mousePressed() {
  if (count < 50) {
    float[] en = {10,random(height),random(10,30)};
    float[] iro = {random(255),random(255),random(255)};
    ens[count] = en;
    iros[count] = iro;
    count += 1;
  }
}
