void setup() {
  size(500,500);
}

void draw() {
  background(255);
  fill(255,255,0);
  translate(width/2,height/2);
  rotate(-90*PI/180);
  star(0,0,100,40,5);
}

void star(float x,float y,float radius1,float radius2,int n) {
    float angle = TWO_PI/(n*2);
    beginShape();
    for (int i=0; i<n*2; i++) {
      float radius = 0;
      if (i % 2 == 0) {
        radius = radius1;
      } else {
        radius = radius2;
      }
      float sx = x+radius*cos(i * angle);
      float sy = y+radius*sin(i * angle);
      vertex(sx,sy);
    }
    endShape(CLOSE);
}
