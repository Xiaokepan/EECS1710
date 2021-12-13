import processing.sound.*;
import gifAnimation.*;
SoundFile file,file1,file2,file3;
Gif gif1,gif2,gif3,gif;
int timer;
int fire = 1;
PFont f;
boolean statethree;
PVector position,ball;
int nowtime;
void setup() {
  size(800, 600, P2D);
  position = new PVector(width/2, height/2);
  
  file1 = new SoundFile(this, "m1.wav");
  file2 = new SoundFile(this, "m2.wav");
  file3 = new SoundFile(this, "m3.wav");
  gif1 = new Gif(this, "two.gif");
  gif2 = new Gif(this, "one.gif");
  gif3 = new Gif(this, "three.gif");
  


  imageMode(CENTER);
  ellipseMode(CENTER);
  noCursor();
f = createFont("Arial",25,true);
} 

void draw() {
    background(0);
    timer = second();
    println(fire);
    //println(nowtime);
    
    fill(60,0,40); //table
    ellipse(400,600, 1200, 200); 
    
  if(fire == 0){
    
    fill(255,0,255); //ball1
    ellipse(200,600, 80, 80); 
    
    fill(255,178,102); //ball2
    ellipse(400,600, 80, 80); 
    
    fill(51,255,255); //ball3
    ellipse(600,600, 80, 80); 
  }      
  
    if(fire == 1){
    
    fill(255,0,255); //ball1
    ellipse(400,500, 80, 80); 
    
    fill(255,178,102); //ball2
    ellipse(400,600, 80, 80); 
    
    fill(51,255,255); //ball3
    ellipse(600,600, 80, 80); 
  }      
  
    if(fire == 2){
    
    fill(255,0,255); //ball1
    ellipse(200,600, 80, 80); 
    
    fill(255,178,102); //ball2
    ellipse(400,500, 80, 80); 
    
    fill(51,255,255); //ball3
    ellipse(600,600, 80, 80); 
  }      
  
    if(fire == 3){
    
    fill(255,0,255); //ball1
    ellipse(200,600, 80, 80); 
    
    fill(255,178,102); //ball2
    ellipse(400,600, 80, 80); 
    
    fill(51,255,255); //ball3
    ellipse(400,500, 80, 80); 
  }      
  
  
    gif1.play();
    gif2.play();  
    gif3.play();
    
   if(fire == 1 ){
     gif = gif1;
     file = file2;
   }
      if(fire ==2 ){
     gif = gif2;
     file = file1;
   }
      if(fire == 3) {
     gif = gif3;
     file = file3;
   }


    if(mousePressed){
         position.x = mouseX;
         position.y = mouseY;
         nowtime = timer;
         if(nowtime > 56){
           nowtime = 0;
         }
         file.play();

  }
        if(nowtime+3<timer){
          position.x = -100;
          position.y = -100;
         }
    image(gif,position.x,position.y,300,300);
    
      fill(255,255,255);
      textAlign(LEFT);
      textFont(f);
      text("press 1,2,3 can choice mode,then press mouse in the screen.",0,30);

}

void keyPressed() {
    if ((key == '0')) {
     fire = 0;
  }
  if ((key == '1')) {
     fire = 1;
  }
    if ((key == '2')) {
     fire = 2;
  }
    if ((key == '3')) {
     fire = 3;
  }
  
}
