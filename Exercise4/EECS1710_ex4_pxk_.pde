PFont Skia,CourierNewPSMT;
float x,y;

void setup() {
  size(600, 400);
  
  Skia = createFont("CourierNewPSMT", 150);
  textFont(Skia);
  fill(0);
  y = height/2;
}

void draw() {
  background(102,0,102);
  
  ellipse(x+40,y-37,140,160);
  fill(255,204,255);
  
  
  text(key,x, y);
  fill(255,51,255);
  
  x = x - 10;
  
  if(x < - 60){
    x = 850;
  }
  

   

}

  void keyPressed(){
    y = random(50,350);
    println(y);
  }
