PVector crossPoint = new PVector();

void setup() {
  size(500,500);
}

void draw() {
  background(200);
  float Ax = 150;
  float Ay = 350;
  float Bx = 350;
  float By = 150;
  float Px = mouseX;
  float Py = mouseY;
  float radius = 50;
  boolean hit = false;

  strokeWeight(3);
  stroke(0);
  line(Ax,Ay,Bx,By);
  if (collision(Ax,Ay,Bx,By,Px,Py,radius)) {
    hit = true;
    fill(255,0,0);
  } else {
    fill(0,255,0);
  }
  noStroke();
  ellipse(Px,Py,radius*2,radius*2);        
  if (hit) {
    fill(255,255,0);
    ellipse(crossPoint.x,crossPoint.y,10,10);
  }
}

boolean collision(float Ax,float Ay,float Bx,float By,float Px,float Py,float radius) {
  PVector AP = new PVector(Px-Ax,Py-Ay);
  PVector AB = new PVector(Bx-Ax,By-Ay);
  AB.normalize();

  //単位ベクトルABとベクトルAPの内積(AXの距離)
  float lenAX = AB.x*AP.x+AB.y*AP.y;
  float shortest,lenPX;
  if (lenAX < 0) {
    //AXが負ならAPが最短距離
    shortest = dist(Ax,Ay,Px,Py);
  } else if (lenAX > dist(Ax,Ay,Bx,By)) {
    //AXがABより長い場合はBPが最短距離
    shortest = dist(Bx,By,Px,Py);
  } else {
    //単位ベクトルAPとベクトルAPの外積(PXの距離)
    lenPX = AB.x*AP.y-AB.y*AP.x;
    //PがAB線分上にあるので、PXが最短距離
    shortest = abs(lenPX);
  }

  crossPoint.x = Ax+(AB.x*lenAX);
  crossPoint.y = Ay+(AB.y*lenAX);

  if (shortest < radius)
    return true;
  return false;
}
