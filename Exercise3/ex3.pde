PVector position;

void setup() { 
  size(800, 600, P2D);
  
  position = new PVector(width/2, height/2);
  
  ellipseMode(CENTER);
}

void draw() {
  background(127);
  noStroke();
  fill(255,0,255);
  ellipse(position.x, position.y, 480, 480);
  fill(0,127,255);
  ellipse(position.x, position.y, 380, 380);
  fill(0,0,0);
  ellipse(position.x, position.y, 20+second()*6, 20+second()*6);
  fill(0,255,0);
  rect((position.x+190*cos(((minute()-15)*6*PI)/180))-40, (position.y+190*sin(((minute()-15)*6*PI)/180))-40,80,80);
  //rect(position.x, position.y,80,80);
  
  fill(255,255,0);
  ellipse((position.x+240*cos(((hour()-15)*30*PI)/180)), (position.y+240*sin(((hour()-15)*30*PI)/180)),100,100);
  
}
