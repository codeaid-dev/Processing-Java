class ControlPoint{
  float x,y;
  boolean drag=false;
  ControlPoint(float x, float y) {
    this.x = x;
    this.y = y;
  }
}
ControlPoint cp1,cp2,cp3;

float t = 0;
float speed = 0.005;

ArrayList<ControlPoint> curve =
  new ArrayList<ControlPoint>();

void setup() {
  size(500,500);
  cp1 = new ControlPoint(50,450);
  cp2 = new ControlPoint(250,50);
  cp3 = new ControlPoint(450,450);

  textSize(20);
  textAlign(CENTER);
}

void draw() {
  background(255);
  stroke(255,180,0);
  line(cp1.x,cp1.y,cp2.x,cp2.y);
  line(cp2.x,cp2.y,cp3.x,cp3.y);
  fill(255);
  circle(cp1.x,cp1.y,10);
  circle(cp2.x,cp2.y,10);
  circle(cp3.x,cp3.y,10);
  fill(0);
  text("1",cp1.x,cp1.y-10);
  text("2",cp2.x,cp2.y-10);
  text("3",cp3.x,cp3.y-10);
  fill(255);
  stroke(0);
  bezier(cp1.x,cp1.y,
        cp2.x,cp2.y,
        cp2.x,cp2.y,
        cp3.x,cp3.y);
  // 制御点1,2,3の補間
  float ax = lerp(cp1.x, cp2.x, t);
  float ay = lerp(cp1.y, cp2.y, t);
  float bx = lerp(cp2.x, cp3.x, t);
  float by = lerp(cp2.y, cp3.y, t);
  float cx = lerp(ax, bx, t);
  float cy = lerp(ay, by, t);

  // 補間線
  stroke(128);
  line(ax,ay,bx,by);
  // 補間点
  noStroke();
  fill(255,0,0);
  circle(ax,ay,10);
  fill(0,0,255);
  circle(bx,by,10);
  fill(0,255,0);
  circle(cx,cy,10);
  fill(0);
  text(t,cx,cy-10);

  // ベジェ曲線
  curve.add(new ControlPoint(cx, cy));
  noFill();
  stroke(0,255,0);
  beginShape();
  for (ControlPoint p : curve) {
    vertex(p.x, p.y);
  }
  endShape();

  t += speed;
  if (t > 1) {
    t = 0;
    curve.clear();
  }
}

void mousePressed() {
  float dst1 = dist(cp1.x,cp1.y,mouseX,mouseY);
  float dst2 = dist(cp2.x,cp2.y,mouseX,mouseY);
  float dst3 = dist(cp3.x,cp3.y,mouseX,mouseY);
  cp1.drag = false;
  cp2.drag = false;
  cp3.drag = false;
  if (dst3<=5) cp3.drag = true;
  else if (dst2<=5) cp2.drag = true;
  else if (dst1<=5) cp1.drag = true;
}

void mouseDragged() {
  float mx = mouseX-pmouseX;
  float my = mouseY-pmouseY;
  if (cp1.drag) {
    cp1.x += mx;
    cp1.y += my;
  }
  if (cp2.drag) {
    cp2.x += mx;
    cp2.y += my;
  }
  if (cp3.drag) {
    cp3.x += mx;
    cp3.y += my;
  }
}
