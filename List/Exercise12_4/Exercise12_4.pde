float px=0,py=0;
float psize = 20;
int count = 100;
float[] ex = new float[count];
float[] ey = new float[count];
float[] esize = new float[count];
float[] espeed = new float[count];
boolean[] active = new boolean[count];
boolean over = false;
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

  if (over) {
    textAlign(CENTER);
    textSize(30);
    text("GAME OVER",width/2,height/2);
    return;
  }

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
      if (is_hit(px,py,psize,ex[i],ey[i],esize[i])) {
        if (psize > esize[i]) {
          psize += esize[i]*0.1;
          active[i] = false;
        } else {
          over = true;
        }
      }
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
boolean is_hit(float x1,float y1,float s1,float x2,float y2,float s2) {
  float dis = dist(x1,y1,x2,y2);
  if (dis < s1/2+s2/2)
    return true;
  return false;
}
