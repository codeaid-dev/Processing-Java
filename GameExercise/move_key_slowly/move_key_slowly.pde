float x,y;
float dx=5,dy=5;
void setup() {
    size(600,600);
}

void draw() {
    background(255);
    if (keyPressed) {
        if (keyCode == UP)
            dy -= 1;
        if (keyCode == DOWN)
            dy += 1;
        if (keyCode == LEFT)
            dx -= 1;
        if (keyCode == RIGHT)
            dx += 1;
    }
    dx *= 0.98;
    dy *= 0.98;
    x += dx;
    y += dy;
    if (x < 50)
        x = 50;
    if (x > width-50)
        x = width-50;
    if (y < 50)
        y = 50;
    if (y > height-50)
        y = height-50;

    fill(0);
    ellipse(x,y,100,100);
}
