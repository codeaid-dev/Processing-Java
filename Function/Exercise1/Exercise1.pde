void setup() {
    size(300, 300);
    background(255);
    mato(80, 150, 100);
    mato(220, 150, 100);
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
