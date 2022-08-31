void setup() {
    size(500, 500);
    strokeWeight(5);
}
void draw() {
    line(pmouseX, pmouseY, mouseX, mouseY);
}
