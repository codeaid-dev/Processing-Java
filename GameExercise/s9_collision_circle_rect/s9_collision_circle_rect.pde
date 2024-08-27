// 円のx,y座標、半径
float cx=150,cy=150,cr=50;
// 四角形のx,y座標、幅、高さ
float rx=150,ry=150,rw=100,rh=100;

void setup() {
    size(400, 400);
    noStroke();
}

void draw() {
  background(255);

  fill(100, 150, 250);
  cx = mouseX;
  cy = mouseY;
  ellipse(cx, cy, cr * 2, cr * 2);

  // 円と四角形の当たり判定
  if (collide(cx, cy, cr, rx, ry, rw, rh)) {
    fill(255, 0, 0, 150);  // 重なっている場合、赤い半透明の四角形を表示
  } else
    fill(0);

  rect(rx, ry, rw, rh);
}

// 円と四角形の当たり判定を行う関数
boolean collide(float cx, float cy, float cr, float rx, float ry, float rw, float rh) {
  // 円の中心から四角形の各辺までのX軸およびY軸方向の最短距離を計算
  float closestX,closestY;
  if (cx < rx) {
    closestX = rx;  // 円の中心が四角形の左側にある場合、四角形の左辺が最近傍点
  } else if (cx > rx + rw) {
    closestX = rx + rw;  // 円の中心が四角形の右側にある場合、四角形の右辺が最近傍点
  } else {
    closestX = cx;  // 円の中心が四角形の内部または左右の辺と同じX座標上にある場合、そのX座標をそのまま使用
  }
  if (cy < ry) {
    closestY = ry;  // 円の中心が四角形の上側にある場合、四角形の上辺が最近傍点
  } else if (cy > ry + rh) {
    closestY = ry + rh;  // 円の中心が四角形の下側にある場合、四角形の下辺が最近傍点
  } else {
    closestY = cy;  // 円の中心が四角形の内部または上下の辺と同じY座標上にある場合、そのY座標をそのまま使用
  }
  // 円の中心と四角形の各辺との最短距離を計算(別解)
  // float closestX = constrain(cx, rx, rx + rw);
  // float closestY = constrain(cy, ry, ry + rh);

  // 円の中心から四角形の最近傍点までの距離を計算
  float dx = cx - closestX;
  float dy = cy - closestY;

  // 距離の二乗が円の半径の二乗以下なら衝突している
  float distance = sqrt(dx * dx + dy * dy);
  return distance < cr;
}
