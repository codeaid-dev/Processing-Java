void setup() {
  size(300,300);
  colorMode(HSB,360,100,100);
}

void draw() {
  background(0);
  fill(0,0,50);
  ellipse(width/2-50,height/2,200,200);
  fill(0,100,100,128);
  ellipse(width/2+50,height/2,200,200);
}
