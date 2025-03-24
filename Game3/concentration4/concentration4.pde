color[] colors={color(255,0,0),color(0,255,0),
        color(0,0,255),color(255,255,0),
        color(255,0,255),color(0,255,255),
        color(0),color(128,0,0),color(128)};
int[] tiles = new int[16];
int[] status = new int[16];
int one=99,two=99;
int showCount=0;
void setup() {
  size(600,600);
  noStroke();
  int num = 0;
  for (int i=0; i<16; i+=2) {
    tiles[i] = num;
    tiles[i+1] = num;
    num += 1;
  }
  for (int i=0; i<16; i++) {
    int n = int(random(i+1));
    int temp = tiles[i];
    tiles[i] = tiles[n];
    tiles[n] = temp;
  }
}

void draw() {
  background(255);
  if (one!=99 && two!=99) {
    if (showCount<120) {
      showCount+=1;
    } else {
      if (tiles[one]!=tiles[two]) {
        status[one]=0;
        status[two]=0;
      }
      one=99;
      two=99;
      showCount=0;
    }
  }

  for (int i=0; i<16; i++) {
    if (status[i] == 0)
      fill(colors[8]);
    else
      fill(colors[tiles[i]]);
    ellipse(i%4*150+75,i/4*150+75,150,150);
  }
}

void mousePressed() {
  if (one==99 || two==99) {
    for (int i=0; i<16; i++) {
      float dst=dist(mouseX,mouseY,
                i%4*150+75,i/4*150+75);
      if (dst<=75) {
        if (one==99)
          one=i;
        else if (two==99)
          two=i;
        status[i]=1;
        break;
      }
    }
  }
}
