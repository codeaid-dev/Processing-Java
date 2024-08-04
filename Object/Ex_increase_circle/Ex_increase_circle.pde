class Circle{
  float x,y,s;
  color iro;
  boolean stat;
  Circle(float x,float y,float s,color iro){
    this.x = x;
    this.y = y;
    this.s = s;
    this.iro = iro;
    this.stat = false;
  }
}
int count = 50;
Circle[] ens = new Circle[count];
void setup() {
    size(600, 400);
}
void draw() {
  background(0);
  for (int i=0; i<count; i++) {
    if (ens[i] != null && ens[i].stat == true) {
      ens[i].x += 1;
      noStroke();
      fill(ens[i].iro);
      ellipse(ens[i].x,ens[i].y,ens[i].s,ens[i].s);
    }
  }
}
void mousePressed() {
  for (int i=0; i<count; i++) {
    if (ens[i] == null) {
      color iro = color(random(255),random(255),random(255));
      ens[i] = new Circle(0,random(height),random(10,30),iro);
      ens[i].stat = true;
      break;
    }
  }
}
