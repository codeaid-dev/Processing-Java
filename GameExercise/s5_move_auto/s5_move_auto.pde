float x,y;
float dx,dy;
float s=30;
void setup() {
    size(600,600);
    x = width/2;
    y = height/2;
    dx = int(random(2,6));
    dy = int(random(2,6));
}

void draw() {
    background(255);
    x += dx;
    y += dy;
    if (x < s/2 || x > width-s/2)
        dx *= -1;
    if (y < s/2 || y > height-s/2)
        dy *= -1;
    noStroke();
    fill(0,255,0);
    ellipse(x,y,s,s);
}
