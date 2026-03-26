float rw = 100; // 横の半径
float rh = 200; // 縦の半径
void setup() {
  size(500,500);
  noStroke();
}

void draw() {
  background(255);
  fill(0);
  for (int i=0; i<360; i+=10) {
    float rad = radians(i);
    float x = width/2 + rw * cos(rad);
    float y = height/2 + rh * sin(rad);
    ellipse(x,y,5,5);
  }
}
