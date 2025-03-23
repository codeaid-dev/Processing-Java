PVector[] tiles = new PVector[25];
int[] nums = new int[25];
int[] status = new int[25];
int count = 1;
float time = 0;
boolean over = false;
boolean finish = false;
void setup() {
  size(500,500);
  textSize(50);
  textAlign(CENTER);
  rectMode(CENTER);

  for (int i=0; i<25; i++) {
    tiles[i] = new PVector(50+i%5*100,50+i/5*100);
    nums[i] = i+1;
  }

  for (int i=1; i<25; i++) {
    int n = int(random(i+1));
    int temp = nums[i];
    nums[i] = nums[n];
    nums[n] = temp;
  }
}

void draw() {
  background(255);

  if (over) {
    fill(255,0,0);
    text("GAME OVER",width/2,height/2);
    return;
  }
  if (finish) {
    fill(255,128,0);
    text("FINISH",width/2,height/2);
    text(time,width/2,height/2+50);
    return;
  }

  for (int i=0; i<25; i++) {
    if (status[i] == 0)
      fill(255,0,0);
    else
      fill(255);
    rect(tiles[i].x,tiles[i].y,100,100);
    fill(0);
    text(nums[i],tiles[i].x,tiles[i].y+25);
  }

  time = frameCount / 60.0;
}

void mousePressed() {
  float x = mouseX;
  float y = mouseY;
  for (int i=0; i<25; i++) {
    if (tiles[i].x-50<x && x<tiles[i].x+50
        && tiles[i].y-50<y && y<tiles[i].y+50) {
      if (nums[i] == count) {
        status[i] = 1;
        if (count == 25)
          finish = true;
        count += 1;
      } else {
        over = true;
      }
    }
  }
}
