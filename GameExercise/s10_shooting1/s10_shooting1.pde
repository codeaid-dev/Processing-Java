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
boolean up, down, left, right;
void setup() {
  size(600,800);
  imageMode(CENTER);
  player = new Sprite(300,700,0,0,"player.png");
}

void draw() {
  background(0);
  if (keyPressed) {
    if (up)
      player.dy -= 1;
    if (down)
      player.dy += 1;
    if (left)
      player.dx -= 1;
    if (right)
      player.dx += 1;
  }
  player.move(0.95);
  player.draw();
}

void keyPressed() {
  if (keyCode == UP) up = true;
  if (keyCode == DOWN) down = true;
  if (keyCode == LEFT) left = true;
  if (keyCode == RIGHT) right = true;
}

void keyReleased() {
  if (keyCode == UP) up = false;
  if (keyCode == DOWN) down = false;
  if (keyCode == LEFT) left = false;
  if (keyCode == RIGHT) right = false;
}
