String[] seasons = {"Spring","Summer","Autumn","Winter"};
void setup() {
  size(600,400);
  textSize(30);
  fill(0);
}

void draw() {
  background(255);
  for (int i=0; i<seasons.length; i++) {
    text(seasons[i],i*width/4+30,(i+1)*height/4-50);
  }
}
