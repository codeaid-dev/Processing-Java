float x=50,y=50;
int speed = 3;
void setup() {
    size(500,500);
}

void draw() {
    background(255);
    fill(255,0,0);
    rect(150,150,200,200);
    if (keyPressed) {
        if (keyCode == LEFT) {
            x -= speed;
            if (x-25 < 0)
                x += speed;
        } else if (keyCode == RIGHT) {
            x += speed;
            if (x+25 > width)
                x -= speed;
        } else if (keyCode == UP) {
            y -= speed;
            if (y-25 < 0)
                y += speed;
        } else if (keyCode == DOWN) {
            y += speed;
            if (y+25 > height)
                y -= speed;
        }
        if (x+25>150 && x-25<350 && y+25>150 && y-25<350) {
            if (keyCode == LEFT)
                x += speed;
            if (keyCode == RIGHT)
                x -= speed;
            if (keyCode == UP)
                y += speed;
            if (keyCode == DOWN)
                y -= speed;
        }
    }
    fill(0);
    ellipse(x,y,50,50);
}
