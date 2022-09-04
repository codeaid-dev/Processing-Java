float x=0,y=0,s=0;
int count=25;
void setup() {
  size(500,500);
  x=width/count;
  y=height/count;
  s=width/count;
  noStroke();
}
void draw() {
  background(200);
  for (int i=0; i<count; i++) {
    for (int j=0; j<count; j++) {
      if (j/5%2==0) {
        fill(255);
      } else {
        fill(0);
      }
      ellipse(x*j+s/2,y*i+s/2,s,s);
    }
  }
}
