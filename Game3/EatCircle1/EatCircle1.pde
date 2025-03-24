class Circle {
  float x,y,s;
  color c;
  Circle(float x,float y) {
    this.x = x;
    this.y = y;
  }

  void display() {
    fill(this.c);
    ellipse(this.x,this.y,this.s,this.s);
  }
}

Circle player;
int status = 0;
void setup() {
  size(600,400);
  player = new Circle(width/2,height/2);
  player.s = 20;
}

void draw() {
  background(0);
  if (status == 0) {
    fill(255);
    textAlign(CENTER);
    textSize(50);
    text("GAME START",width/2,height/2);
    return;
  }
  
  player.x = mouseX;
  player.y = mouseY;
  if (status == 1) {
    noStroke();
    player.c = color(255);
    player.display();
  }
}

void mousePressed() {
  if (status == 0)
    status = 1;
}
