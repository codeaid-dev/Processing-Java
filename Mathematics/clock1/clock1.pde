void setup() {
    size(500,500);
}

void draw() {
    float s = second();
    float m = minute();
    float h = hour() % 12;
    float hangle = h*30-90;
    float mangle = m*6-90;
    float sangle = s*6-90;
    background(255);
    strokeWeight(5);
    float hx = width/2+150*cos(radians(hangle));
    float hy = height/2+150*sin(radians(hangle));
    line(width/2,height/2,hx,hy);
    strokeWeight(3);
    float mx = width/2+200*cos(radians(mangle));
    float my = height/2+200*sin(radians(mangle));
    line(width/2,height/2,mx,my);
    strokeWeight(2);
    float sx = width/2+200*cos(radians(sangle));
    float sy = height/2+200*sin(radians(sangle));
    line(width/2,height/2,sx,sy);
}
