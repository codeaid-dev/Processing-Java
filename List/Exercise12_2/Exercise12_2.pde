float px=0,py=0;
float psize = 20;
int count = 100;
float[] ex = new float[count];
float[] ey = new float[count];
float[] esize = new float[count];
float[] espeed = new float[count];
boolean[] active = new boolean[count];
void setup() {
  size(600, 400);
}
void draw() {
  background(0);
  px = mouseX;
  py = mouseY;
  noStroke();
  fill(255);
  ellipse(px,py,psize,psize);

  if (frameCount%60 == 0)
    create();

  for (int i=0; i<active.length; i++) {
    if (active[i]) {
      ex[i] += espeed[i];
      if (ex[i]<0 || ex[i]>width)
        espeed[i]*=-1;
      noStroke();
      fill(255,0,0);
      ellipse(ex[i],ey[i],esize[i],esize[i]);
    }
  }
}
void create() {
  for (int i=0; i<count; i++) {
    if (active[i] == false) {
      int speed = (int)random(-3,4);
      if (speed == 0)
        speed = 1;
      espeed[i] = speed;
      if (speed < 0)
        ex[i] = width;
      else
        ex[i] = 0;
      ey[i] = random(0,height);
      esize[i] = random(psize*0.5, psize*2);
      active[i] = true;
      break;
    }
  }
}
