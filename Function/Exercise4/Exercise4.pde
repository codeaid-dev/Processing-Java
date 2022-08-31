float y = 0;
int s = 10;
void setup() {
    size(200, 500);
}
void draw() {
    background(255);
    y += 2;
    s += 1;
    fill(255,0,0);
    ellipse(width/2, y, s, s);
}
