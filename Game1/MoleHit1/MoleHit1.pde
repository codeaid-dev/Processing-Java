int count = int(random(120,150));
boolean isShow = false;
void setup() {
  size(500,500);
}

void draw() {
  background(255);
  fill(0);
  count -= 1;
  if (count == 0) {
    if (isShow) {
      isShow = false;
    } else {
      isShow = true;
    }
    count = int(random(120,150));
  }
  if (isShow) {
    ellipse(width/2,height/2,50,50);
  }
}
