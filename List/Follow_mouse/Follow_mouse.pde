float[] xpos = new float[50];
float[] ypos = new float[50];

void setup() {
  size(500,500);
  for (int i=0; i<50; i++) {
    xpos[i] = 0;
    ypos[i] = 0;
  }
}
void draw() {
  background(255);
  for (int i=0; i<49; i++) {
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  xpos[49] = mouseX;
  ypos[49] = mouseY;
  for (int i=0; i<50; i++) {
    noStroke();
    fill(255-i*5);
    ellipse(xpos[i],ypos[i],i,i);
  }
}
