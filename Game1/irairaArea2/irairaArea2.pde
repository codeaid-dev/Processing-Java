class Circle {
  float x,y,s;
  Circle(float x,float y,float s) {
    this.x = x;
    this.y = y;
    this.s = s;
  }

  void draw(color c) {
    fill(c);
    ellipse(this.x,this.y,this.s,this.s);
  }
}

Circle player;
void setup() {
  size(600,400);
  player = new Circle(67,15,30);
}

void draw() {
  background(255);
  noStroke();
  player.draw(color(0));
}

void mouseMoved() {
  if (mouseX > player.s/2 &&
  mouseX < width-player.s/2 &&
  mouseY > player.s/2 &&
  mouseY < height-player.s/2) {
    player.x = mouseX;
    player.y = mouseY;
  }
}
