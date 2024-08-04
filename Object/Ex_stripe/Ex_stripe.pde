class Stripe{
  float x,speed,w;
  boolean mouse;
  Stripe(){
    this.x = 0;
    this.speed = random(1);
    this.w = random(30,100);
    this.mouse = false;
  }
  void display(){
    if (this.mouse)
      fill(255,0,0);
    else
      fill(255,100);
    noStroke();
    rect(this.x,0,this.w,height);
  }
  void move(){
    this.x += this.speed;
    if (this.x>width)
      this.x = -this.w;
  }
  void rollover(float mx){
    if (mx>this.x && mx<this.x+this.w)
      this.mouse = true;
    else
      this.mouse = false;
  }
}
Stripe[] stripes = new Stripe[10];
void setup() {
  size(500,500);
  for (int i=0; i<10; i++){
    stripes[i] = new Stripe();
  }
}
void draw() {
  background(100);
  for (Stripe s : stripes) {
    s.rollover(mouseX);
    s.move();
    s.display();
  }
}
