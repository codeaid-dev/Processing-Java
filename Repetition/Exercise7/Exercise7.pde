void setup(){
  size(500, 500);
}

void draw(){
  background(200);
  float x = width/8*7;
  float y = height/8;
  float s = width/4;
  for (int i=0; i<4; i++) {
    ellipse(x-s*i,y+s*i,s,s);
  }
}
