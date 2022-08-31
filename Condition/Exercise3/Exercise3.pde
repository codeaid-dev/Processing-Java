void setup() {
    size(900, 300);
}

void draw() {
    background(255);
    stroke(0);
    strokeWeight(300);
    line(150,150,750,150);
    noStroke();
    if (mouseX > width/3*2) {
        fill(255, 0, 0);
        ellipse(width/6*5, height/2, 250, 250);
    } else if (mouseX > width/3) {
        fill(255, 255, 0);
        ellipse(width/6*3, height/2, 250, 250);
    } else {
        fill(0, 255, 0);
        ellipse(width/6, height/2, 250, 250);
    }
}
