float px=0, py=0, ps=0;
float sx=0, sy=0;
float rxList[] = new float[6];
float ryList[] = new float[6];
boolean status[] = new boolean[6];
boolean over = false;

void setup() {
  size(600, 500);
  px = width/2;
  py = height/2;
  ps = 30;
  for (int i=0; i<6; i++) {
    rxList[i] = 75+175*(i%3);
    ryList[i] = 75+250*(i/3);
    status[i] = false;
  }
}

void draw() {
  background(255);

  for (int i=0; i<6; i++) {
    if (status[i])
      fill(255,0,0);
    else
      fill(255);
    rect(rxList[i], ryList[i], 100, 100);
  }

  fill(0);
  ellipse(px, py, ps, ps);
  if (over) {
    textSize(50);
    textAlign(CENTER);
    text("GAME OVER",width/2,height/2);
    return;
  }

  if (keyPressed) {
    if (keyCode == UP)
      sy -= 1;
    if (keyCode == DOWN)
      sy += 1;
    if (keyCode == LEFT)
      sx -= 1;
    if (keyCode == RIGHT)
      sx += 1;
  }

  sx *= 0.98;
  sy *= 0.98;
  px += sx;
  py += sy;

  for (int i=0; i<6; i++) {
    if (px+ps/2>rxList[i] && px-ps/2<rxList[i]+100
        && py+ps/2>ryList[i] && py-ps/2<ryList[i]+100) {
      status[i] = true;
    }
  }
  if (px<ps/2 || px>(width-ps/2) ||
      py<ps/2 || py>(height-ps/2)) {
    over = true;
  }
}
 
