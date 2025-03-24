float x=300,y=300;
int dir = 1; //1:RIGHT,2:DOWN,3:LEFT,4:UP

void setup() {
  size(600,600);
  noStroke();
}

void draw() {
  background(0);
  if (keyPressed) {
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
  fill(255,255,0);
  if (dir == 1)
    arc(x,y,30,30,radians(45),radians(315));
  else if (dir == 2)
    arc(x,y,30,30,radians(135),radians(405));
  else if (dir == 3)
    arc(x,y,30,30,radians(225),radians(495));
  else
    arc(x,y,30,30,radians(315),radians(585));
}
