float x=0, y=0;
void setup() {
    size(500, 500);
    background(0);
    fill(255, 255, 0);
}
void draw() {
}
void mousePressed() {
    x = mouseX;
    y = mouseY;
}
void mouseDragged() {
    float dst = dist(x, y, mouseX, mouseY);
    ellipse(x, y, dst*2, dst*2);
}
