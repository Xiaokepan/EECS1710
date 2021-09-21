color bgColor = color(10, 186, 181);
float circleSize = 100;

void setup() {
  size(1000, 750, P2D); // P2D enables 2D GPU acceleration
  background(bgColor);
}

void draw() {  
  if (mousePressed) {
    ellipseMode(CENTER);
    fill(245, 245, 245);
    noStroke();
    line(mouseX, mouseY, pmouseX, pmouseY);
    ellipse(mouseX, mouseY, circleSize*2, circleSize);
  }
}
