void setup() {
    size(700, 700);
}
void draw() {
    background(255);
    noStroke();
    for (int i=0; i<10; i++) {
        for (int j=0; j<10; j++) {
            fill(0);
            float x = 55 + 60 * i;
            float y = 55 + 60 * j;
            rect(x, y, 50, 50);
        }
    }
}
