void setup() {
    size(500,500);
    noStroke();
}

void draw() {
  background(255);
  drawBall(width/2,height/2,200);
}

void drawBall(float x, float y, float d) {
  float r = d / 2;
  // 光源（左上）
  PVector lightP = new PVector(-1,-1);
  lightP.normalize();

  color light = color(200);
  color dark = color(0);
  for (float i=d; i>0; i--) {
    float t = 1 - i / d; // 0~1
    // 内側ほど光源方向へ少し移動
    float offset = sin(t*HALF_PI) * r * 0.30;
    float cx = x + lightP.x * offset;
    float cy = y + lightP.y * offset;

    color c = lerpColor(light,dark,1-t);
    fill(c);
    ellipse(cx,cy,i,i);
  }
}
