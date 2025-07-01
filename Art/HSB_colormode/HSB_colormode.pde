void setup(){
  size(720,200);
  colorMode(HSB,360,100,100);
}
void draw(){
  for (int i=0; i<360; i++){
    strokeWeight(2);
    stroke(i,100,100);
    line(i*2,0,i*2,height);
  }
}
