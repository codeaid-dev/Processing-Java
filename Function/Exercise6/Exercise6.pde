int move = 1;
float x = 100;
void setup() {
    size(500, 500);
}
void draw() {
    x += move;
    background(255);
    mato(x, height/2, 100);
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
