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
    else if (b.type.equals("goal"))
        return b.x < this.x-15
              && b.x+b.w > this.x+15
              && b.y < this.y-15
              && b.y+b.h > this.y+15;
    else if (b.type.equals("wall"))
        return b.x-15 < this.x
              && this.x < b.x+b.w+15
              && b.y-15 < this.y
              && this.y < b.y+b.h+15;
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
Block goal;
boolean game_clear = false;
ArrayList<Block> walls = new ArrayList<Block>();

void setup() {
  size(800,400);
  start = new Block(50,300,50,30,"start");
  player = new Player(75,280);
  goal = new Block(700,50,50,50,"goal");
  walls.add(new Block(185,0,30,250,"wall"));
  walls.add(new Block(385,200,30,250,"wall"));
  walls.add(new Block(585,0,30,250,"wall"));
}

void draw() {
  background(255);
  start.display();
  goal.display();
  for (Block w : walls) {
    w.display();
  }
  player.display();
  if (game_clear) {
    textAlign(CENTER);
    textSize(30);
    text("Game Clear",width/2,height/2);
    return;
  }
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
  if (player.collision(goal))
    game_clear = true;
  for (Block w : walls) {
    if (player.collision(w)) {
      player.x = 75;
      player.y = 280;
    }
  }
}
