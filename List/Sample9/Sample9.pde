void setup() {
    size(500, 500);
    textSize(30);
}
void draw() {
  String[][] number = {{"One","Two","Three"},
                     {"Four","Five","Six"},{"Seven","Eight","Nine"}};
  for (int i=0; i<3; i++) {
    for (int j=0; j<3; j++) {
      float x = (j+1)*width/4;
      float y = (i+1)*height/4;
      textAlign(CENTER);
      text(number[i][j], x, y);
    }
  }
}
