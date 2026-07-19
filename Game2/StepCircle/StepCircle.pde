float x=40, y=40;
float w=30, h=30;
float dx=0, dy=0;
boolean over = false;
boolean clear = false;
boolean up, left, right;
boolean onGround = false;

class Line {
  float x1,y1,x2,y2;
  boolean goal;
  Line(float x1,float y1,float x2,float y2) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.goal = false;
  }
  void draw() {
    if (this.goal) {
      stroke(255,0,0);
    } else {
      stroke(0);
    }
    strokeWeight(6);
    line(this.x1,this.y1,this.x2,this.y2);
  }
  boolean isHit(float x,float y,float radius) {
    return this.x1 <= x && this.x2 >= x &&
        this.y1 >= y-radius && this.y1 <= y+radius;
  }
}
Line[] lines = new Line[6];

void setup() {
  size(600, 400);
  for (int i=0; i<6; i++) {
    Line l = new Line(
      i*100+10,
      350-i*50,
      i*100+60,
      350-i*50
    );
    if (i == 5) {
      l.goal = true;
    }
    lines[i] = l;
  }
}

void draw() {
  background(255);
  for (Line l : lines) {
    l.draw();
  }
  noStroke();
  fill(0);
  ellipse(x, y, w, h);

  if (over) {
    textSize(50);
    textAlign(CENTER);
    text("GAME OVER", 300, 200);
    return;
  }

  if (clear) {
    textSize(50);
    textAlign(CENTER);
    text("CLEAR", 300, 200);
    return;
  }

  onGround = false;
  for (Line l : lines) {
    if (l.isHit(x,y,w/2)) {
      dy = 0;
      if (l.goal) {
        clear = true;
      }
      onGround = true;
      break;
    }
  }

  if (keyPressed) {
    if (up && dy == 0)
      dy -= 7;
    if (left)
      dx -= 0.1;
    if (right)
      dx += 0.1;
  }

  dx *= 0.98;
  dy *= 0.98;
  x += dx;
  y += dy;

  if (!onGround) dy += 0.3;
  if (y > (height - h/2))
    over = true;
}

void keyPressed() {
  if (keyCode == UP) up = true;
  if (keyCode == LEFT) left = true;
  if (keyCode == RIGHT) right = true;
}

void keyReleased() {
  if (keyCode == UP) up = false;
  if (keyCode == LEFT) left = false;
  if (keyCode == RIGHT) right = false;
}
