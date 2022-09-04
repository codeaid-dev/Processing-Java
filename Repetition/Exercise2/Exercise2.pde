void setup(){
    size(500, 500);
}

void draw(){
    background(255);
    for (int x=0; x<26; x++) {
        for (int y=0; y<26; y++) {
            line(x*20, y*20, mouseX, mouseY);
        }
    }
}
