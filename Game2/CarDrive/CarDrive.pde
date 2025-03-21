class Car {
  float x,y,yspeed;
  color c;
  Car(float x,float y,color c) {
    this.x = x;
    this.y = y;
    this.c = c;
    this.yspeed = random(1,6);
  }

  void display() {
      strokeWeight(8);
      line(this.x-10,this.y-20,this.x-10,this.y-5);
      line(this.x-10,this.y+5,this.x-10,this.y+20);
      line(this.x+10,this.y-20,this.x+10,this.y-5);
      line(this.x+10,this.y+5,this.x+10,this.y+20);
      strokeWeight(1);
      fill(this.c);
      ellipse(this.x,this.y,20,50);
  }

  void move_x(float mx) {
    this.x += mx;
    if (this.x<=0 || this.x>=width)
      this.x += mx*-1;
  }
 
  void move_y(float my) {
    if (my == 0)
      this.y += this.yspeed;
    else
      this.y += my;
  }

  boolean is_hit(Car obj) {
    if (this.x-10<obj.x+10 && this.x+10>obj.x-10 &&
    this.y-20<obj.y+20 && this.y+20>obj.y-20)
      return true;
    else
      return false;
  }
}

float x=150,y=200;
Car car;
ArrayList<Car> cars = new ArrayList<Car>();
boolean over = false;
int time = 0;
void setup() {
  size(300,400);
  car = new Car(x,y,color(255));
}

void draw() {
  background(200);
  car.display();
  if (over) {
    textSize(20);
    textAlign(CENTER);
    text("GAME OVER", width/2, 150);
    text("Time: "+time,width/2,180);
    return;
  }

  if (frameCount % 50 == 0) {
    int pos = int(random(1,4));
    color col = color(random(256),random(256),random(256));
    cars.add(new Car(pos*width/4,25,col));
  }

  for (Car c : cars) {
    c.move_y(0);
    c.display();
    if (car.is_hit(c)) {
      time = frameCount/60;
      over = true;
      return;
    }
  }
}

void keyPressed() {
  if (keyCode == LEFT)
    car.move_x(-width/4);
  if (keyCode == RIGHT)
    car.move_x(width/4);
  if (keyCode == UP)
    car.move_y(-20);
  if (keyCode == DOWN)
    car.move_y(20);
}
