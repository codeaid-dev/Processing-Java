class Block {
  float x,y,w,h;
  String type;
  Block(float x,float y,float w,float h,String t) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.type = t;
  }
  void display() {
    if (this.type.equals("start"))
      fill(255,255,0);
    else if (this.type.equals("wall"))
      fill(255,0,0);
    else if (this.type.equals("goal"))
      fill(0,0,255);
    noStroke();
    rect(this.x,this.y,this.w,this.h);
  }
}

class Player {
  float x,y,dx,dy;
  Player(float x,float y) {
    this.x = x;
    this.y = y;
    this.dx = 0;
    this.dy = 0;
  }
  void move() {
    this.dx *= 0.98;
    this.x += this.dx;
    this.y += this.dy;
  }
  void display() {
    fill(0);
    noStroke();
    ellipse(this.x,this.y,30,30);
  }
  boolean collision(Block b) {
    if (b.type.equals("start"))
        return b.x < this.x
              && this.x < b.x+b.w
              && b.y < this.y+15
              && this.y+15 < b.y+b.h;
    else
      return false;
  }
  boolean out_of_space() {
    return 15 > this.x
            || this.x > width-15
            || 15 > this.y
            || this.y > height-15;
  }
}

Block start;
Player player;

void setup() {
  size(800,400);
  start = new Block(50,300,50,30,"start");
  player = new Player(75,280);
}

void draw() {
  background(255);
  start.display();
  player.display();
  if (player.collision(start))
    player.dy = 0;
  else
    player.dy += 0.1;
  if (keyPressed) {
    if (key == ' ')
      player.dy -= 0.2;
    if (keyCode == LEFT)
      player.dx -= 0.1;
    if (keyCode == RIGHT)
      player.dx += 0.1;
  }
  player.move();
  if (player.out_of_space()) {
    player.x = 75;
    player.y = 280;
  }
}
