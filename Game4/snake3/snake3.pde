class Snake {
  float dx,dy;
  ArrayList<PVector> body = new ArrayList<PVector>();
  Snake() {
    for (int i=0; i<5; i++) {
      this.body.add(new PVector(9,9));
    }
    this.dx = 0;
    this.dy = 0;
  }
  void direction(float dx,float dy) {
    this.dx = dx;
    this.dy = dy;
  }
  void move() {
    for (int i=this.body.size()-1; i>0; i--) {
      this.body.get(i).x = this.body.get(i-1).x;
      this.body.get(i).y = this.body.get(i-1).y;
    }
    this.body.get(0).x += this.dx;
    this.body.get(0).y += this.dy;
  }
  void display() {
    fill(0,255,0);
    for (int i=0; i<this.body.size(); i++) {
      rect(this.body.get(i).x*30,this.body.get(i).y*30,30,30);
    }
  }
  boolean collision() {
    for (int i=1; i<this.body.size(); i++) {
      if ((this.dx != 0 || this.dy != 0)
        && this.body.get(0).x == this.body.get(i).x
        && this.body.get(0).y == this.body.get(i).y)
        return true;
    }
    return this.body.get(0).x < 0
        || this.body.get(0).x > 19
        || this.body.get(0).y < 0
        || this.body.get(0).y > 19;
  }
  void add_body() {
    PVector pv = new PVector(this.body.get(body.size()-1).x,
              this.body.get(body.size()-1).y);
    this.body.add(pv);
  }
  boolean eat(PVector food) {
    return this.body.get(0).x == food.x
        && this.body.get(0).y == food.y;
  }
}

class Food {
  int x,y;
  void display() {
    fill(255,0,0);
    rect(this.x*30,this.y*30,30,30);
  }
  void set_position() {
    this.x = int(random(20));
    this.y = int(random(20));
  }
}

Snake snake;
boolean over = false;
Food food;

void setup() {
  frameRate(10);
  size(600,600);
  snake = new Snake();
  food = new Food();
  food.set_position();
}

void draw() {
  stroke(64);
  fill(0);
  for (int y=0; y<20; y++) {
    for (int x=0; x<20; x++) {
      rect(x*30,y*30,30,30);
    }
  }
  if (over) {
    textAlign(CENTER);
    textSize(50);
    fill(255,0,0);
    text("Game Over", width/2,height/2);
    return;
  }
  food.display();
  snake.move();
  snake.display();
  if (snake.collision())
    over = true;
  if (snake.eat(new PVector(food.x,food.y))) {
    snake.add_body();
    food.set_position();
  }
}

void keyPressed() {
  if (keyCode == UP)
    snake.direction(0,-1);
  if (keyCode == DOWN)
    snake.direction(0,1);
  if (keyCode == LEFT)
    snake.direction(-1,0);
  if (keyCode == RIGHT)
    snake.direction(1,0);
}
