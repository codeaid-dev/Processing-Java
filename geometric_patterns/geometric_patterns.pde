float dir=0;
float radius=125;
void setup() {
    size(500,500);
    background(0);
    noStroke();
}

void draw() {
    float x = width/2 + radius * cos(dir*PI/180);
    float y = height/2 + radius * sin(dir*PI/180);
    fill(255);
    ellipse(x,y,5,5);
    float mx = x + radius * cos((dir*PI/180)*36);
    float my = y + radius * sin((dir*PI/180)*36);
    fill(255,0,0);
    ellipse(mx,my,5,5);
    dir+=0.1;
}
