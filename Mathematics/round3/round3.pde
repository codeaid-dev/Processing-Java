int points=0;
float radius=1;
float dr=0.1;
void setup() {
  size(500,500);
}

void draw() {
  fill(0,10);
  rect(0,0,width,height);
  noStroke();
  fill(255,200,0);
  ellipse(width/2,height/2,30,30);
  float x = width/2 + radius * cos(points*PI/180);
  float y = height/2 + radius * sin(points*PI/180);
  fill(0,200,200);
  ellipse(x,y,10,10);
  points+=1;
  radius+=dr;
  if (radius>width/2 || radius>height/2)
    dr = -0.5;
  if (radius<0)
    dr = 0.1;
}
