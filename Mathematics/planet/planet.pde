float dir=0;
float rw = 200; // rw:横半径
float rh = 50; // rh:縦半径
void setup() {
    size(500,500);
}

void draw() {
    background(0);
    noStroke();
    fill(255,150,0);
    ellipse(width/2,height/2,200,200);
    float x = width/2 + rw * cos(dir*PI/180);
    float y = height/2 + rh * sin(dir*PI/180);
    fill(0,200,200);
    ellipse(x,y,20,20);
    fill(255,150,0);
    dir+=0.5;
}
