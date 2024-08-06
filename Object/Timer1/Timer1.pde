int passed,start;
void setup() {
  size(300,200);
}

void draw() {
  background(255);
  textAlign(CENTER);
  textSize(50);
  fill(255,0,0);
  if (start != 0) {
    text("Start",width/2,height/2);
    text((millis()-start)/1000,width/2,height-50);
  } else {
    text("Passed Time",width/2,height/2);
    text(passed,width/2,height-50);
  }
}

void keyPressed() {
  if (key == ENTER) {
    if (start == 0) start = millis();
  } else {
    passed = (millis()-start)/1000;
    start = 0;
  }
}
