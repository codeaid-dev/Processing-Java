float x = 250, y = 400, s = 50;
boolean up, down, left, right;
FloatList block_x = new FloatList(); 
FloatList block_y = new FloatList();  
FloatList block_size = new FloatList();
boolean over = false;
int time = 0;
void setup() {
    size(500,800);
    noStroke();
}

void draw() {
  background(255);
  if (over) {
    textSize(50);
    textAlign(CENTER);
    text("GAME OVER", 250,300);
    text(time,250,360);
    return;
  } else {
    time = frameCount/60;
  }

  fill(0,0,255);
  ellipse(x,y,s,s);

  if (keyPressed) {
    if (up) y -= 3;
    if (down) y += 3;
    if (left) x -= 3;
    if (right) x += 3;
  }
  if (x < s/2) x += 3;
  if (x > width-s/2) x -= 3;
  if (y < s/2) y += 3;
  if (y > height-s/2) y -= 3;
  if (frameCount % 10 == 0) {
    block_x.append(random(width));
    block_y.append(0);
    block_size.append(random(10,50));
  }
  for (int i=0; i<block_y.size(); i++) {
    block_y.set(i, block_y.get(i)+5);
    fill(0);
    ellipse(block_x.get(i),
        block_y.get(i),
        block_size.get(i),
        block_size.get(i));
    float dst = dist(x,y,block_x.get(i),block_y.get(i));
    if (dst < (block_size.get(i)+s)/2) {
      over = true;
    }
  }
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
