float x = 300;
float y = 200;
float s = 30;
float dx = 0;
float dy = 0;
int hc = 5;
float hx[] = new float[hc];
float hy[] = new float[hc];
float hs[] = new float[hc];

void setup() {
  size(600,400);
  for (int i=0; i<hc; i++) {
    hx[i] = random(width,width*2);
    float ws = random(20,height/4);
    hs[i] = ws;
    hy[i] = height-ws/2;
  }
}

void draw() {
  background(255);
  noStroke();
  fill(0,0,255);
  ellipse(x,y,s,s);

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
    fill(0);
    ellipse(hx[i],hy[i],hs[i],hs[i]);
  }
}
