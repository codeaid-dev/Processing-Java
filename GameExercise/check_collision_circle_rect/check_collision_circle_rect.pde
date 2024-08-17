class Circle {
  float x,y,r,sx,sy;
  Circle(int x,int y) {
    this.x = x;
    this.y = y;
    this.r = 15;
    this.sx = 0;
    this.sy = 0;
  }
  void move(float x,float y) {
    this.sx += x;
    this.sy += y;
    this.sx *= 0.98;
    this.sy *= 0.98;
    this.x += this.sx;
    this.y += this.sy;
  }
  boolean collide_wall() {
    return x<r ||
      x>(width-r) ||
      y<r ||
      y>(height-r);
  }
  boolean collide_rect(float rx,float ry,float rw,float rh) {
    float closestX,closestY;
    if (x < rx) {
        closestX = rx;
    } else if (x > rx+rw) {
        closestX = rx+rw;
    } else {
        closestX = x;
    }
    if (y < ry) {
        closestY = ry;
    } else if (y > ry+rh) {
        closestY = ry+rh;
    } else {
        closestY = y;
    }
    float distanceX = x-closestX;
    float distanceY = y-closestY;
    float distance = sqrt(distanceX*distanceX + distanceY*distanceY);
    return distance < r;
  }
  void display() {
    fill(0);
    ellipse(x,y,r*2,r*2);
  }
}
Circle player;
boolean gameOver = false;
boolean r1=false,r2=false;

void setup() {
    size(600, 400);
    player = new Circle(width/2,height/2);
}

void draw() {
    background(255);
    fill(255);
    if (player.collide_rect(50,50,100,100))
        r1 = true;
    if (r1) {
        fill(255,0,0);
    } else {
        fill(255);
    }
    rect(50, 50, 100, 100);

    if (player.collide_rect(450,250,100,100))
        r2 = true;
    if (r2) {
        fill(0,0,255);
    } else {
        fill(255);
    }
    rect(450, 250, 100, 100);

    player.display();

    if (r1 && r2) {
        textSize(50);
        textAlign(CENTER);
        text("Great!", 300, 200);
        return;
    }
        
    if (gameOver) {
        textSize(50);
        textAlign(CENTER);
        text("Fail...", 300, 200);
        return;
    }

    if (keyPressed) {
        if (keyCode == UP)
            player.move(0,-1);
        if (keyCode == DOWN)
            player.move(0,1);
        if (keyCode == LEFT)
            player.move(-1,0);
        if (keyCode == RIGHT)
            player.move(1,0);
    }

    player.move(0,0);

    if (player.collide_wall())
        gameOver = true;
}
