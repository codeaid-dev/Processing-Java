float x=300,y=300;
boolean up, down, left, right;
int dir = 1; //1:RIGHT,2:DOWN,3:LEFT,4:UP
boolean open_mouse = true; //true:open mouse,false:close mouse
boolean move = false; //true:moving,false:stoping

void setup() {
  size(600,600);
  noStroke();
}

void draw() {
  background(0);
  if (keyPressed) {
    move = true;
    if (up) {
      y -= 5;
      dir = 4;
    }
    if (down) {
      y += 5;
      dir = 2;
    }
    if (left) {
      x -= 5;
      dir = 3;
    }
    if (right) {
      x += 5;
      dir = 1;
    }
  } else {
    move = false;
  }
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
