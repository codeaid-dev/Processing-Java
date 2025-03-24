color[] colors={color(255,0,0),color(0,255,0),
        color(0,0,255),color(255,255,0),
        color(255,0,255),color(0,255,255),
        color(0),color(128,0,0),color(128)};
void setup() {
  size(600,600);
  noStroke();
}

void draw() {
  background(255);
  for (int i=0; i<16; i++) {
    fill(colors[8]);
    ellipse(i%4*150+75,i/4*150+75,150,150);
  }
}
