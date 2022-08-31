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
    ellipse(width/2, height/2, s, s);
}
