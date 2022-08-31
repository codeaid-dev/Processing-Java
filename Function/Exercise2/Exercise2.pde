void setup() {
    size(400, 200);
    textSize(30);
}
void draw() {
    background(0);
    textAlign(LEFT);
    text("mouseX =", 50, 80);
    text("mouseY =", 50, 120);
    textAlign(RIGHT);
    text(mouseX, 300, 80);
    text(mouseY, 300, 120);
}
