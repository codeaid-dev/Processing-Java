PVector[] en = new PVector[4];
color[] iro = {color(255,0,0),
       color(0,255,0),
       color(0,0,255),
       color(255,255,0)};
String[] moji = {"RED","GREEN",
        "BLUE","YELLOW"};
String[] choice = {"yomi","iro"};
int[] odai = new int[3];
int answer = 0;
float timebar = 600;
boolean finish = false;
void setup() {
  size(600,600);
  en[0] = new PVector(width/2,height/5);
  en[1] = new PVector(width/5*4,height/2);
  en[2] = new PVector(width/2,height/5*4);
  en[3] = new PVector(width/5,height/2);
  for (int i=0; i<2; i++) {
    odai[i] = int(random(4));
  }
  odai[2] = int(random(2));
}

void draw() {
  background(200);
  noStroke();
  textSize(30);
  textAlign(CENTER);
  for (int i=0; i<4; i++) {
    fill(iro[i]);
    ellipse(en[i].x,en[i].y,200,200);
  }

  fill(0);
  text(answer,width/5,height/5);

  if (finish) {
    fill(200,0,0);
    text("FINISH",width/2,height/2);
    return;
  }

  fill(iro[odai[0]]);
  text(moji[odai[1]],width/2,height/2);
  fill(0);
  text(choice[odai[2]],width/2,height/2+30);

  fill(0,128,128);
  rect(0,0,timebar,10);
  timebar -= 0.3;
  if (timebar <= 0)
    finish = true;
}

void mousePressed() {
  if (finish)
    return;
  float x = mouseX;
  float y = mouseY;
  for (int i=0; i<4; i++) {
    float dst = dist(x,y,en[i].x,en[i].y);
    if (dst < 100) {
      if (odai[2] == 0) {
        if (odai[1] == i)
          answer += 1;
      } else {
        if (odai[0] == i)
          answer += 1;
      }

      for (int j=0; j<2; j++) {
        odai[j] = int(random(4));
      }
      odai[2] = int(random(2));
    }
  }
}
