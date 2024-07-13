float radius=0;
void setup() {
  size(500,500);
}

void draw() {
  background(255);
  noStroke();
  fill(255,200,0);
  ellipse(width/2,height/2,30,30);
  for (int i=0; i<360; i+=10) {
    float x = width/2 + radius * cos(i*PI/180);
//    float x = width/2 + radius * cos(radians(i));
    float y = height/2 + radius * sin(i*PI/180);
//    float y = height/2 + radius * sin(radians(i));
    fill(0,200,200);
    ellipse(x,y,5,5);
  }
  radius += 2;
  if (radius>200) radius = 0;
}
