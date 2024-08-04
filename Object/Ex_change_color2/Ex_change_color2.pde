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
int atari = 0;
float dr=0.1,dg=0.1,db=0.1;
void setup() {
  size(400,400);
  for (int i=0; i<16; i++){
    Circle en = new Circle(50+i%4*100,50+i/4*100,100);
    balls[i] = en;
  }
  atari = (int)random(16);
}
void draw() {
  background(100);
  balls[atari].r += dr;
  if (balls[atari].r < 0 || balls[atari].r > 255)
    dr *= -1;
  balls[atari].g += dg;
  if (balls[atari].g < 0 || balls[atari].g > 255)
    dg *= -1;
  balls[atari].b += db;
  if (balls[atari].b < 0 || balls[atari].b > 255)
    db *= -1;
  for (Circle b : balls) {
    b.display();
  }
}
