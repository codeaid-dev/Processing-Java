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
  void draw(float w,float h) {
    if (w==0 || h==0) {
      image(img,x,y);
    } else {
      this.radius=h/2;
      image(img,x,y,w,h);
    }
  }
  boolean collide(Sprite sprite) {
    float distance =
    sqrt((x-sprite.x)*(x-sprite.x) + (y-sprite.y)*(y-sprite.y));
    return distance < radius+sprite.radius;
  }
}
Sprite player;
ArrayList<Sprite> enemies = new ArrayList<>();
ArrayList<Sprite> bullets = new ArrayList<>();
boolean shoot = false,over = false;
int score = 0;
void setup() {
  size(600,800);
  imageMode(CENTER);
  player = new Sprite(300,700,0,0,"player.png");
}

void draw() {
  background(0);
  if (over) {
    textSize(50);
    textAlign(CENTER);
    text("GAME OVER\nSCORE: "+score, 316, 300);
    return;
  }
  if (frameCount%30 == 0)
    enemies.add(new Sprite(random(width),random(-500,-100),0,5,"ufo.png"));
  if (keyPressed) {
    if (keyCode == UP)
      player.dy -= 1;
    if (keyCode == DOWN)
      player.dy += 1;
    if (keyCode == LEFT)
      player.dx -= 1;
    if (keyCode == RIGHT)
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
//  player.draw(0,0);
  player.draw(60,40);
  for (Sprite b : bullets) {
    if (b.y < -b.img.height/2) {
      b.valid = false;
      continue;
    }
    for (Sprite e : enemies) {
      if (e.collide(b)) {
        score += 1;
        b.valid = false;
        e.valid = false;
      }
      if (e.y > height+e.img.height/2) {
        e.x = random(width);
        e.y = random(-500,-100);
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
//    e.draw(0,0);
    e.draw(50,50);
    if (e.collide(player)) {
      over = true;
    }
  }
  //println(enemies.size());
  copied = (ArrayList<Sprite>)bullets.clone();
  for (Sprite b : copied) {
    if (!b.valid) {
      bullets.remove(b);
      continue;
    }
    b.move(1);
    b.draw(0,0);
}
  //println(bullets.size());
}
