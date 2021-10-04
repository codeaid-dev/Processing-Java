PVector player = new PVector(60,60);
PVector speed = new PVector(0,0);
int s = 30;
int wc = 54;
PVector[] wall = new PVector[wc];
boolean over = false;

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
    ellipse(wall[i].x, wall[i].y, s, s);
  }
  fill(0);
  ellipse(player.x, player.y, s, s);

  if (over) {
    textSize(50);
    textAlign(CENTER);
    text("GAME OVER", 300, 200);
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
      || player.y<s/2 || player.y>(height-s/2)) {
    over = true;
  }
}
