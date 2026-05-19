float[] xList = new float[4];
float[] yList = new float[4];
int atari = 0;
void setup() {
  size(600,400);
  atari = (int)random(4);
}

void draw() {
  background(255);
  fill(0);
  for (int i=0; i<4; i++) {
    xList[i] = 40+140*i;
    yList[i] = 150;
    rect(xList[i], yList[i], 100, 100);
  }
  if (mousePressed) {
    if (mouseX>xList[atari] && mouseX<xList[atari]+100
      && mouseY>yList[atari] && mouseY<yList[atari]+100) {
      textSize(50);
      textAlign(CENTER);
      text("Atari", width/2, 100);
    } else {
      textSize(50);
      textAlign(CENTER);
      text("Hazure", width/2, 100);
    }
  }
}

