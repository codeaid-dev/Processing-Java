PVector player = new PVector(60,60);
PVector speed = new PVector(0,0);
int s = 30;
int wc = 54;
PVector[] wall = new PVector[wc];

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
    fill(255, 0, 0);
    ellipse(wall[i].x,wall[i].y,s,s);
  }
  fill(0);
  ellipse(player.x, player.y, s, s);

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
}
