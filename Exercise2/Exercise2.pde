PImage forest, forest_back;
float x1, y1, x2, y2;
float speedX1, speedX2;

void setup() {
  size(800, 600, P2D);
  forest = loadImage("forest2.png");
  forest.resize(forest.width * (height / forest.height), height);
  forest_back = loadImage("forest.jpg");
  forest_back.resize(forest.width * (height / forest.height), height);
  forest_back.filter(BLUR, 6);
  imageMode(CENTER);
  
  
  x1 = width/2;
  y1 = height/2;
  x2 = x1 + 50;
  y2 = y1 - 50;
  speedX1 = 3;
  speedX2 = speedX1 * -0.65;
}

void draw() {
  image(forest_back, x2, y2);
  image(forest, x1, y1); // the image drawn last will be in front
  
  x1 += speedX1;
  x2 += speedX2;
    
  if (x1 > width || x1 < 0) {
    speedX1 *= -1;  
    speedX2 *= -1;
  }
}
