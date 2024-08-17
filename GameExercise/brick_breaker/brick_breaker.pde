class Ball {
  float x,y,radius,speed,angle;
  Ball() {
    x=width/2;
    y=height/2;
    radius = 5;
    speed = 5;
    angle = random(QUARTER_PI,HALF_PI+ QUARTER_PI);
  }
  void move() {
    x += speed*cos(angle);
    y += speed*sin(angle);
    if (x < radius || x > width-radius)
      angle = PI-angle;
    if (y < radius || y > height-radius)
      angle *= -1;
  }
  void draw() {
    fill(255);
    ellipse(x,y,radius*2,radius*2);
  }
  boolean collision(Brick brick) {
    float closestX,closestY;
    if (x < brick.x) {
      closestX = brick.x;
    } else if (x > brick.x+brick.w) {
      closestX = brick.x+brick.w;
    } else {
      closestX = x;
    }
    if (y < brick.y) {
      closestY = brick.y;
    } else if (y > brick.y+brick.h) {
      closestY = brick.y+brick.h;
    } else {
      closestY = y;
    }
    float distanceX = x-closestX;
    float distanceY = y-closestY;
    float distance = sqrt(distanceX*distanceX + distanceY*distanceY);
    return distance < radius;
  }
  boolean is_bottom() {
    return y+radius > height;
  }
}
class Brick {
  float x,y,w,h;
  color c;
  boolean valid;
  Brick(float x,float y,float w,float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.valid = true;
  }
  void draw() {
    fill(c);
    rect(x,y,w,h);
  }
}
Ball ball;
Brick player;
String mode = "stop"; // stop:stop, play:playing, over:gameover, clear:gameclear
Brick[] bricks = new Brick[30];

void setup() {
  size(600,800);
  ball = new Ball();
  player = new Brick(mouseX-25,770,50,20);
  player.c = color(255);
  colorMode(HSB);
  for (int i=0; i<bricks.length; i++) {
    float x = 60+i%5*100;
    float y = 40+i/5*50;
    Brick b = new Brick(x,y,80,30);
    b.c = color(i/5*40,255,255);
    bricks[i] = b;
  }
  colorMode(RGB);
}

void draw() {
  background(0);
  for (Brick brick : bricks) {
    if (brick.valid)
      brick.draw();
  }
  if (mode.equals("play"))
      ball.move();
  ball.draw();
  player.x = mouseX-25;
  player.draw();

  if (mode.equals("over")) {
    textAlign(CENTER);
    textSize(50);
    fill(255);
    text("GAME OVER",width/2,height/2);
  }
  if (mode.equals("clear")) {
    textAlign(CENTER);
    textSize(50);
    fill(0,255,0);
    text("GAME CLEAR",width/2,height/2);
  }

  if (ball.collision(player)) {
    // 変換後の最小値+(変換後の範囲)*((指定した数値-変換前の最小値)/(変換前の範囲))
    ball.angle = PI+PI*(ball.x-player.x)/player.w;
    //ball.angle = map(ball.x,player.x,player.x+player.w,PI,TWO_PI);
  }
  int count=0;
  for (Brick b : bricks) {
    if (ball.collision(b) && b.valid) {
      if ((ball.y-ball.radius < b.y+b.h && b.y+b.h < ball.y+ball.radius)
        || (ball.y-ball.radius < b.y && b.y < ball.y+ball.radius)) {
        ball.angle *= -1;
      } else {
        ball.angle = PI-ball.angle;
      }
      b.valid=false;
    }
    if (!b.valid)
      count += 1;
  }
  if (count == bricks.length)
    mode = "clear";

  if (ball.is_bottom())
    mode = "over";
}

void keyPressed() {
  if (key == ' ') {
    if (mode == "stop")
      mode = "play";
  }
}
