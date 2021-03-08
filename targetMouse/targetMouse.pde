void setup(){
    size(500, 500);
}

void draw(){
    background(0);
    fill(128);
    rect(width/4, height/4, width/2, height/2);
    stroke(255);
    if (mousePressed){
        if (mouseX > width/4 && mouseX < width/4*3 && mouseY > height/4 && mouseY < height/4*3){
            fill(255, 0, 0);
        } else{
            fill(0, 255, 0);
        }
    } else{
        noFill();
    }
    ellipse(mouseX, mouseY, 50, 50);
    noFill();
    ellipse(mouseX, mouseY, 20, 20);
    line(0, mouseY, width, mouseY);
    line(mouseX, 0, mouseX, height);
}
