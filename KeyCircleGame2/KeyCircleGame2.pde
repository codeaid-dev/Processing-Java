float px, py, ps;
float sx, sy;
float[] rxList = new float[6];
float[] ryList = new float[6];

<<<<<<< HEAD
void setup(){
=======
void setup() {
>>>>>>> 57ddba62b0342d594f96bfa2f13e276c89885514
  size(600, 500);
  px = width/2;
  py = height/2;
  ps = 30;
  for (int i=0; i<6; i++) {
<<<<<<< HEAD
    rxList[i] = 75+175*(i%3); //余白+(四角+余白)x(添字÷3の余り)
    ryList[i] = 75+250*(i/3); //余白+(四角+縦余白)x(添字÷3)
  }
}

void draw(){
  background(255);
=======
    rxList[i] = 75+175*(i%3);
    ryList[i] = 75+250*(i/3);
  }
}

void draw() {
  background(255);

>>>>>>> 57ddba62b0342d594f96bfa2f13e276c89885514
  for (int i=0; i<6; i++) {
    fill(255);
    rect(rxList[i], ryList[i], 100, 100);
  }
  fill(0);
  ellipse(px, py, ps, ps);

  if (keyPressed) {
    if (keyCode == UP) {
<<<<<<< HEAD
        sy -= 1;
    }
    if (keyCode == DOWN) {
        sy += 1;
    }
    if (keyCode == LEFT) {
        sx -= 1;
    }
    if (keyCode == RIGHT) {
        sx += 1;
=======
      sy -= 1;
    }
    if (keyCode == DOWN) {
      sy += 1;
    }
    if (keyCode == LEFT) {
      sx -= 1;
    }
    if (keyCode == RIGHT) {
      sx += 1;
>>>>>>> 57ddba62b0342d594f96bfa2f13e276c89885514
    }
  }

  sx *= 0.98;
  sy *= 0.98;
  px += sx;
  py += sy;
}
