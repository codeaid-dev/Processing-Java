class Circle {
  float x,y,s,dx,dy;
  boolean goal;
  Circle(float x,float y,float s) {
    this.x = x;
    this.y = y;
    this.s = s;
    this.dx = 0;
    this.dy = 0;
    this.goal = false;
  }

  void display(color c) {
    fill(c);
    ellipse(this.x,this.y,this.s,this.s);
  }

  boolean is_hit(Circle obj) {
    float distance = dist(this.x,this.y,obj.x,obj.y);
    return distance<this.s/2+obj.s/2;
  }
}

Circle player;
Circle walls[] = new Circle[54];
boolean over=false, clear=false;
float timer = 400;
boolean up, down, left, right;
void setup() {
  size(600,400);
  player = new Circle(60,60,30);
  int goal = int(random(54));
  for (int i=0; i<54; i++) {
    float x = i%9;
    float y = i/9;
    Circle w = new Circle(x*66+34,y*66+34,30);
    if (i == goal) { w.goal = true; }
    walls[i] = w;
  }
}

void draw() {
  background(255);
  noStroke();
  for (Circle w : walls) {
    if (w.goal) {
      w.display(color(0,0,255));
    } else {
      w.display(color(255,0,0));
    }
  }
  player.display(color(0));
  textSize(50);
  textAlign(CENTER);
  if (over) {
    text("GAME OVER",300,200);
    return;
  }
  if (clear) {
    text("CLEAR",300,200);
    return;
  }

  if (keyPressed) {
    if (up)
      player.dy -= 0.1;
    if (down)
      player.dy += 0.1;
    if (left)
      player.dx -= 0.1;
    if (right)
      player.dx += 0.1;
  }

  player.dx *= 0.98;
  player.dy *= 0.98;
  player.x += player.dx;
  player.y += player.dy;

  for (Circle w : walls) {
    if (w.is_hit(player)) {
      if (w.goal) {
          clear = true;
      } else {
          over = true;
      }
    }
  }
  fill(255, 183, 0);
  rect(0, 0, 15, timer);
  timer -= 0.6;
  if (timer < 0)
    over = true;
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
