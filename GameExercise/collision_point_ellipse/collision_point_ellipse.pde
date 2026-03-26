float x = 0; // マウスのx座標
float y = 0; // マウスのx座標
float cx = 250; // 楕円の中心x座標
float cy = 250; // 楕円の中心y座標
float rw = 100; // rw:楕円の横半径
float rh = 200; // rh:楕円の縦半径
void setup() {
    size(500, 500);
    noStroke();
}
void draw() {
    background(255);
    x = mouseX;
    y = mouseY;
    float dx = x - cx;
    float dy = y - cy;
    float val = (dx*dx)/(rw*rw) + (dy*dy)/(rh*rh);
    if (val <= 1) {
        fill(255, 0, 0);
    } else {
        fill(0);
    }
    ellipse(cx, cy, rw*2, rh*2);
}
