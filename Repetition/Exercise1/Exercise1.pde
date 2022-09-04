void setup(){
    size(500, 500);
}

void draw(){
    background(255);
    for (int i=0; i<26; i++) {
        line(i*20, 250, mouseX, mouseY);
    }
}
