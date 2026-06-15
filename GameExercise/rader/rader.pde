float angle=0;
float[][] targets = new float[3][3];
void setup() {
  size(500,500);
  for (int i=0; i<3; i++) {
    float x = width/2 + random(50,width/2-50) * cos(random(TWO_PI));
    float y = height/2 + random(50,height/2-50) * sin(random(TWO_PI));
    float diameter = random(25,100);
    targets[i][0] = x;
    targets[i][1] = y;
    targets[i][2] = diameter;
  }
}

void draw() {
  noStroke();
  fill(0,10);
  rect(0,0,width,height);
  stroke(0,255,0);
  float x = width/2 + width/2 * cos(radians(angle%360));
  float y = height/2 + height/2 * sin(radians(angle%360));
  strokeWeight(5);
  line(x,y,width/2,height/2);
  angle += 1;
  for (float[] t : targets) {
    if (collision(x,y,width/2,height/2,t[0],t[1],t[2]/2)) {
      fill(0,255,0);
      ellipse(t[0],t[1],t[2],t[2]);
    }
  }
}

boolean collision(float Ax,float Ay,float Bx,float By,float Px,float Py,float radius) {
    PVector AP = new PVector(Px-Ax,Py-Ay);
    PVector AB = new PVector(Bx-Ax,By-Ay);
    AB.normalize();

    //単位ベクトルABとベクトルAPの内積(AXの距離)
    float lenAX = AB.x*AP.x+AB.y*AP.y;
    float shortest=0;
    if (lenAX < 0) {
      //AXが負ならAPが最短距離
      shortest = dist(Ax,Ay,Px,Py);
    } else if (lenAX > dist(Ax,Ay,Bx,By)) {
      //AXがABより長い場合はBPが最短距離
      shortest = dist(Bx,By,Px,Py);
    } else {
      //単位ベクトルAPとベクトルAPの外積(PXの距離)
      float lenPX = AB.x*AP.y-AB.y*AP.x;
      //PがAB線分上にあるので、PXが最短距離
      shortest = abs(lenPX);
    }

    return shortest < radius;
}