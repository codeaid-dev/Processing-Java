class Circle{
  float angle,distance,diameter,speed;
}

ArrayList<Circle> ens = new ArrayList<>();
void setup() {
  size(500,500);
  for (int i=0; i<30; i++) {
    Circle en = new Circle();
    en.angle = random(360);
    en.distance = width/2;
    en.diameter = width/4;
    en.speed = random(1,4);
    ens.add(en);
  }
}

void draw() {
  background(0);
  for (Circle en : ens) {
    if (en.distance > 0) {
      en.distance -= en.speed;
      en.diameter -= en.speed/2;
      float x = width/2 + en.distance*cos(en.angle*PI/180);
      float y = height/2 + en.distance*sin(en.angle*PI/180);
      fill(0,255,0);
      ellipse(x,y,en.diameter,en.diameter);
    } else {
      en.angle = random(360);
      en.distance = width/2;
      en.diameter = width/4;
      en.speed = random(1,4);
    }
  }
}
