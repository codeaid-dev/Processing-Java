PVector player = new PVector(60,60);
PVector speed = new PVector(0,0);
int s = 30;
int wc = 54;
PVector[] wall = new PVector[wc];
boolean over = false;
int goal = (int)random(wc);
boolean clear = false;
float timer = 400;

void setup(){
  size(600, 400);
  for (int i=0; i<wc; i++) {
    wall[i] = new PVector(s+(s*2+8)*(i%9), s+(s*2+8)*(i/9));
  }
}

void draw(){
  background(255);
  noStroke();
  for (int i=0; i<wc; i++) {
    if (i == goal) {
      fill(0, 0, 255);
    } else {
      fill(255, 0, 0);
    }
    ellipse(wall[i].x,wall[i].y,s,s);
  }
  fill(0);
  ellipse(player.x, player.y, s, s);

  if (over) {
    textSize(50);
    textAlign(CENTER);
    text("GAME OVER", 300, 200);
    return;
  }
  if (clear) {
    textSize(50);
    textAlign(CENTER);
    text("GAME CLEAR", 300, 200);
    return;
  }

  if (keyPressed) {
    if (keyCode == UP) {
        speed.y -= 0.1;
    }
    if (keyCode == DOWN) {
        speed.y += 0.1;
    }
    if (keyCode == LEFT) {
        speed.x -= 0.1;
    }
    if (keyCode == RIGHT) {
        speed.x += 0.1;
    }
  }

  speed.x *= 0.98;
  speed.y *= 0.98;
  player.x += speed.x;
  player.y += speed.y;

  if (player.x<s/2 || player.x>(width-s/2)
      || player.y<s/2 || player.y>(height-s/2)){
    over = true;
  }

  for (int i=0; i<wc; i++) {
    int check = isHit(player.x, player.y, s, wall[i].x, wall[i].y, s, i);
    if (check == 1) {
      over = true;
    } else if (check == 2) {
      clear = true;
    }
  }
  fill(255, 183, 0);
  rect(0, 0, 15, timer);
  timer -= 0.6;
  if (timer < 0) {
    over = true;
  }
}

int isHit(float px, float py, int ps, float ex, float ey, int es, int id) {
  float distance = dist(px, py, ex, ey);
  if (distance < ps/2+es/2) {
    if (id == goal) {
      return 2;
    } else {
      return 1;
    }
  }
  return 0;
}
