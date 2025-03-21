int count[] = new int[5];
boolean isShow[] = new boolean[5];
float x[] = new float[5];
float y[] = new float[5];
int score = 0;
void setup() {
  size(500,500);
  for (int i=0; i<5; i++) {
    x[i] = random(25,width-25);
    y[i] = random(25,height-25);
    count[i] = int(random(120,150));
    isShow[i] = false;
  }
}

void draw() {
  background(255);
  fill(0);
  for (int i=0; i<5; i++) {
    count[i] -= 1;
    if (count[i] == 0) {
      if (isShow[i]) {
        isShow[i] = false;
      } else {
        isShow[i] = true;
      }
      count[i] = int(random(120,150));
    }
    if (isShow[i]) {
      ellipse(x[i],y[i],50,50);
    }
  }
  textAlign(CENTER);
  textSize(50);
  text("Score: "+score,width/2,70);
}

void mousePressed() {
  for (int i=0; i<5; i++) {
    float dst = dist(mouseX,mouseY,x[i],y[i]);
    if (dst < 25) {
      if (isShow[i]) {
        score += 1;
      }
      isShow[i] = false;
      count[i] = int(random(120,150));
    }
  }
}
