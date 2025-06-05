class Sprite {
  float x,y,dx,dy,radius;
  PImage img;
  boolean valid;
  Sprite(float x,float y,float dx,float dy,String img) {
    this.img = loadImage(img);
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
    this.radius = this.img.height/2;
    this.valid = true;
  }
  void move(float num) {
    x += dx;
    y += dy;
    dx *= num;
    dy *= num;
  }
  void draw() {
    image(img,x,y);
  }
  boolean collide(Sprite sprite) {
    float distance =
    sqrt((x-sprite.x)*(x-sprite.x) + (y-sprite.y)*(y-sprite.y));
    return distance < radius+sprite.radius;
  }
}
Sprite player;
boolean up, down, left, right;
ArrayList<Sprite> enemies = new ArrayList<>();
ArrayList<Sprite> bullets = new ArrayList<>();
boolean shoot = false;
void setup() {
  size(600,800);
  imageMode(CENTER);
  player = new Sprite(300,700,0,0,"player.png");
}

void draw() {
  background(0);
  if (frameCount%30 == 0)
    enemies.add(new Sprite(random(width),random(-500,-100),0,5,"ufo.png"));
  if (keyPressed) {
    if (up)
      player.dy -= 1;
    if (down)
      player.dy += 1;
    if (left)
      player.dx -= 1;
    if (right)
      player.dx += 1;
    if (key == ' ' && shoot == false) {
      Sprite b = new Sprite(player.x,player.y,0,-5,"missiles.png");
      bullets.add(b);
      shoot = true;
    }
  } else {
    shoot = false;
  }
  player.move(0.95);
  player.draw();
  for (Sprite b : bullets) {
    for (Sprite e : enemies) {
      if (e.collide(b)) {
        b.valid = false;
        e.valid = false;
      }
    }
  }
  ArrayList<Sprite> copied = (ArrayList<Sprite>)enemies.clone();
  for (Sprite e : copied) {
    if (!e.valid) {
      enemies.remove(e);
      continue;
    }
    e.move(1);
    e.draw();
  }
  //println(enemies.size());
  copied = (ArrayList<Sprite>)bullets.clone();
  for (Sprite b : copied) {
    if (!b.valid) {
      bullets.remove(b);
      continue;
    }
    b.move(1);
    b.draw();
  }
  //println(bullets.size());
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
