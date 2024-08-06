int passed,start;
int timer = 10;
void setup() {
  size(300,200);
}

void draw() {
  background(255);
  textAlign(CENTER);
  textSize(50);
  fill(255,0,0);
  if (start != 0) {
    passed = (millis()-start)/1000;
    if (passed >= timer) {
      text("Passed Time",width/2,height/2);
      text(passed,width/2,height-50);
      start = 0;
    } else {
      text("Start",width/2,height/2);
      text(passed,width/2,height-50);
    }
  } else {
    text("Passed Time",width/2,height/2);
    text(passed,width/2,height-50);
  }
}

void keyPressed() {
  if (key == ENTER) {
    if (start == 0)
      start = millis();
  } else {
    passed = (millis()-start)/1000;
    start = 0;
  }
}
