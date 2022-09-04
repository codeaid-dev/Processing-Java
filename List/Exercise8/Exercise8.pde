float[] xList = new float[225];
float[] yList = new float[225];
float s = 30;
int atari = 0;
boolean clear = false;
void setup(){
  size(450, 450);
  for (int i=0; i<225; i++) {
    xList[i] = s * (i % 15);
    yList[i] = s * (i / 15);
  }
  atari = (int)random(225);
}

void draw(){
  for (int i=0; i<225; i++) {
    if (i == atari && clear) {
      fill(255, 0, 0);
    } else {
      fill(255);
    }
    rect(xList[i], yList[i], s, s);
  }

  if (mousePressed) {
    if (xList[atari]<mouseX && mouseX<xList[atari]+s
      && yList[atari]<mouseY && mouseY<yList[atari]+s) {
      clear = true;
    }
  }
}
