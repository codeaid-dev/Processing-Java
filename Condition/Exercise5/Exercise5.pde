void setup() {
    size(500,500);
}

void draw() {
    background(255);
    if (frameCount % 60 == 0) {
        float r=random(256);
        float g=random(256);
        float b=random(256);
        fill(r,g,b);
    }
    ellipse(width/2,height/2,400,400);
}
