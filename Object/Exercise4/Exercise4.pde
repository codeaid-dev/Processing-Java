class Ball{
  float r,x,y,xspeed,yspeed;
  color c;
  Ball(float r){
    this.r = r;
    this.x = random(this.r,width-this.r);
    this.y = random(this.r,height-this.r);
    this.xspeed = random(-5,5);
    this.yspeed = random(-5,5);
    this.c = color(100,50);
  }
  void move(){
    this.x += this.xspeed;
    this.y += this.yspeed;
    if (this.x+this.r>width || this.x-this.r<0)
      this.xspeed *= -1;
    if (this.y+this.r>height || this.y-this.r<0)
      this.yspeed *= -1;
  }
  void display(){
    stroke(0);
    fill(this.c);
    ellipse(this.x,this.y,this.r*2,this.r*2);
    this.c = color(100,50);
  }
  void highlight(){
    this.c = color(0,150);
  }
  boolean intersect(Ball b){
    float distance = dist(this.x,this.y,b.x,b.y);
    if (distance<this.r+b.r)
      return true;
    return false;
  }
}
Ball ball1;
Ball ball2;
void setup() {
    size(500,500);
    ball1 = new Ball(64);
    ball2 = new Ball(32);
}
void draw() {
    background(255);
    ball1.move();
    ball2.move();
    if (ball1.intersect(ball2)){
      ball1.highlight();
      ball2.highlight();
    }
    ball1.display();
    ball2.display();
}
