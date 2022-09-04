int s = 100;
int m = 50;
color colors[] = new color[3];
int atari = (int)random(3);
void setup(){
  size(500, 200);
  for (int i=0; i<3; i++) {
    colors[i] = color(255,255,255);
  }
}

void draw(){
  background(0);
  for (int i=0; i<3; i++) {
      fill(colors[i]);
      rect(i*(s+m)+m, m, s, s);
  }
}

void mouseClicked(){
  for (int i=0; i<3; i++){
    if (i*(s+m)+m < mouseX 
      && mouseX < i*(s+m)+m+s
      && m < mouseY
      && mouseY < m+s) {
      if (i == atari) {
        colors[i] = color(255,0,0);
      }
      else {
        colors[i] = color(255,255,255);
      }
    }
  }
}
