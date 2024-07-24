void setup() {
  size(500,500);
  colorMode(HSB,360,100,100);
}

void draw() {
  float radius = 200;
  background(0,0,255);
  for (int i=0; i<360; i++) {
    float x = width/2 + radius * cos(radians(i));
    float y = height/2 + radius * sin(radians(i));
    strokeWeight(5);
    stroke(i,100,100);
    line(width/2,height/2,x,y);
  }
}
