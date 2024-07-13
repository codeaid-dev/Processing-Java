int p=0;
float radius=200;
void setup() {
  size(500,500);
}

void draw() {
  background(255);
  noStroke();
  fill(255,200,0);
  ellipse(width/2,height/2,30,30);
  float x = width/2 + radius * cos(p*PI/180);
  float y = height/2 + radius * sin(p*PI/180);
  fill(0,200,200);
  ellipse(x,y,50,50);
  p+=1;
}
