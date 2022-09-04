float[] x = new float[5];
float[] y = new float[5];
boolean[] stat = new boolean[5];
void setup() {
  size(500,500);
  for (int i=0; i<5; i++) {
    x[i] = random(25,width-25);
    y[i] = random(25,height-25);
    stat[i] = false;
  }
}

void draw() {
  background(255);
  for (int i=0; i<5; i++) {
    if (mousePressed) {
      float dst = dist(mouseX,mouseY,x[i],y[i]);
      if (dst<25)
        stat[i] = true;
    }
    if (stat[i]) {
    fill(255,0,0);
    } else {
      fill(0);
    }
    ellipse(x[i],y[i],50,50);
  }
}
