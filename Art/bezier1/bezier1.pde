void setup() {
  size(500,500);
}

void draw() {
  background(255);
  float leftX = 50;
  float topY = 50;
  float rightX = 450;
  float bottomY = 450;
  float pitch = (rightX-leftX)/50; // 線幅
  float distortion = 400; // 上下の歪み
  stroke(200,0,0);
  noFill();
  for (int i=0; i<50; i++) {
    float x = leftX+i*pitch;
    float y = bottomY-i*pitch;
    bezier(leftX,topY,
          x,y+distortion,
          x,y-distortion,
          rightX,bottomY);
  }
}
