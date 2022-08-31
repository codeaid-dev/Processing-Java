void setup() {
    size(500, 500);
}
void draw() {
    fill(255);
}
void mousePressed() {
    draw_ufo(mouseX,mouseY);
}
void draw_ufo(float x, float y) {
    strokeWeight(5);
    fill(255);
    ellipse(x-50,y+10,50,50);
    ellipse(x,y+20,50,50);
    ellipse(x+50,y+10,50,50);
    ellipse(x,y,200,50);
    ellipse(x,y-25,120,50);
}
