float x1=100,y1=100,x2=400,y2=400;
int dx1=2,dy1=3,dx2=2,dy2=3;

void setup() {
    size(500,500);
    strokeWeight(5);
    stroke(255);
}

void draw() {
    background(0);
    x1 += dx1;
    y1 += dy1;
    x2 += dx2;
    y2 += dy2;
    if (x1 > width || x1 < 0) {
        dx1 *= -1;
    }
    if (x2 > width || x2 < 0) {
        dx2 *= -1;
    }
    if (y1 > height || y1 < 0) {
        dy1 *= -1;
    }
    if (y2 > height || y2 < 0) {
        dy2 *= -1;
    }

    line(x1, y1, x2, y2);
}
