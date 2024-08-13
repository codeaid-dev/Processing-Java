// 四角形1のx,y座標、幅、高さ
float rect1X = 100;
float rect1Y = 100;
int rect1W = 100;
int rect1H = 100;
// 四角形2のx,y座標、幅、高さ
float rect2X = 150;
float rect2Y = 150;
int rect2W = 100;
int rect2H = 100;

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  noStroke();

  rect1X = mouseX-50;
  rect1Y = mouseY-50;
  fill(0, 255, 0);
  rect(rect1X, rect1Y, rect1W, rect1H);
  
  if (rect1X < rect2X+rect2W &&
      rect1X+rect1W > rect2X &&
      rect1Y < rect2Y+rect2H &&
      rect1Y+rect1H > rect2Y) {
    fill(255,0,0,150);
  } else {
    fill(0);
  }
  rect(rect2X, rect2Y, rect2W, rect2H);  
}
