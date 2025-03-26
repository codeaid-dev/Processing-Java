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
    return this.body.get(0).x < 0
        || this.body.get(0).x > 19
        || this.body.get(0).y < 0
        || this.body.get(0).y > 19;
  }
}

Snake snake;
boolean over = false;

void setup() {
  frameRate(10);
  size(600,600);
  snake = new Snake();
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
  snake.move();
  snake.display();
  if (snake.collision())
    over = true;
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
