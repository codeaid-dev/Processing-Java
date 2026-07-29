float x,y,dx,dy;
float r=25;
color light;
color dark;

void setup() {
  size(500,500);
  noStroke();
  x = width/2;
  y = height/2;
  float angle = random(TWO_PI);
  float speed = random(5,8);
  dx = speed*cos(angle);
  dy = speed*sin(angle);
  light = color(200);
  dark = color(0);
}

void draw() {
  background(255);
  x += dx;
  y += dy;
  if (x < r || x > width-r)
    dx *= -1;
  if (y < r || y > height-r)
    dy *= -1;
  drawBall(x,y,r*2);
}

void drawBall(float x, float y, float d) {
  float r = d / 2;
  // 光源（左上）
  PVector lightP = new PVector(-1,-1);
  lightP.normalize();

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

void mousePressed() {
  x = mouseX;
  y = mouseY;
  float angle = random(TWO_PI);
  float speed = random(3,6);
  dx = speed*cos(angle);
  dy = speed*sin(angle);
  float r = random(256);
  float g = random(256);
  float b = random(256);
  light = color(r+50,g+50,b+50);
  dark = color(r,g,b);
}
