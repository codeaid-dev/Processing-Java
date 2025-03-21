class Circle {
  float x,y,s;
  Circle(float x,float y,float s) {
    this.x = x;
    this.y = y;
    this.s = s;
  }

  void display(color c) {
    fill(c);
    ellipse(this.x,this.y,this.s,this.s);
  }
}

Circle player;
void setup() {
  size(600,400);
  player = new Circle(60,60,30);
}

void draw() {
  background(255);
  noStroke();
  player.display(color(0));
  player.x = mouseX;
  player.y = mouseY;
}
