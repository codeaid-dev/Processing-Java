ArrayList<Float> x = new ArrayList<Float>();
ArrayList<Float> y = new ArrayList<Float>();
ArrayList<Float> radius = new ArrayList<Float>();

void setup() {
    size(500,500);
    noStroke();
}

void draw() {
    background(0);
    for (int n=0; n<x.size(); n++) {
        fill(255,255,0);
        ellipse(x.get(n),y.get(n),radius.get(n),radius.get(n));
    }
}

void mousePressed() {
    x.add((float)mouseX);
    y.add((float)mouseY);
    radius.add(0.0);
}

void mouseDragged() {
    float dst = dist(x.get(x.size()-1),y.get(y.size()-1),mouseX,mouseY);
    radius.set(radius.size()-1,dst*2);
}
