void setup() {
    size(500, 500);
}
void draw() {
    background(255);
    float x = mouseX;
    float y = mouseY;
    mato(x-70, y, 100);
    mato(x+70, y, 100);
}
void mato(float x, float y, float w) {
    fill(255);
    strokeWeight(w/10);
    ellipse(x, y, w, w);
    strokeWeight(w/20);
    ellipse(x, y, w/6*4, w/6*4);
    strokeWeight(w/10);
    ellipse(x, y, w/3.5, w/3.5);
}
