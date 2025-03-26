class Ball {
  float x,y,dx,dy,s;
  Ball() {
    this.x = 250;
    this.y = 300;
    this.dx = random(-4,4);
    this.dy = random(2,4);
    this.s = 10;
  }
  void move() {
    this.x += this.dx;
    this.y += this.dy;
    if (this.x < this.s/2 || this.x > width-this.s/2)
      this.dx *= -1;
    if (this.y < this.s/2 || this.y > height-this.s/2)
      this.dy *= -1;
  }
}

class Brick {
  float x,y,w,h;
  Brick(float x,float y,float w,float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
}

Ball ball;
Brick player;
String mode = "stop"; // stop:stop, play:playing, over:gameover, clear:gameclear

void setup() {
  size(500,600);
  ball = new Ball();
  player = new Brick(mouseX-25,570,50,20);
}

void draw() {
  background(0);
  if (mode.equals("play"))
    ball.move();
  fill(255);
  ellipse(ball.x,ball.y,ball.s,ball.s);
  player.x = mouseX-25;
  rect(player.x,player.y,player.w,player.h);
}

void keyPressed() {
  if (key == ' ') {
    if (mode.equals("stop"))
      mode = "play";
  }
}
