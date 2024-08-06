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
    for (int i=2; i<this.r; i++) {
      //fill(this.c,(i-2)*40);
      ellipse(this.x,this.y+i*4,i*2,i*2);
    }
  }
}

Drop[] drops = new Drop[100];

void setup() {
  size(500,500);
}

void draw() {
  background(255);
  for (int i=0; i<drops.length; i++) {
    if (drops[i] == null) {
      drops[i] = new Drop();
      break;
    } else {
      drops[i].move();
      drops[i].display();
      if (drops[i].is_bottom()) {
        drops[i].x=random(width);
        drops[i].y=-drops[i].r*5;
      }
    }
  }
}
