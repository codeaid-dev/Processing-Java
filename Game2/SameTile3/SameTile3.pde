float[] left_x = new float[25]; //左側の四角形x座標
float[] left_y = new float[25]; //左側の四角形y座標
int[] left_stat = new int[25]; //左側の四角形の色（0:白、1:赤）
float[] right_x = new float[25]; //右側の四角形x座標
float[] right_y = new float[25]; //右側の四角形y座標
int[] right_stat = new int[25]; //右側の四角形の色（0:白、1:赤）
boolean complete = false;
float timer = 0;

void setup() {
  size(500,200);
  for (int i=0; i<25; i++) {
    left_x[i] = 50+i%5*30;
    left_y[i] = 25+i/5*30;
    left_stat[i] = int(random(0,2));
    right_x[i] = 300+i%5*30;
    right_y[i] = 25+i/5*30;
    right_stat[i] = int(random(0,2));
  }
}

void draw() {
  background(200);
  for (int i=0; i<25; i++) {
    if (left_stat[i] == 0)
      fill(255);
    else
      fill(255,0,0);
    rect(left_x[i],left_y[i],30,30);
    if (right_stat[i] == 0)
      fill(255);
    else
      fill(255,0,0);
    rect(right_x[i],right_y[i],30,30);
  }

  if (complete) {
    textSize(50);
    textAlign(CENTER);
    fill(0);
    text("COMPLETE!!",width/2,height/2);
    text(timer,width/2,height/2+60);
    return;
  }

  if (frameCount % 30 == 0)
    timer += 0.5;

  check();
}

void mousePressed() {
  float x = mouseX;
  float y = mouseY;
  if (!complete) {
    for (int i=0; i<25; i++) {
      if (x>right_x[i] && x<right_x[i]+30
        && y>right_y[i] && y<right_y[i]+30) {
        if (right_stat[i]==0)
          right_stat[i] = 1;
        else
          right_stat[i] = 0;
      }
    }
  }
}

void check() {
  int same = 0;
  for (int i=0; i<25; i++) {
    if (left_stat[i] == right_stat[i])
      same += 1;
  }
  if (same == 25)
    complete = true;
}
