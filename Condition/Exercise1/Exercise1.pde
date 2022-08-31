void setup() {
    size(500, 500);
}

void draw() {
    if (mousePressed) {
        line(pmouseX, pmouseY, mouseX, mouseY);
    }
}
