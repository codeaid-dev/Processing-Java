class Sprite {
  float x,y,dx,dy,radius;
  PImage img;
  Sprite(float x,float y,float dx,float dy,String img) {
    this.img = loadImage(img);
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
    this.radius = this.img.height/2;
  }
  void move(float num) {
    x += dx;
    y += dy;
    dx *= num;
    dy *= num;
  }
  void draw() {
    image(img,x,y);
  }
}
Sprite player;
void setup() {
  size(600,800);
  imageMode(CENTER);
  player = new Sprite(300,700,0,0,"player.png");
}

void draw() {
  background(0);
  if (keyPressed) {
    if (keyCode == UP)
      player.dy -= 1;
    if (keyCode == DOWN)
      player.dy += 1;
    if (keyCode == LEFT)
      player.dx -= 1;
    if (keyCode == RIGHT)
      player.dx += 1;
  }
  player.move(0.95);
  player.draw();
}
