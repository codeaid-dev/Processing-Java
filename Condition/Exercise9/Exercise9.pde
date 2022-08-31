float x=250, y=250;
int dx=2, dy=3;

void setup() {
    size(500, 500);
}

void draw() {
    background(0);
    x += dx;
    y += dy;
    if (x+25 > width || x-25 < 0) {
        dx *= -1;
    }
    if (y+25 > height || y-25 < 0) {
        dy *= -1;
    }

    if (x<width/2 && y<height/2) {
        fill(255,0,0);
    } else if (x>width/2 && y<height/2) {
        fill(0,255,0);
    } else if (x<width/2 && y>height/2) {
        fill(255,255,0);
    } else if (x>width/2 && y>height/2) {
        fill(0,0,255);
    }

    ellipse(x, y, 50, 50);
}
