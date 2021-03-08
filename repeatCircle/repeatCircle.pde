void setup(){
    size(300, 300);
}

void draw(){
    int cs = 30;
    float spaceX = (width-cs*5)/6;
    float spaceY = (height-cs*5)/6;
    background(255);
    fill(0);
    for (int x=0; x < 5; x++){
        for (int y=0; y < 5; y++){
            ellipse(x*(spaceX+cs)+spaceX+cs/2, y*(spaceY+cs)+spaceY+cs/2, cs, cs);
        }
    }
}
