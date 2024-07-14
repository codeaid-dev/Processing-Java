int radius = 255;
color rgb[] = {color(255,0,0),
       color(255,165,0),
       color(255,255,0),
       color(0,128,0),
       color(0,255,255),
       color(0,0,255),
       color(128,0,128)};

void setup() {
  size(500,300);
  background(255);
//  colorMode(HSB,7,255,255);
}

void draw() {
  if (radius > 185) {
    int index = (255-radius)/10;
//    color c = color(index,255,255);
    for (int i=180; i<360; i++) {
      float x = width/2 + radius*cos(radians(i));
      float y = height + radius*sin(radians(i));
      strokeWeight(5);
      stroke(rgb[index]);
//        stroke(c);
      point(x,y);
    }
    radius -= 1;
  }
}
