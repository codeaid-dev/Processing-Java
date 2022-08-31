float x=250,y=250;
int dx=2,dy=3;
void setup() {
    size(500,500);
}

void draw() {
    background(200);
    fill(255);
    x += dx;
    y += dy;
    if (x-100<0 || x+100>width)
        dx *= -1;
    if (y-50<0 || y+50>height)
        dy *= -1;
    draw_ufo();
}

void draw_ufo() {
    strokeWeight(5);
    fill(255);
    ellipse(x-50,y+10,50,50);
    ellipse(x,y+20,50,50);
    ellipse(x+50,y+10,50,50);
    ellipse(x,y,200,50);
    ellipse(x,y-25,120,50);
}
