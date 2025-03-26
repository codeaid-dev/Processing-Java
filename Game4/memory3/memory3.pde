class Tile {
  float x,y;
  color c;
  Tile(float x,float y,color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }
  void draw(color c) {
    if (c==0)
      fill(this.c);
    else
      fill(c); 
    rect(this.x,this.y,100,100);
  }
}

class Circle {
  float x,y,ox,oy;
  color c;
  boolean status;
  Circle(float x,float y,color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }
  void draw() {
    fill(this.c);
    ellipse(this.x,this.y,50,50);
  }
}

Tile[] tiles = new Tile[6];
Circle[] circles = new Circle[6];
color[] colors = {color(255,0,0),
          color(0,255,0),
          color(0,0,255),
          color(255,255,0),
          color(0,255,255),
          color(255,0,255)};
int saved_time = millis();
int status = 0; // 0:memory, 1:doing, 2:show

void setup() {
  size(600,400);
  for (int i=1; i<6; i++) {
    int n = int(random(i+1));
    color temp = colors[i];
    colors[i] = colors[n];
    colors[n] = temp;
  }
  for (int i=0; i<6; i++) {
    tiles[i] = new Tile(50+i%3*200,100+i/3*150,colors[i]);
    circles[i] = new Circle(random(25,width-25),
                    random(25,75),colors[i]);
  }
}

void draw() {
  background(255);
  int timer;
  if (status == 0)
    timer = 5 - ((millis()-saved_time)/1000);
  else if (status == 1)
    timer = 10 - ((millis()-saved_time)/1000);
  else
    timer = 0;
  if (timer == 0 && status != 2) {
    status += 1;
    if (status == 1)
      saved_time = millis();
  }
  for (Tile t : tiles) {
    if (status == 0 || status == 2)
      t.draw(0);
    else
      t.draw(color(200));
  }

  for (Circle c : circles)
    c.draw();

  textAlign(CENTER);
  textSize(30);
  fill(255,0,0);
  if (status == 0)
    text("Memory all",width/2,80);
  else if (status == 1)
    text("Put all circles on each tile",width/2,80);
  else
    text("Done",width/2,80);
  text(timer,width/2,50);
}

void mousePressed() {
  for (Circle c : circles) {
    float d = dist(mouseX,mouseY,c.x,c.y);
    if (d < 25) {
      c.ox = mouseX;
      c.oy = mouseY;
      c.status = true;
    } else {
      c.status = false;
    }
  }
}

void mouseDragged() {
  for (Circle c : circles) {
    if (c.status && status==1) {
      float mx = mouseX - c.ox;
      float my = mouseY - c.oy;
      c.x += mx;
      c.y += my;
      c.ox = mouseX;
      c.oy = mouseY;
    }
  }
}
