float x=0,y=0;
int speed = 5;
int state = 0;
float w=100,h=100;

void setup() {
    size(500,500);
}

void draw() {
    background(255);
    noStroke();
    fill(0);
    rect(x,y,w,h);
    if (state == 0) {
        x += speed;
        if (x>width-w) {
            x = width-w;
            state = 1;
        }
    } else if (state == 1) {
        y += speed;
        if (y>height-h) {
            y = height-h;
            state = 2;
        }
    } else if (state == 2) {
        x -= speed;
        if (x<0) {
            x = 0;
            state = 3;
        }
    } else if (state == 3) {
        y -= speed;
        if (y<0) {
            y = 0;
            state = 0;
        }
    }
}
