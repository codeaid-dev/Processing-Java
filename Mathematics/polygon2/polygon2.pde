float[] px = new float[5];
float[] py = new float[5];

void setup() {
  size(500,500);
}

void draw() {
  background(255);
  polygon(width/2,height/2,100,5);
}

void polygon(float x,float y,float radius,int points) {
  for (int i=0; i<points; i++) {
    px[i] = x + radius * cos(i * TWO_PI/points);
    py[i] = y + radius * sin(i * TWO_PI/points);
  }
  int n = px.length;
  for (int i=0; i<n; i++) {
    line(px[i%n],py[i%n],px[(i+1)%n],py[(i+1)%n]);
  }
}
