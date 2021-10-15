int peoplenum = 30;
PVector[] position = new PVector[peoplenum];
int[] size = new int[peoplenum];
PImage img, green;

void setup() { 
  size(800, 600, P2D);
  
  for(int n = 0; n < peoplenum; n ++){
    
    position[n] = new PVector(random(800),random(600));
    size[n] = 10;
    
    img = loadImage("space.jpg");
    green = loadImage("download.png");
    imageMode(CENTER);
  }
  
  ellipseMode(CENTER);
}  
  void draw() {
   background(0);
  
   image(img,width/2, height/2);
   for(int n = 0; n < peoplenum; n ++){
    
   position[n].x = random(10)- 5 + position[n].x;
   position[n].y = random(10)- 5 + position[n].y;
     
   image(green,position[n].x,position[n].y,size[n],size[n]);
  
   for(int i = 0; i < peoplenum; i ++){
     if(i == n){
     }
     
     else{
        if(position[n].dist(position[i]) < size[n]){
       size[n] = size[n] + 3;
       size[i] = 10;
       position[i].x = random(800);
       position[i].y = random(600);}
     }}}
   } 
  
  
  
