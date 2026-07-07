// 四角形Aのx,y座標、幅、高さ
float AX=100,AY=100,AW=100,AH=100;
// 四角形Bのx,y座標、幅、高さ
float BX=150,BY=150,BW=100,BH=100;

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  noStroke();

  AX = mouseX-50;
  AY = mouseY-50;
  fill(0, 255, 0);
  rect(AX, AY, AW, AH);
  
  if (AX <= BX+BW && AX+AW >= BX &&
      AY <= BY+BH && AY+AH >= BY) {
    fill(255,0,0,150);
  } else {
    fill(0);
  }
  rect(BX, BY, BW, BH);  
}
