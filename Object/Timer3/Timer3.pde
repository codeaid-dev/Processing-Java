class Timer {
  int timer,saved,passed;
  Timer(int timer) {
    this.timer = timer;
    this.saved = 0;
    this.passed = 0;
  }
  void start() {
    if (this.saved == 0) {
      this.saved = millis();
    }
  }
  int stop() {
    if (this.saved != 0) {
      this.passed = (millis()-this.saved)/1000;
      this.saved = 0;
    }
    return this.passed;
  }
  boolean is_finished() {
    if (this.saved != 0) {
      if ((millis()-this.saved)/1000 >= this.timer) {
        this.stop();
        return true;
      } else {
        return false;
      }
    }
    return true;
  }
  int get_time() {
    if (this.is_finished()) {
      return this.passed;
    } else {
      return (millis()-this.saved)/1000;
    }
  }
}

Timer timer = new Timer(10);

void setup() {
  size(300,200);
}

void draw() {
  background(255);
  textAlign(CENTER);
  textSize(50);
  fill(255,0,0);
  if (!timer.is_finished()) {
    text("Start",width/2,height/2);
    text(timer.get_time(),width/2,height-50);
  } else {
    text("Passed Time",width/2,height/2);
    text(timer.get_time(),width/2,height-50);
  }
}

void keyPressed() {
  if (key == ENTER) {
    if (timer.is_finished()) {
      timer.start();
    } else {
      timer.stop();
    }
  }
}
