class Circle {
  float x,y,s;
  boolean goal;
  Circle(float x,float y,float s) {
    this.x = x;
    this.y = y;
    this.s = s;
    this.goal = false;
  }

  void display(color c) {
    fill(c);
    ellipse(this.x,this.y,this.s,this.s);
  }
}

Circle player;
Circle walls[] = new Circle[54];
void setup() {
  size(600,400);
  player = new Circle(60,60,30);
  int goal = int(random(54));
  for (int i=0; i<54; i++) {
    float x = i%9;
    float y = i/9;
    Circle w = new Circle(x*66+34,y*66+34,30);
    if (i == goal) { w.goal = true; }
    walls[i] = w;
  }
}

void draw() {
  background(255);
  noStroke();
  for (Circle w : walls) {
    if (w.goal) {
      w.display(color(0,0,255));
    } else {
      w.display(color(255,0,0));
    }
  }
  player.display(color(0));
  player.x = mouseX;
  player.y = mouseY;
}
