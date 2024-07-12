void setup() {
    size(500,500);
}

void draw() {
    background(255);
    stroke(0);
    noFill();
    drawCircle(width/2,height/2,width);
}

void drawCircle(float x,float y,float radius) {
    ellipse(x,y,radius,radius);
    if (radius > 2) {
        radius *= 0.75;
        drawCircle(x,y,radius);
    }
}
