class Eye {
  float x,y,radius;
  float inRadius;
  color iro,inIro;
  Eye (float x,float y,float radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.inRadius = radius/2;
    this.iro = color(255);
    this.inIro = color(0);
  }
}
ArrayList<Eye> eyes = new ArrayList<Eye>();

void setup() {
  size(500,500);
  noStroke();
  for (int i=0; i<50; i++) {
    float radius = random(5,31);
    float x = random(radius,width-radius);
    float y = random(radius,height-radius);
    eyes.add(new Eye(x,y,radius));
  }
}

void draw() {
  background(0);
  for (Eye eye : eyes) {
    followEye(eye);
  }
}

void followEye(Eye eye) {
  fill(eye.iro);
  ellipse(eye.x,eye.y,eye.radius*2,eye.radius*2);
  float angle = atan2(mouseY-eye.y,mouseX-eye.x);
  float move = eye.radius-eye.inRadius;
  fill(eye.inIro);
  ellipse(eye.x+cos(angle)*move,
          eye.y+sin(angle)*move,
          eye.inRadius*2,eye.inRadius*2);
}
