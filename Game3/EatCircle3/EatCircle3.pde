class Circle {
  float x,y,s,speed;
  color c;
  boolean active;
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
ArrayList<Circle> enemy = new ArrayList<Circle>();
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
  if (status == 2) {
    fill(255);
    textAlign(CENTER);
    textSize(50);
    text("GAME OVER",width/2,height/2);
    return;
  }
  
  if (frameCount % 30 == 0)
    create_enemy();
  
  for (Circle e : enemy) {
    if (e.active) {
      e.x += e.speed;
      e.display();
      if (is_hit(player.x,player.y,player.s,
              e.x,e.y,e.s)) {
        if (player.s > e.s) {
          player.s += e.s*0.1;
          e.active = false;
        } else {
          status = 2;
        }
      }
    }
  }
}

void mousePressed() {
  if (status == 0)
    status = 1;
}

void create_enemy() {
  Circle e = new Circle(0,random(0,height));
  e.speed = random(-3,4);
  if (e.speed < 0)
    e.x = width;
  e.s = random(player.s*0.5,player.s*2);
  e.c = color(random(256),random(256),random(256));
  e.active = true;
  enemy.add(e);
}

boolean is_hit(float px,float py,float ps,
              float ex,float ey,float es) {
  float d = dist(px,py,ex,ey);
  return d < ps/2+es/2;
}
