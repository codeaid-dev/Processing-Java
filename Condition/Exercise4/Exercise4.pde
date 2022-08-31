float x=250,y=25;
void setup() {
    size(500,500);
}

void draw() {
    background(255);
    fill(0);
    y += 3;
    if (y-25 > height) {
        y = -25;
        x = random(25,width-25);
    }
    ellipse(x,y,50,50);
}
