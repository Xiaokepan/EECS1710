PImage ocean, boat;
float x1, y1, x2, y2;
float speedX1, speedX2;

void setup() {
  size(350, 300, P2D);
  boat = loadImage("boat.png");
  boat.resize(boat.width / 4, boat.width / 4);
  
  ocean = loadImage("ocean.jpg");
  imageMode(CENTER);
  
  
  x1 = width/2;
  y1 = height/2;
  x2 = x1 + 10;
  y2 = y1 - 10;
  speedX1 = 1;
  speedX2 = speedX1 * -0.65;
}

void draw() {
  image(ocean, x2, y2);
  image(boat, x1, y1); // the image drawn last will be in front
  
  x1 += speedX1;
  x2 += speedX2;
    
  if (x1 > width || x1 < 0) {
    speedX1 *= -1;  
    speedX2 *= -1;
  }
}
