int cnt = 8; //円の数
//各円の座標と速度[x,y,s]
float[][] places = new float[cnt][3];
void setup() {
  size(600,200);
  for (int i=0; i<cnt; i++) {
    float[] work = new float[3];
    if (random(5) / 2 > 1) {
      work[2] = -random(1,11);
    } else {
      work[2] = random(1,11);
    }
    work[0] = width/2;
    work[1] = random(height);
    places[i] = work;
  }
}
void draw() {
  background(255);
  for (int i=0; i<cnt; i++) {
    ellipse(places[i][0],places[i][1],50,50);
    places[i][0] += places[i][2];
    if (places[i][0]<25 || places[i][0]>575)
      places[i][2] *= -1;
  }
}
