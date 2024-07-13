void setup() {
  size(500,500);
}

void draw() {
  background(255);
  fill(255,0,0);
  polygon(width/2,height/2,100,5);
}

void polygon(float x,float y,float radius,int points) {
  beginShape();
  for (int i=0; i<points; i++) {
    float px = x + radius * cos(i * TWO_PI/points);
    float py = y + radius * sin(i * TWO_PI/points);
    vertex(px,py);
  }
  endShape(CLOSE);
}
