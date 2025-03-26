class Tile {
  float x,y;
  color c;
  Tile(float x,float y,color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }
  void draw(color c) {
    if (c==0)
      fill(this.c);
    else
      fill(c); 
    rect(this.x,this.y,100,100);
  }
}

Tile[] tiles = new Tile[6];
color[] colors = {color(255,0,0),
          color(0,255,0),
          color(0,0,255),
          color(255,255,0),
          color(0,255,255),
          color(255,0,255)};

void setup() {
  size(600,400);
  for (int i=1; i<6; i++) {
    int n = int(random(i+1));
    color temp = colors[i];
    colors[i] = colors[n];
    colors[n] = temp;
  }
  for (int i=0; i<6; i++) {
    tiles[i] = new Tile(50+i%3*200,100+i/3*150,colors[i]);
  }
}

void draw() {
  background(255);
  for (Tile t : tiles)
    t.draw(0);

  textAlign(CENTER);
  textSize(30);
  fill(255,0,0);
  text("Memory all",width/2,80);
}
