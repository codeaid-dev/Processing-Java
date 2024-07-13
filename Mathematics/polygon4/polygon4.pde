void setup() {
  size(500,500);
}

void draw() {
  background(255);
  fill(255,0,0);
  int p=5;
  for (int y=0; y<3; y++) {
    for (int x=0; x<3; x++) {
      polygon(100+x*150,100+y*150,50,p);
      p += 1;
    }
  }
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
