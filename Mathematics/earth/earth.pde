float p=0;
float radius=200;
void setup() {
    size(500,500);
}

void draw() {
    background(0);
    noStroke();
    fill(255,150,0);
    ellipse(width/2,height/2,40,40);
    float x = width/2 + radius * cos(p*PI/180);
    float y = height/2 + radius * sin(p*PI/180);
    fill(0,200,200);
    ellipse(x,y,20,20);
    float mx = x + 30 * cos(p*12*PI/180);
    float my = y + 30 * sin(p*12*PI/180);
    fill(255);
    ellipse(mx,my,5,5);
    p+=0.1;
}
