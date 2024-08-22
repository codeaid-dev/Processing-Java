//float dir = int(random(360));
float dir = random(TWO_PI);
float x=250,y=250;
int speed = 5;
void setup() {
    size(500,500);
}

void draw() {
    background(255);
//    x += speed * cos(radians(dir));
//    y += speed * sin(radians(dir));
    x += speed * cos(dir);
    y += speed * sin(dir);
    fill(0);
    ellipse(x,y,30,30);
    if (x < 15 || x > width-15) {
//        dir = 180-dir;
        dir = PI-dir;
    }
    if (y < 15 || y > height-15) {
        dir *= -1;
    }
}
