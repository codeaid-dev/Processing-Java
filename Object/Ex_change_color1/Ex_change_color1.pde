class Circle{
  float x,y,s,r,g,b;
  Circle(float x,float y,float s){
    this.x = x;
    this.y = y;
    this.s = s;
    this.r = random(256);
    this.g = random(256);
    this.b = random(256);
  }
  void display(){
    fill(this.r,this.g,this.b);
    ellipse(this.x,this.y,this.s,this.s);
  }
}
Circle[] balls = new Circle[16];
void setup() {
  size(400,400);
  for (int i=0; i<16; i++){
    Circle en = new Circle(50+i%4*100,50+i/4*100,100);
    balls[i] = en;
  }
}
void draw() {
  background(100);
  for (Circle b : balls) {
    b.display();
  }
}
