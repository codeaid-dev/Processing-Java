void setup() {
    size(600, 400);
}
void draw() {
  String[] weeks = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};
  background(255);
  for (int i=0; i<weeks.length; i++) {
    fill(0);
    textSize(30);
    textAlign(CENTER);
    text(weeks[i], 75+i*75, 200);
  }
}
