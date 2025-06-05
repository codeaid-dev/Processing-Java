class Sprite {
  PImage img;
  float x;
  float y;
  float angle;
  float speed;
  boolean apear;
  ArrayList<Bullet> bullets;
  float distance;
  Sprite(String file) {
    if (file != null) {
      img = loadImage(file);
    }
    bullets = new ArrayList<>();
  }
  void shot(int speed) {
    float rad = radians(angle);
    Bullet b = new Bullet(x, y, rad, speed);
    bullets.add(b);
  }
}

class Bullet {
  float x;
  float y;
  float rad;
  int speed;
  Bullet(float x, float y, float rad, int speed) {
    this.x = x;
    this.y = y;
    this.rad = rad;
    this.speed = speed;
  }
  void move() {
    x += speed * cos(rad);
    y += speed * sin(rad);
  }
  void display(color iro) {
    noStroke();
    fill(iro);
    circle(x, y, 20);
  }
}

Sprite player;
boolean shooting = false;
boolean left, right, space;
ArrayList<Sprite> monsters = new ArrayList<>();
void setup() {
  size(1000, 1000);
  player = new Sprite("majo.png");
  player.x = width/2;
  player.y = height/2;
  player.angle = 0;
  imageMode(CENTER);
  for (int i=0; i<10; i++) {
    Sprite m = new Sprite("monster"+(i%4+1)+".png");
    m.angle = random(360);
    m.distance = width/2;
    m.x = width/2 + m.distance*cos(radians(m.angle));
    m.y = height/2 + m.distance*sin(radians(m.angle));
    m.speed = random(1,3);
    m.apear = false;
    monsters.add(m);
  }
}

void draw() {
  background(200);
  if (keyPressed) {
    if (left)
      player.angle -= 3;
    if (right)
      player.angle += 3;
    if (space && shooting == false) {
      player.shot(5);
      shooting = true;
    }
    if (!space && shooting)
      shooting = false;
  } else {
    shooting = false;
  }

  for (Bullet b : player.bullets) {
    b.move();
    b.display(color(255,255,0));
  }

  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(player.angle));
  image(player.img, 0, 0);
  popMatrix();

  if (frameCount % 120 == 0) {
    Sprite m = monsters.get(int(random(monsters.size())));
    if (m.apear == false)
      m.apear = true;
  }

  for (Sprite m : monsters) {
    if (m.apear) {
      if (m.distance > 0) {
        m.distance -= m.speed;
        m.x = width/2 + m.distance*cos(radians(m.angle));
        m.y = height/2 + m.distance*sin(radians(m.angle));
        image(m.img, m.x, m.y);
      } else if (m.distance <= 0) {
        m.angle = random(360);
        m.distance = width/2;
        m.x = width/2 + m.distance*cos(radians(m.angle));
        m.y = height/2 + m.distance*sin(radians(m.angle));
        m.speed = random(1,4);
        m.apear = false;
      }
    }
  }
}

void keyPressed() {
  if (key == ' ') space = true;
  if (keyCode == LEFT) left = true;
  if (keyCode == RIGHT) right = true;
}

void keyReleased() {
  if (key == ' ') space = false;
  if (keyCode == LEFT) left = false;
  if (keyCode == RIGHT) right = false;
}
