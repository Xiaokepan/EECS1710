import gifAnimation.*;
import processing.sound.*;

Gif gif, tar;
Boolean isattack;
PVector position;
int w = 800;

float maxThreshold = 0.2;
boolean ifatt = false;
void setup() {  
  size(800, 600, P2D);
    setupSound();
  gif = new Gif(this, "superman.gif");
  position = new PVector(800, height/2);
  tar = new Gif(this, "m.gif");
  imageMode(CENTER);
  noCursor();

  
}


void draw() {
    updateSound();
  float getAmp = getAmp();
  background(0);
  //gif.jump(0);
  
  image(gif, width/6, height/2, 200, 200);
  image(tar, position.x, position.y, 80, 80);
  position.x = position.x - 3;
  if(position.x < -50){
    position.x = 850;
    position.y = height/2;
  }
  tar.play();
  if (getAmp > maxThreshold) {

      gif.play();
      isattack = true;
  }
  else{
   isattack = false; 
  }
  

  if(isattack &&  position.x < width/6 ){
    ifatt = true;
  }
  if(ifatt){
    position.x += 20;
    position.y -= 20;
  }
  if(position.y < -50){
    ifatt = false;
  }
  


 
} 

 
