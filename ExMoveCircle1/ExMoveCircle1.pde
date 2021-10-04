float x, y;
float dx = 2;
float dy = 3;
void setup(){
    size(500, 500);
    x = random(1, 500);
    y = random(1, 500);
}

void draw(){
    background(0);
    x += dx;
    y += dy;
    if (x > width || x < 0) {
        dx *= -1;
    }
    if (y > height || y < 0) {
        dy *= -1;
    }
    ellipse(x, y, 40, 40);
}
