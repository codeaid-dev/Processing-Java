class Ellipse {
  float cx;
  float cy;
  float rw;
  float rh;
  float angle;
}
Ellipse e1;
Ellipse e2;
void setup() {
  size(500, 500);
  noStroke();
  e1 = new Ellipse();
  e1.cx = mouseX;
  e1.cy = mouseY;
  e1.rw = 100.0;
  e1.rh = 50.0;
  e1.angle = radians(45);
  e2 = new Ellipse();
  e2.cx = width/2;
  e2.cy = height/2;
  e2.rw = 50.0;
  e2.rh = 100.0;
  e2.angle = radians(45);
}

void draw() {
  background(255);
  e1.cx = mouseX;
  e1.cy = mouseY;
  fill(0,255,0);
  pushMatrix();
  translate(e1.cx, e1.cy);
  rotate(e1.angle);
  ellipse(0, 0, e1.rw*2, e1.rh*2);
  popMatrix();
  if (collision(e1, e2)) {
      fill(255, 0, 0, 150);
  } else {
      fill(0);
  }
  pushMatrix();
  translate(e2.cx, e2.cy);
  rotate(e2.angle);
  ellipse(0, 0, e2.rw*2, e2.rh*2);
  popMatrix();
}

boolean collision(Ellipse e1, Ellipse e2) {
  // e1 → e2 をチェック
  for (int i=0; i<360; i+=5) {
    float t = radians(i);
    float[] points = getPoint(e1, t);
    float x = points[0];
    float y = points[1];
    if (isInEllipse(e2, x, y))
      return true;
  }

  // e2 → e1 もチェック
  for (int i=0; i<360; i+=5) {
    float t = radians(i);
    float[] points = getPoint(e2, t);
    float x = points[0];
    float y = points[1];
    if (isInEllipse(e1, x, y))
      return true;
  }
  return false;
}

float[] getPoint(Ellipse e, float rad) {
  float[] points = new float[2];
  // 楕円（回転前）
  float x = e.rw * cos(rad);
  float y = e.rh * sin(rad);
  // 回転
  float xr = x * cos(e.angle) - y * sin(e.angle);
  float yr = x * sin(e.angle) + y * cos(e.angle);
  // 平行移動
  points[0] = e.cx + xr;
  points[1] = e.cy + yr;
  
  return points;
}

boolean isInEllipse(Ellipse e, float x, float y) {
  // 楕円中心基準の点座標
  float dx = x - e.cx;
  float dy = y - e.cy;
  // 逆回転
  float ca = cos(-e.angle);
  float sa = sin(-e.angle);
  // 逆回転後の楕円中心基準の点座標
  float nx = dx * ca - dy * sa;
  float ny = dx * sa + dy * ca;
  // 通常の楕円当たり判定
  float val = (nx*nx)/(e.rw*e.rw) + (ny*ny)/(e.rh*e.rh);
  return val <= 1.0;
}
