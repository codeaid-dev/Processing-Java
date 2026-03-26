float rw = 100; // 横の半径
float rh = 200; // 縦の半径
float angle = radians(45); // 楕円の傾く角度
void setup() {
  size(500,500);
  noStroke();
}

void draw() {
  background(255);
  fill(0);

  float cx = width/2;
  float cy = height/2;

  for (int i=0; i<360; i+=10) {
    float rad = radians(i);
    // 楕円（回転前）
    float x = rw * cos(rad);
    float y = rh * sin(rad);
    // 回転
    float xr = x * cos(angle) - y * sin(angle);
    float yr = x * sin(angle) + y * cos(angle);
    // 平行移動
    float ex = cx + xr;
    float ey = cy + yr;

    ellipse(ex, ey, 5, 5);
  }
}
