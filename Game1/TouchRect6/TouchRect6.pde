float px=0, py=0, ps=0;
float sx=0, sy=0;
boolean up, down, left, right;
float rxList[] = new float[6];
float ryList[] = new float[6];
boolean status[] = new boolean[6];
boolean over = false;
boolean clear = false;
float limitBar = 600;

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
  if (clear) {
    textSize(50);
    textAlign(CENTER);
    text("GAME CLEAR",width/2,height/2);
    return;
  }

  if (keyPressed) {
    if (up)
      sy -= 1;
    if (down)
      sy += 1;
    if (left)
      sx -= 1;
    if (right)
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
  int count = 0;
  for (int i=0; i<6; i++) {
    if (status[i]) {
      count += 1;
    }
  }
  if (count == 6) {
    clear = true;
  }
  fill(#FFC400);
  rect(0, 0, limitBar, 30);
  limitBar -= 1.5;
  if (limitBar <= 0)
    over = true;
}

void keyPressed() {
  if (keyCode == UP) up = true;
  if (keyCode == DOWN) down = true;
  if (keyCode == LEFT) left = true;
  if (keyCode == RIGHT) right = true;
}

void keyReleased() {
  if (keyCode == UP) up = false;
  if (keyCode == DOWN) down = false;
  if (keyCode == LEFT) left = false;
  if (keyCode == RIGHT) right = false;
}
