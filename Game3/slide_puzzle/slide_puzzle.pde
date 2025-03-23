PVector[] tiles = new PVector[9];
int[] nums = new int[9];

void setup() {
  size(450,450);
  textSize(75);
  textAlign(CENTER);
  rectMode(CENTER);
  for (int i=0; i<9; i++) {
    tiles[i] = new PVector(75+i%3*150,75+i/3*150);
    nums[i] = i;
  }

  for (int i=1; i<9; i++) {
    int n = int(random(i+1));
    int temp = nums[i];
    nums[i] = nums[n];
    nums[n] = temp;
  }
}

void draw() {
  for (int i=0; i<9; i++) {
    fill(255);
    rect(tiles[i].x,tiles[i].y,150,150);
    if (nums[i] != 0) {
      fill(0);
      text(nums[i],tiles[i].x,tiles[i].y+35);
    }
  }
}

void mousePressed() {
  float x = mouseX;
  float y = mouseY;
  for (int i=0; i<9; i++) {
    if (tiles[i].x-75<x && x<tiles[i].x+75
        && tiles[i].y-75<y && y<tiles[i].y+75)
      slide(i);
  }
}

void slide(int i) {
  if (i<=5 && nums[i+3] == 0) {
    int work = nums[i];
    nums[i] = nums[i+3];
    nums[i+3] = work;
  }
  if (i>=3 && nums[i-3] == 0) {
    int work = nums[i];
    nums[i] = nums[i-3];
    nums[i-3] = work;
  }
  if (i%3 != 2 && nums[i+1] == 0) {
    int work = nums[i];
    nums[i] = nums[i+1];
    nums[i+1] = work;
  }
  if (i%3 != 0 && nums[i-1] == 0) {
    int work = nums[i];
    nums[i] = nums[i-1];
    nums[i-1] = work;
  }
}
