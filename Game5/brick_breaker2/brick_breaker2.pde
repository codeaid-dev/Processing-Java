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
  boolean collision(Brick brick) {
    float closestX;
    if (this.x < brick.x)
      closestX = brick.x;
    else if (this.x > brick.x + brick.w)
      closestX = brick.x + brick.w;
    else
      closestX = this.x;

    float closestY;
    if (this.y < brick.y)
      closestY = brick.y;
    else if (this.y > brick.y + brick.h)
      closestY = brick.y + brick.h;
    else
      closestY = this.y;
    float dx = this.x - closestX;
    float dy = this.y - closestY;
    float distance = sqrt(dx * dx + dy * dy);
    return distance < this.s/2;
  }
  boolean is_bottom() {
    return this.y+this.s/2 > height;
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

  if (mode.equals("over")) {
    textAlign(CENTER);
    textSize(50);
    fill(255);
    text("GAME OVER",width/2,height/2);
  }

  if (ball.collision(player)) {
    // 変換後の最小値+(変換後の範囲)*((指定した数値-変換前の最小値)/(変換前の範囲))
    float dx = -4 + 8 * (ball.x-player.x)/player.w;
    //float dx = map(ball.x,player.x,player.x+player.w,-4,4)
    ball.dx = dx;
    ball.dy = -abs(ball.dy);
  }

  if (ball.is_bottom())
    mode = "over";
}

void keyPressed() {
  if (key == ' ') {
    if (mode.equals("stop"))
      mode = "play";
  }
}
