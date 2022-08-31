void setup() {
    size(300, 550);
}

void draw() {
    background(0);
    noStroke();
    if (mouseY < height/2) {
        fill(255, 0, 0);
        rect(50, 50, 200, 200);
    } else {
        fill(0, 255, 0);
        rect(50, 300, 200, 200);
    }
}
