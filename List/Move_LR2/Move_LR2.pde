int cnt = 8; //円の数
//各円の座標と速度[x,y,s]
float[][] places = new float[cnt][3];
//各円の状態、0:移動中、1:停止
int[] status = new int[cnt];
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
    status[i] = 0;
  }
}
void draw() {
  background(255);
  for (int i=0; i<cnt; i++) {
    if (status[i] == 1)
      fill(255,0,0);
    else
      fill(255);
    ellipse(places[i][0],places[i][1],50,50);
    places[i][0] += places[i][2];
    if (places[i][0]<25 || places[i][0]>575)
      places[i][2] *= -1;
  }
  if (mousePressed)
    isHit(); //円がクリックされたかを判定
}
void isHit() {
  for (int i=0; i<cnt; i++) {
    float dis = dist(mouseX, mouseY, places[i][0], places[i][1]);
    if (dis < 25) {
      places[i][2] = 0;
      status[i] = 1;
    }
  }
}
