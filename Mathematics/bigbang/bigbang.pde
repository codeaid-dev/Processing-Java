class Circle{
  float angle,distance,diameter,speed;
}

ArrayList<Circle> ens = new ArrayList<>();
void setup() {
  size(500,500);
  for (int i=0; i<500; i++) {
    Circle en = new Circle();
    en.angle = random(360);
    en.distance = 0;
    en.diameter = random(5,20);
    en.speed = random(1,5);
    ens.add(en);
  }
  noStroke();
  fill(255,128);
}

void draw() {
  background(0);
  for (Circle en : ens) {
    float x = width/2 + en.distance*cos(en.angle*PI/180);
    float y = height/2 + en.distance*sin(en.angle*PI/180);
    ellipse(x,y,en.diameter,en.diameter);
    if (x < 0 || x > width || y < 0 || y > height) {
      en.angle = random(360);
      en.distance = 0;
      en.diameter = random(5,20);
      en.speed = random(1,5);
    } else {
      en.distance += en.speed;
    }
  }
}
