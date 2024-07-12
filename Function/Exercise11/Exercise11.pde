float x = 0, y = 0;
float ox = 0, oy = 0;
boolean status = false;

void setup() {
    size(500,500);
    x = width/2;
    y = height/2;
}

void draw() {
    background(255);
    fill(0);
    ellipse(x,y,50,50);
}

void mousePressed() {
    float d = dist(mouseX,mouseY,x,y);
    if (d < 25) {
        ox = mouseX;
        oy = mouseY;
        status = true;
    } else {
        status = false;
    }
}

void mouseDragged() {
    if (status) {
        float mx = mouseX - ox;
        float my = mouseY - oy;
        x += mx;
        y += my;
        ox = mouseX;
        oy = mouseY;
      }
}
