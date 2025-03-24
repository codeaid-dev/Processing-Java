float x=300,y=300;
int dir = 1; //1:RIGHT,2:DOWN,3:LEFT,4:UP
boolean open_mouse = true; //true:open mouse,false:close mouse
boolean move = false; //true:moving,false:stoping
float ex=random(300),ey=50;
boolean over = false;
boolean clear = false;
int count = 0;

class Snack {
  float x,y;
  boolean eat;
}
Snack[] snacks = new Snack[50];

void setup() {
  size(600,600);
  noStroke();
  for (int i=0; i<50; i++) {
    Snack s = new Snack();
    s.x = random(5,width-5);
    s.y = random(5,height-5);
    s.eat = false;
    snacks[i] = s;
  }
}

void draw() {
  background(0);

  if (over) {
    textSize(50);
    textAlign(CENTER);
    fill(255);
    text("GAME OVER",width/2,height/2);
    return;
  }

  if (clear) {
    textSize(50);
    textAlign(CENTER);
    fill(255,255,0);
    text("CLEAR !!",width/2,height/2);
    return;
  }

  if (keyPressed) {
    move = true;
    if (keyCode == UP) {
      y -= 5;
      dir = 4;
    }
    if (keyCode == DOWN) {
      y += 5;
      dir = 2;
    }
    if (keyCode == LEFT) {
      x -= 5;
      dir = 3;
    }
    if (keyCode == RIGHT) {
      x += 5;
      dir = 1;
    }
  } else {
    move = false;
  }

  for (Snack s : snacks) {
    float dst = dist(x,y,s.x,s.y);
    if (dst<20)
      s.eat = true;
    if (!s.eat) {
      fill(255,0,0);
      ellipse(s.x,s.y,10,10);
    }
  }

  for (Snack s : snacks) {
    if (s.eat)
      count += 1;
  }
  if (count >= 50)
    clear = true;
  else
    count = 0;

  if (x<-15) {
    x = width+15;
  } else if (x>width+15) {
    x = -15;
  }
  if (y<-15) {
    y = height+15;
  } else if (y>height+15) {
    y = -15;
  }

  if (frameCount % 10 == 0)
    open_mouse = !open_mouse;

  fill(255,255,0);
  if (!move || open_mouse) {
    if (dir == 1)
      arc(x,y,30,30,radians(45),radians(315));
    else if (dir == 2)
      arc(x,y,30,30,radians(135),radians(405));
    else if (dir == 3)
      arc(x,y,30,30,radians(225),radians(495));
    else
      arc(x,y,30,30,radians(315),radians(585));
  } else {
    ellipse(x,y,30,30);
  }

  if (x < ex)
    ex -= 2;
  else
    ex += 2;
  if (y < ey)
    ey -= 2;
  else
    ey += 2;
  if (dist(x,y,ex,ey) < 30)
    over = true;
  fill(0,255,0);
  ellipse(ex,ey,30,30);
}
