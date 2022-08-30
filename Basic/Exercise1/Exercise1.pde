size(500, 500);
textSize(30);
stroke(255, 0, 0);
fill(255, 0, 0);
strokeWeight(5);
line(250, 100, 250, 400);
triangle(250, 100, 230, 150, 270, 150);
line(100, 250, 400, 250);

fill(0);
textAlign(CENTER);
text("NORTH", 250, 50);
text("SOUTH", 250, 450);

textAlign(RIGHT);
text("WEST", 100, 250);

textAlign(LEFT);
text("EAST", 400, 250);
