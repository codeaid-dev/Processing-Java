float x=-5, y=160;
float dy=5;
boolean flag=false;

void setup() {
    size(1000,200);
    noStroke();
}

void draw() {
    fill(0,10);
    rect(0,0,width,height);
    x += 2;
    if (x > width+5)
      x = -5;
    if (frameCount%100 == 0)
      flag = !flag;
    if (flag) {
      if (y <= 60 || y >= 160)
        dy *= -1;
      y += dy;
      if (y >= 160)
        flag = false;
    }
    fill(0,255,0);
    ellipse(x,y,10,10);
}
