float x=50,y=50;
boolean button = false;

void setup() {
    size(300,300);
    strokeWeight(5);
}

void draw() {
    if (button) {
        background(255);
        stroke(0);
    } else {
        background(0);
        stroke(255);
    }
    fill(128);
    rect(x,y,200,100);
}

void mousePressed() {
    if (mouseX>x && mouseX<x+200 && mouseY>y && mouseY<y+100) {
        button = !button;
    }
}
