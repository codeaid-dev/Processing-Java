float s = 20;
int cs = 3;
void setup() {
    size(500, 500);
}

void draw() {
    background(0);
    s += cs;
    if (s > width || s < 0) {
        cs *= -1;
    }
    if (s > 0 && s < width/3) {
        fill(255,0,0);
    } else if (s > width/3 && s < width/3*2) {
        fill(0,255,0);
    } else if (s > width/3*2) {
        fill(0,0,255);
    }
    ellipse(width/2, height/2, s, s);
}
