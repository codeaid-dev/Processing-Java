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
}

void draw() {
  background(255);
  e1.cx = mouseX;
  e1.cy = mouseY;
  fill(0,255,0);
  pushMatrix();
  translate(e1.cx,e1.cy);
  rotate(e1.angle);
  ellipse(0, 0, e1.rw*2, e1.rh*2);
  popMatrix();
  if (collision(e1, e2)) {
      fill(255, 0, 0, 150);
  } else {
      fill(0);
  }
  ellipse(e2.cx, e2.cy, e2.rw*2, e2.rh*2);
}

boolean collision(Ellipse e1, Ellipse e2) {
  boolean hit = false;

  for (int i=0; i<360; i+=5) {
    float t = radians(i);
    
    // e1の境界点
    float[] points = getPoint(e1, t);
    float ex = points[0];
    float ey = points[1];

    // e2中心までの距離
    float dx = ex - e2.cx;
    float dy = ey - e2.cy;

    // e2の中に入っているかチェック
    if ((dx*dx)/(e2.rw*e2.rw) + (dy*dy)/(e2.rh*e2.rh) <= 1) {
      hit = true;
      break;
    }
  }

  return hit;
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
