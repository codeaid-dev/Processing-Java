void setup() {
  size(500,500);
  colorMode(HSB,360,255,255);
}

void draw() {
  float radius = 200;
  float angle = 0;
  background(0,0,255);
  for (int i=0; i<360; i++) {
    float x = width/2 + radius * cos(radians(angle));
    float y = height/2 + radius * sin(radians(angle));
    strokeWeight(5);
    stroke(i,255,255);
    line(width/2,height/2,x,y);
    angle += 1;
  }
}
