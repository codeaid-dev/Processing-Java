float px, py, ps;
float sx, sy;

void setup(){
  size(600, 500);
  px = width/2;
  py = height/2;
  ps = 30;
}

void draw(){
  background(255);
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
