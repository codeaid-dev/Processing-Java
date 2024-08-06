class Drop {
  int r;
  float x,y,speed;
  color c;
  Drop() {
    this.r=8;
    this.x=random(width);
    this.y=-this.r;
    this.speed=random(1,5);
    this.c=color(0,200,200);
  }

  void move() {
    this.y+=this.speed;
  }

  boolean is_bottom() {
    return this.y>height+this.r;
  }

  void display() {
    fill(this.c);
    noStroke();
    ellipse(this.x,this.y,this.r*2,this.r*2);
  }
}

Drop[] drops = new Drop[50];

void setup() {
  size(500,500);
  for (int i=0; i<50; i++) {
    drops[i] = new Drop();
  }
}

void draw() {
  background(255);
  for (Drop d : drops) {
    d.move();
    d.display();
  }
}
