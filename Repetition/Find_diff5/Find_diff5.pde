float r=0, g=0, b=0;
float a=0;
int atari=0;
boolean hit = false;
void setup() {
  size(700, 700);
  r = random(256);
  g = random(256);
  b = random(256);
  a = random(100, 250);
  atari = int(random(0, 100));
}
void draw() {
  background(255);
  noStroke();
  for (int i=0; i<100; i++) {
    if (i == atari) {
      fill(r, g, b, a);
    } else {
      fill(r, g, b);
    }
    float x = 55 + 60 * (i % 10);
    float y = 55 + 60 * (i / 10);
    rect(x, y, 50, 50);
  }
  if (hit) {
    fill(0);
    textSize(32);
    textAlign(CENTER);
    text("Hit!!", width/2, 40);
  }

  if (mousePressed) {
    float atariX = 55 + 60 * (atari % 10);
    float atariY = 55 + 60 * (atari / 10);
    if (mouseX>atariX && mouseX<atariX+50 &&
        mouseY>atariY && mouseY<atariY+50) {
        hit = true;
    }
  }
}
