float x = 0; // マウスのx座標
float y = 0; // マウスのx座標
float cx = 250; // 楕円の中心x座標
float cy = 250; // 楕円の中心y座標
float rw = 100; // rw:楕円の横半径
float rh = 200; // rh:楕円の縦半径
float angle = radians(45); // 楕円の傾き(ラジアン値)
void setup() {
    size(500, 500);
    noStroke();
}
void draw() {
    background(255);
    x = mouseX;
    y = mouseY;
    if (collision()) {
        fill(255, 0, 0);
    } else {
        fill(0);
    }
    pushMatrix();
    translate(cx, cy);
    rotate(angle);
    ellipse(0, 0, rw*2, rh*2);
    popMatrix();
}

boolean collision() {
  // 楕円中心基準の点座標
  float dx = x - cx;
  float dy = y - cy;
  // 逆回転
  float ca = cos(-angle);
  float sa = sin(-angle);
  // 逆回転後の楕円中心基準の点座標
  float nx = dx * ca - dy * sa;
  float ny = dx * sa + dy * ca;
  // 通常の楕円当たり判定
  float val = (nx*nx)/(rw*rw) + (ny*ny)/(rh*rh);
  return val <= 1.0;
}
