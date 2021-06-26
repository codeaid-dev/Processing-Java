float px, py, ps;
float sx, sy;
float[] rxList = new float[6];
float[] ryList = new float[6];

void setup() {
  size(600, 500);
  px = width/2;
  py = height/2;
  ps = 30;
  for (int i=0; i<6; i++) {
    rxList[i] = 75+175*(i%3);
    ryList[i] = 75+250*(i/3);
  }
}

void draw() {
  background(255);

  for (int i=0; i<6; i++) {
    fill(255);
    rect(rxList[i], ryList[i], 100, 100);
  }
  fill(0);
  ellipse(px, py, ps, ps);

  if (keyPressed) {
    if (keyCode == UP) {
      sy -= 1;
    }
    if (keyCode == DOWN) {
      sy += 1;
    }
    if (keyCode == LEFT) {
      sx -= 1;
    }
    if (keyCode == RIGHT) {
      sx += 1;
    }
  }

  sx *= 0.98;
  sy *= 0.98;
  px += sx;
  py += sy;
}
