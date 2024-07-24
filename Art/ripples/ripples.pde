class Ripple {
  float x,y;
  int r1=0,r2=0;
}
ArrayList<Ripple> rips = new ArrayList<>();
void setup() {
  size(500,500);
}

void draw() {
  fill(0,10);
  rect(0,0,width,height);
  noFill();
  stroke(0,255,200);
  ArrayList<Ripple> cpy = new ArrayList<>(rips);
  for (Ripple rip : cpy) {
    if (rip.r1 != 0) rip.r1 += 2;
    if (rip.r1 > 30 || rip.r2 != 0) rip.r2 += 2;
    ellipse(rip.x,rip.y,rip.r1,rip.r1);
    ellipse(rip.x,rip.y,rip.r2,rip.r2);
    if (rip.r1 > 100) rip.r1 = 0;
    if (rip.r2 > 100) rips.remove(rip);
  }
}

void mousePressed() {
  Ripple rip = new Ripple();
  rip.x = mouseX;
  rip.y = mouseY;
  rip.r1 = 1;
  rips.add(rip);
}
