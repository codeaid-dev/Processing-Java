float x = 300;
float y = 200;
float s = 30;
float dx = 0;
float dy = 0;
boolean up, down, left, right;
int hc = 5;
float hx[] = new float[hc];
float hy[] = new float[hc];
float hs[] = new float[hc];
int status[] = new int[hc];
int count = 0;
boolean over = false;
int time = 0;

void setup() {
  size(600,400);
  for (int i=0; i<hc; i++) {
    hx[i] = random(width,width*2);
    float ws = random(20,height/4);
    hs[i] = ws;
    hy[i] = height-ws/2;
    status[i] = 0;
  }
}

void draw() {
  background(255);
  noStroke();
  fill(0,0,255);
  ellipse(x,y,s,s);

  if (over) {
    textSize(50);
    textAlign(CENTER);
    text("GAME OVER",width/2,200);
    text(time,width/2,260);
    return;
  } else {
    time = frameCount/60;
  }

  if (y > height-s/2) {
    dy = 0;
    y = height-s/2;
  } else {
    dy += 0.3;
  }

  if (keyPressed) {
    if (keyCode == UP && dy == 0) { dy = -12; }
    if (keyCode == DOWN) { dy += 2; }
    if (keyCode == LEFT) { dx -= 0.1; }
    if (keyCode == RIGHT) { dx += 0.1; }
  }

  dx *= 0.98;
  x += dx;
  y += dy;

  for (int i=0; i<hc; i++) {
    hx[i] -= 3;
    if (hx[i] < 0-hs[i]/2) {
      hx[i] = random(width,width*2);
    }
    hit();
    if (status[i] == 0) { fill(0); }
    else { fill(255,0,0); }
    ellipse(hx[i],hy[i],hs[i],hs[i]);
  }
}

void hit() {
  for (int i=0; i<hc; i++) {
    float dst = dist(x,y,hx[i],hy[i]);
    if (dst < (s+hs[i])/2 && status[i] == 0) {
      status[i] = 1;
      count += 1;
    }
  }
  if (count == hc) { over = true; }
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
